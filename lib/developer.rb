class Developer
  attr_reader :quality_upcoming, :quality_inversion
  attr_reader :qualities

  def initialize
    @quality_upcoming = false
    @quality_inversion = false
    @qualities = {included: [], excluded: []}
  end

  def you; self; end
  def not; @quality_inversion = true; self; end
  def is value; value; end
  def well; :well ; end

  def and(&block)
    instance_eval &block if block_given?
    self
  end

  def if(_, &block)
    instance_eval &block if block_given?
    self
  end

  def in(container)
    including = quality_inversion ? :excluded : :included
    @qualities[including].push(container)
    self
  end

  def your(*args)
    @quality_upcoming = true
    self
  end

  def method_missing(name, *args)
    return self if name == :you

    if quality_upcoming
      set_qualities(name, args)
      return self
    end

    if args.count > 0
      set_qualities(name, args)
      return self
    else
      set_quality(name)
      return self
    end
  end

  private

  def set_qualities(name, qualities)
    @qualities[name] ||= []
    @qualities[name].push *qualities
  end

  def set_quality(name)
    if quality_upcoming
      @upcoming_quality_name = name
    else
      @qualities[name] = quality_inversion ? false : true
      @quality_inversion = false
      @quality_upcoming = false
    end
  end
end

# class Developer
#   # Put your code here
# end

# class DataBase
#   def find_developer(platform: :ruby, region: :london)
#     all_developers(platform, region).select do |you|
#       you.are.crazy
#          .and { you.are.not.in :plumbee }
#          .and { you.love 'ruby', 'rails' }
#          .and { want 'fun', 'money' }
#          .and { your.skill_level is :high }
#          .and.if you do
#             your work well
#           end
#     end
#   end

#   private

#   def all_developers(*_)
#     [Developer.new]
#   end
# End
