class DataBase

  def find_developer(platform:, region:)
    all_developers(platform, region)
  end

  private

  def all_developers(*_)
    []
  end
end
