class DailyWord::CLI



    def call
        puts "Today's Daily Word is:" 
        DailyWord::Scraper.wod 
        DailyWord::Scraper.get_calendar
       instructions 
      
        
        #  
        # DailyWord::Scraper.get_calendar

         
    end 
     
    def instructions
        user_input = nil
        until user_input == "exit"
            puts "Would you like more words?" "y/n" 
            user_input = gets.strip.downcase
            case 
                when user_input == "y"
                DailyWord::Scraper.get_words
                puts "Okayyy!"
                when user_input == "list"
                DailyWord::Word.all
                when user_input == "exit"
                puts "Good bye!"
                else
                puts "I dont understand that."
            end 
        end
    end
end