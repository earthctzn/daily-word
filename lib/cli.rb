class DailyWord::CLI



    def self.call
        puts "Hi there! Welcome to DailyWord!" 
        DailyWord::Scraper.wod 
       instructions 
        
        #  DailyWord::Scraper.get_words
        # DailyWord::Scraper.get_calendar

         
    end 
     
    def self.instructions
        user_input = nil
        until user_input == "exit"
            puts "Would you like more words? y/n" 
            user_input = gets.strip.downcase
            case user_input
            when user_input == "y"
            puts "Okayyy!"
            # DailyWord::Word.all
            when user_input == "exit"
            puts "Good bye!"
            else
            puts "I dont understand that."
            end 
        end
    end
end