require './test/test_helper'
require './lib/district'

class DistrictTest < Minitest::Test

  def test_district_contains_district_name
    row = {name: "AURORA"}
    district = District.new(row)
    assert_equal "AURORA", district.name
  end

  def test_district_contains_different_district_name
    row = {name: "ADAMS-ARAPAHOE 28J"}
    district = District.new(row)
    assert_equal "ADAMS-ARAPAHOE 28J", district.name
  end

  def test_district_can_call_name
    row = {name: "aurora"}
    district = District.new(row)

    assert_equal "AURORA", district.name
  end

end
