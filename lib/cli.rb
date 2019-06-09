class DailyWord::CLI



    def self.call
        user_input = ""
        until user_input == "exit"
            puts "Hi there! Welcome to DailyWord!" 
            # Dailyword::Scraper.wod 
            puts "Please choose a month to see the daily words."
            puts "To select a month, please type the corresponding number"
            DailyWord::Scraper.get_words
            user_input = gets.chomp.downcase 
         
         case 
            when user_input == "all"
                DailyWord::Word.all
            when user_input == "exit"
                puts "Good bye!"
            else
                puts "I dont understand that."
            end
        end

         
    end 

end