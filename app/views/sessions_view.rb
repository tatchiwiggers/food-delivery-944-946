class SessionsView
    def ask_username
        puts "Enter username: "
        gets.chomp
    end

    def ask_password
        puts "Enter password: "
        gets.chomp
    end

    def welcome
        puts "welcome to tatchi's delivery app!"
    end

    def wrong_credentials
        puts "Wrong credentials, try again!"
    end
end