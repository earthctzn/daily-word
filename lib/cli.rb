class DailyWord::CLI

    def call
        puts "Welcome! Today's Daily Word is:"
        DailyWord::Scraper.wod 
        instructions   
    end 
     
    def instructions
        user_input = nil
        until user_input == "exit"
            puts "View past words? y/n" 
            user_input = gets.strip.downcase
            case user_input
                when "y"
                    DailyWord::Scraper.get_words
                    puts "To view past words, please type a month from the list below."
                    DailyWord::Scraper.get_calendar
                    DailyWord::Word.by_date(user_input)
                    # puts "Type in a word from the list to learn more!"
                    # when user_input == "word from the list"
                    # DailyWord::Word.by_name(user_input)
                when "exit"
                    puts "Good bye!"
                else
                    puts "I dont understand that."
                
            end
        end
    end
end