class Order
    attr_accessor :id
    attr_reader :meal, :customer, :employee

    def initialize(attributes = {})
        @id = attributes[:id]
        @meal = attributes[:meal]
        @customer = attributes[:customer]
        @employee = attributes[:employee]
        @delivered = attributes[:delivered] || false
    end

    def delivered?
        @delivered
    end

    def deliver!
        @delivered = true
    end
end

# test = Order.new(meal: 'test', customer: 'tatchi', employee: 'felipe')
# p test
# p test.delivered?
# p test.deliver!
# p test.delivered?