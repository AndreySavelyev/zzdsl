class Developer2
  attr_reader :waiting_for_quality, :waiting_for_inverted_quality, :check_failed

  def initialize(qualities)
    @qualities = qualities
    @check_failed = false
  end

  def you
    self
  end

  def are
    @waiting_for_quality = true
    self
  end

  def not
    @waiting_for_inverted_quality = true
    self
  end

  def method_missing(name, *args)
    puts "DEBUG: meth: #{name}"
    check_quality(name) if waiting_for_quality
    check_inverted_quality(name) if waiting_for_inverted_quality
  end

  private

  def check_quality(name)
    @waiting_for_quality = false
    if @qualities[name] != true
      @check_failed = true
      return self
    end
  end

  def check_inverted_quality(name)
    @waiting_for_inverted_quality = false
    if @qualities[name] == true
      @check_failed = true
      return self
    end
  end

end


# Developer2.new(
#   qualities: {crazy: true, ugly: false},
#   included: {:greenpeace},
#   excluded: {:plumbee},
#   love: ['pizza', 'cats'],
#   want: ['money'],
#   skill_level: :high,
#   work: :well
# )
