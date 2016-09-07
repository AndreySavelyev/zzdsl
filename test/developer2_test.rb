require 'test_helper'

class Developer2Test < Minitest::Test
  def setup
    @dev = Developer2.new(
      qualities: {crazy: true, ugly: false},
      included: [:greenpeace],
      excluded: [:plumbee],
      love: ['pizza', 'cats'],
      want: ['money'],
      skill_level: :high,
      work: :well
    )
  end

  def test_db_class
    assert @dev, 'developer existence'
  end

  def test_developer_himself
    assert_instance_of Developer2, @dev.you, 'developer not a developer'
  end

  def test_quality
    puts "zz = #{@dev.are.crazy}"
    assert @dev.are.crazy
    assert @dev.are.not.ugly
    # assert_equal true, @dev.qualities[:crazy]
    # assert_equal false, @dev.qualities[:ugly]
  end

  # def test_include_somewhere
  #   @dev.are.in :greenpeace
  #   @dev.are.not.in :plumbee
  #   assert_equal [:greenpeace], @dev.qualities[:included]
  #   assert_equal [:plumbee], @dev.qualities[:excluded]
  # end

  # def test_and_options
  #   @dev.are.crazy
  #   .and{ you.are.not.in :plumbee }

  #   assert_equal true, @dev.qualities[:crazy]
  #   assert_equal [:plumbee], @dev.qualities[:excluded]
  # end

  # def test_multiple_quality
  #   @dev.are.crazy
  #     .and { love 'cats', 'pizza' }
  #     .and { you.are.not.in :plumbee }
  #     .and { want 'fun', 'money' }

  #   assert_equal true, @dev.qualities[:crazy]
  #   assert_equal ['cats', 'pizza'], @dev.qualities[:love]
  #   assert_equal ['fun', 'money'], @dev.qualities[:want]
  #   assert_equal [:plumbee], @dev.qualities[:excluded]
  # end

  # def test_comparisons
  #   you = @dev
  #   @dev.and { your.skill_level is :high }
  #     .and.if you do
  #       your work well
  #     end

  #   assert_equal [:high], @dev.qualities[:skill_level]
  #   assert_equal [:well], @dev.qualities[:work]
  # end
end
