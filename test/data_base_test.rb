require 'test_helper'

class TestDataBase < Minitest::Test
  def setup
    @db = DataBase.new
  end
  def test_db_class
    assert @db, 'db exists'
  end

  def test_find_developer
    assert_equal @db.find_developer(platform: :ruby, region: :london), []
  end
end
