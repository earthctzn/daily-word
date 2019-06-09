class DailyWord::CLI



    def self.call
        user_input = ""
        until user_input == "exit"
        puts "Hi there! Welcome to DailyWord!" 
        # Dailyword::Scraper.wod 
        puts "Please choose a month to see the daily words."
        puts "To select a month, please type the corresponding number"
         DailyWord::Scraper.get_calendar
        #  user_input = gets.chomp
         
        #  case user_input 
        #     when "1"
            DailyWord::Word.all
            # else
            # puts "I dont understand that."
        end

         
    end 

end