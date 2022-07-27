require 'csv'
require_relative '../models/employee'

class EmployeeRepository
    def initialize(csv_file)
        @csv_file = csv_file
        @employees = []
        load_csv if File.exist?(@csv_file)
    end

    def find_by_username(username)
        @employees.select { |employee| employee.username == username }.first
    end

    def all_riders
        @employees.select { |employee| employee.rider? }
    end

    def find(id)
        @employees.find { |employees| employee.id == id }.first
    end

    def load_csv
        CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
            row[:id] = row[:id].to_i
            @employees << Employee.new(row)
        end
        # p @employees
    end
end