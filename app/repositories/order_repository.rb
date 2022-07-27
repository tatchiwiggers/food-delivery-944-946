class OrderRepository
    def initialize(csv_file, meal_repository, customer_repository, employee_repository)
        @csv_file = csv_file
        @meal_repository = meal_repository
        @customer_repository = customer_repository
        @employee_repository = employee_repository
        @orders = []
        load_csv if File.exist?(@csv_file)
        @next_id = @orders.empty? ? 1 :@orders.last.id + 1
    end

    def create(order)
        order.id = @next_id
        @orders << order
        @next_id += 1
        save_csv
    end

    def all
        @orders
    end

    def find(id)
        @orders.select { |order| order.id == id }.first
    end

    def undelivered_orders
        @orders.select { |order| order.delivered? ==  false }
    end

    def mark_as_delivered(order)
        order.deliver!
        save_csv
    end
    
    def load_csv
        CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|

        row[:id] = row[:id].to_i
        row[:meal] = @meal_repository.find(row[:meal_id].to_i)
        row[:customer] = @customer_repository.find(row[:customer_id].to_i)
        row[:employee] = @employee_repository.find(row[:employee_id].to_i)
        row[:delivered] = row[:delivered] == 'true'

        @orders <<  Order.new(row)
        end
    end

    def save_csv
        CSV.open(@csv_file, 'wb', headers: :first_row, header_converters: :symbol) do |csv|
            csv << %i[id meal_id customer_id employee_id delivered]

            @orders.each do |order|
                csv << [order.id, order.meal.id, order.customer.id, order.employee.id, order.delivered?]
            end
        end
    end
end