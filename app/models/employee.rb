class Employee
    attr_accessor :id
    attr_reader :username, :password, :role

    def initialize(attrs={})
        @id = attrs[:id]
        @username = attrs[:username]
        @role = attrs[:role]
        @password = attrs[:password]
    end

    def manager?
        @role == 'manager'
    end

    def rider?
        @role == 'rider'
    end
end

