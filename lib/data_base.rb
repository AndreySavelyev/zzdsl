class DataBase

  def find_developer(platform: :ruby, region: :london)
    all_developers(platform, region).select do |you|
      you.are.crazy
         .and { you.are.not.in :plumbee }
         .and { you.love 'ruby', 'rails' }
         .and { want 'fun', 'money' }
         .and { your.skill_level is :high }
         .and.if you do
            your work well
          end
    end
  end


  private

  def all_developers(*_)
    [Developer.new]
  end
end


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
