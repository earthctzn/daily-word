class DailyWord::CLI



    def self.call
        puts "Hi there! Welcome to DailyWord!" 
        # Dailyword::Scraper.wod 
        puts "Please choose a month to see the daily words."
        puts "To select a month, please type the corresponding number"
         DailyWord::Scraper.get_words
        # DailyWord::Scraper.get_calendar
        user_input = nil
        user_input = gets.chomp

         
    end 
     
    def instructions
        case input
        when user_input == "1"
            puts "Okayyy!"
            #DailyWord::Word
        when user_input == "exit"
            puts "Good bye!"
        else
            puts "I dont understand that."
        end
    end
end