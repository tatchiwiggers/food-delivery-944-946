require_relative '../views/orders_view'

class OrdersController
    def initialize(meal_repository, customer_repository, employee_repository, order_repository)
        @meal_repository = meal_repository
        @customer_repository = customer_repository
        @employee_repository = employee_repository
        @order_repository = order_repository

        @view = OrdersView.new
        @meals_view = MealsView.new
        @customers_view = CustomersView.new
        @sessions_view = SessionsView.new
    end

    def add 
        meal = select_meal
        customer = select_customer
        employee = select_employee
        # instanciar uma ordem
        order = Order.new(meal: meal, customer:customer, employee: employee)
        # add order ao repo de orders
        @order_repository.create(order)
    end

    # listar os meals e selecionar um deles
    def select_meal
        meals = @meal_repository.all
        @meals_view.display(meals)
        index = @meals_view.ask_index
        meal = meals[index]
    end

    def select_customer
        customers = @customer_repository.all
        @customers_view.display(customers)
        index = @customers_view.ask_index
        customer = customers[index]
    end

    def select_employee
        employees = @employee_repository.all
        @employees_view.display(employees)
        index = @sessions_view.ask_index
        employee = employees[index]
    end

    def list_undelivered_orders
        orders = @order_repository.undelivered_orders
        @view.list(orders)
    end

    def list_my_orders(employee)
        orders = @order_repository.undelivered_orders.select { |order| order.employee.id == employee.id }
        @view.list(orders)
    end

    def mark_as_delivered(employee)
        orders = @order_repository.undelivered_orders.select { |order| order.employee.id == employee.id }
        @view.list(orders)
        index = @view.ask_index

        order = orders[index]

        @order_repository.mark_as_delivered(order)
    end
end