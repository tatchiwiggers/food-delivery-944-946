class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run

    @employee = @sessions_controller.sign_in
    puts @employee.username


    while @running
      if @employee.manager?
        print_actions_manager
        choice = gets.chomp.to_i
        # print `clear`
        route_manager(choice)
      else
      #   print_actions_rider
      #   choice = gets.chomp.to_i
      #   route_rider(choice)
      puts 'no other options'
      end
    end
  end

  private
  def print_actions_manager
    puts "--------------------"
    puts "------- MENU -------"
    puts "--------------------"
    puts "1. Add new meal"
    puts "2. List all meals"
    puts "3. Add new customer"
    puts "4. List all customers"
    puts "8. Exit"
    print "> "
  end

  def route_manager(choice)
    case choice
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 8 then stop!
    else puts "Try again..."
    end
  end

  def stop!
    @running = false
  end
end
