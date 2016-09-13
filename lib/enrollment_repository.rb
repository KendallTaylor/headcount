require 'csv'
require './lib/enrollment'

class EnrollmentRepository

  attr_reader :repository

  def initialize
    @repository = {}
  end

  def load_data(file_hash)
    input_file = file_hash[:enrollment][:kindergarten]
    data = CSV.open input_file, headers: true, header_converters: :symbol
    parse_for_enrollment_data(data)
  end

  def parse_for_enrollment_data(data)
    data.each do |row|
      return add_to_kindergarten_participation(row) if repository.has_key?(row[:location].upcase)
      create_enrollment_object(row)
    end
    repository
  end

  def create_enrollment_object(row)
    enrollment = Enrollment.new({:name => (row[:location]).upcase,
    :kindergarten_participation => {(row[:timeframe]) => (row[:data])}})
    @repository[row[:location].upcase] = enrollment
  end

  def add_to_kindergarten_participation(row)
    @repository[row[:location].upcase].kindergarten_participation.merge!({row[:timeframe] => row[:data]})
  end

end
