class DailyWord::CLI

    def call
        self.greeting
        words
        #word_of_day
        user_input = nil 
        until user_input == "exit"
            puts "\n\nTo see the Daily Words calendar enter 'c' then type the month-year you want to see.\n"
            puts "\nTo view the word of the day type wod"
            user_input = gets.strip.downcase
                
            case 
                when user_input == "wod"
                    word_of_day
                when user_input == "c"
                    months
                when user_input == "january-2019" || user_input.include?("jan")
                    puts "\n\nDailyWords for:\n\n"
                    words_of_month(user_input)
                    puts "\n\nType the word to see it's details.\n"
                when user_input == "february-2019" || user_input.include?("feb")
                    puts "\n\nDailyWords for:\n\n"
                    words_of_month(user_input)
                    puts "\n\nType the word to see it's details.\n"
                when user_input == "march-2019" || user_input.include?("mar")
                    puts "\n\nDailyWords for:\n\n"
                    words_of_month(user_input)
                    puts "\n\nType the word to see it's details.\n"
                when user_input == "april-2019" || user_input.include?("apr")
                    puts "\n\nDailyWords for:\n\n"
                    words_of_month(user_input)
                    puts "\n\nType the word to see it's details.\n"
                when user_input == "may-2019" || user_input.include?("m")
                    puts "\n\nDailyWords for:\n\n"
                    words_of_month(user_input)
                    puts "\n\nType the word to see it's details.\n"
                when user_input == "june-2018" || user_input.include?("jun")
                    puts "\n\nDailyWords for:\n\n"
                    words_of_month(user_input)
                    puts "\n\nType the word to see it's details.\n"
                when user_input == "july-2018" || user_input.include?("jul")
                    puts "\n\nDailyWords for:\n\n"
                    words_of_month(user_input)
                    puts "\n\nType the word to see it's details.\n"
                when user_input == "august-2018" || user_input.include?("aug")
                    puts "\n\nDailyWords for:\n\n"
                    words_of_month(user_input)
                    puts "\n\nType the word to see it's details.\n"
                when user_input == "september-2018" || user_input.include?("sep")
                    puts "\n\nDailyWords for:\n\n"
                    words_of_month(user_input)
                    puts "\n\nType the word to see it's details.\n"
                when user_input == "october-2018" || user_input.include?("oct")
                    puts "\n\nDailyWords for:\n\n"
                    words_of_month(user_input)
                    puts "\n\nType the word to see it's details.\n"
                when user_input == "november-2018" || user_input.include?("nov")
                    puts "\n\nDailyWords for:\n\n"
                    words_of_month(user_input)
                    puts "\n\nType the word to see it's details.\n"
                when user_input == "december-2018" || user_input.include?("dec")
                    puts "\n\nDailyWords for:\n\n"
                    words_of_month(user_input)
                    puts "\n\nType the word to see it's details.\n"
                when user_input.to_i >0
                    show_details(user_input)#here we are passing the word name as a string.
                when user_input == "exit" || user_input.include?("n")
                    puts "\nSee you tomorrow!"
                else
                    puts "\n\nWoah! That was weird... Please try again."
            end
        end
    end 


    def greeting
        puts "\n\nWelcome to Daily Word!"
    end

    def word_of_day
        DailyWord::Scraper.wod
    end

    def words
        DailyWord::Scraper.get_words
    end

    def months 
        DailyWord::Word.list_months
    end

    def show_details(input)
        #binding.pry
        word_obj = @matches[input.to_i-1]
        DailyWord::Scraper.get_missing_data(word_obj) 
        DailyWord::Word.display_data(word_obj)
    end

    def words_of_month(input)
        month = DailyWord::Word.get_months[input.to_i-1].strftime("%B-%Y")
        @matches = DailyWord::Word.all.select{|d|d.date.strftime("%B-%Y") == month}
        # binding.pry
        @matches.each_with_index do |w, i| 
            puts "#{i+1} #{w.name}, #{w.date.strftime('%B-%Y')}"
        end
    end

end