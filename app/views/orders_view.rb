class OrdersView
    def ask_index
        puts "Enter index:"
        gets.chomp.to_i - 1
    end

    def list_riders(riders)
        riders.each_with_index do |rider, index|
            puts "#{index + 1} - #{order.employee.username} deliver to #{order.meal.name} by #{order.customer.name}"
        end
    end
    
    def list(orders)
        orders.each_with_index do |order, index|
            puts "#{index + 1} - #{order.meal.name} deliver to #{order.customer.name} by #{order.employee.username}"
        end
    end
end