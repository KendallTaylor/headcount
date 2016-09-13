require './test/test_helper'

class LoadTest < Minitest::Test

  def test_load_takes_in_a_csv
    loader = Load.new

    assert_instance_of Analyst, loader.load_data({:enrollment => {:kindergarten => ".data/Kindergarteners in full-day program.csv"}})
  end

end
