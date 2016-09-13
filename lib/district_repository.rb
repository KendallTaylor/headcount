require 'csv'
require './lib/district'

class DistrictRepository

  attr_reader :repository

  def initialize
    @repository = {}
  end

  def load_data(file_hash)
    input_file = file_hash[:enrollment][:kindergarten]
    data = CSV.open input_file, headers: true, header_converters: :symbol
    parse_for_district(data)
  end

  def parse_for_district(data)
    data.each do |row|
       unless repository.has_key?(row[:location].upcase)
      district = District.new({:name => (row[:location]).upcase})
      @repository[row[:location].upcase] = district
      end
    end
    repository
  end

  def find_by_name(name)
    repository[name.upcase]
  end

  def find_all_matching(sub_string)
    matches = []
    repository.select do |key, value|
      matches << {key => value} if key.include?(sub_string)
    end
    matches
  end


end
