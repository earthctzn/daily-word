class DailyWord::CLI
    include Concerns::Findable


    def call
        puts "Welcome! Today's Daily Word is:" 
        DailyWord::Scraper.wod 
        instructions   
    end 
     
    def instructions
        user_input = nil
        until user_input == "exit"
            user_input = gets.strip.downcase
            case 
                return "View past words?" "y/n" 
                when user_input == "y"
                DailyWord::Scraper.get_words
                return "To view past words, please type a month from the list below."
                DailyWord::Scraper.get_calendar
                when user_input == "January"

                
                DailyWord::Word.by_month(user_input)
                when user_input == "list"
                DailyWord::Word.all
                when user_input == "exit"
                return "Good bye!"
                else
                return "I dont understand that."
            end 
        end
    end
end