class DailyWord::CLI

    def call
        self.greeting
        words
        word_of_day
        loop do
            user_input = menu
            if user_input == "exit" || user_input.include?("n")
                puts "\nGood bye!"
                return 
            elsif user_input.include?("1,2,3,4,5,6,7,8,9,10,11,12")
                puts "\nDailyWords for the month of:\n"
                words_of_month(input)
            else
                case user_input
                    when "y"
                        puts "\nPlease enter the number for the month you wish to see!\n" 
                        DailyWord::Word.list_months
                    else
                        puts "I dont understand that."
                end
            end
        end
    end 


    def greeting
        puts "\n\nWelcome to Daily Word!"
    end

    def menu
        puts "\n\nWould you like to see past DailyWords? y/n\n"
        user_input = gets.strip.downcase
        if user_input == "exit" || user_input.include?("n")
            puts "Ok, see ya tomorrow!"
        end
        return user_input
    end

    def word_of_day
        DailyWord::Scraper.wod
    end

    def words
        DailyWord::Scraper.get_words
    end
    

    def words_of_month(input)
        binding.pry
        inputarg = input.to_i -1
        months = DailyWord::Word.get_months
        dates = months.map.strftime('%B-%Y')
        DailyWord::Word.all.select{|wo| wo} #need to finish this method.
  
    end

    def display_data(word)
        puts "\nToday's Daily Word is:\n\n"
        puts "\n\n#{word.name.upcase}\n"
        puts "\nPronunciation:\n"
        puts "#{word.pronunciation}\n\n" 
        puts "\nDefinition:\n"
        puts "\n#{word.definition}\n\n"
        puts "\nExample:\n"
        puts "\n#{word.example}\n\n"
    end

end