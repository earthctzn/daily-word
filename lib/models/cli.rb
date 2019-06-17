class DailyWord::CLI

    def call
        greeting
        words
        word_of_day
        cal_menu_msg
        cal_menu 
        user_input = gets.strip.downcase
        if user_input == "exit"
            puts "\nSee you tomorrow!\n\n"
        end
    end 

    def cal_menu_msg
        puts "To see the Daily Words calendar enter 'cal'\n"
    end


    def cal_menu
       puts "in the cal menu"
        user_input = gets.strip.downcase
        if user_input == "exit"
            puts "\nSee you tomorrow!\n\n" 
        elsif
            user_input == "cal"
            months
            choose_month_msg
            choose_month
        else
            puts "\n\nWoah! That was weird... Please try again."
        end

    end 

    def choose_month_msg
        puts "\nChoose a number from the list to view the words for that month.\n"
    end 

    def choose_month
       puts "in the choose month menu"
        user_input = nil
        user_input = gets.strip.downcase

        case 
            when user_input == "6" 
                puts "\n\nDailyWords for January 2019:\n\n"
                words_of_month(user_input)
                    
            when user_input == "5" 
                puts "\n\nDailyWords for February 2019:\n\n"
                words_of_month(user_input)
                    
            when user_input == "4" 
                puts "\n\nDailyWords for March 2019:\n\n"
                words_of_month(user_input)
                    
            when user_input == "3" 
                puts "\n\nDailyWords for April 2019:\n\n"
                words_of_month(user_input)
   
            when user_input == "2" 
                puts "\n\nDailyWords for May 2019:\n\n"
                words_of_month(user_input) 

            when user_input == "1" 
                puts "\n\nDailyWords for June 2019:\n\n"
                words_of_month(user_input)

            when user_input == "13"
                puts "\n\nDailyWords for June 2019:\n\n"
                words_of_month(user_input)

            when user_input == "12" 
                puts "\n\nDailyWords for July 2018:\n\n"
                words_of_month(user_input)
                    
            when user_input == "11" 
                puts "\n\nDailyWords for August 2018:\n\n"
                words_of_month(user_input)
                    
            when user_input == "10" 
                puts "\n\nDailyWords for September 2018:\n\n"
                words_of_month(user_input)
                    
            when user_input == "9" 
                puts "\n\nDailyWords for October 2018:\n\n"
                words_of_month(user_input)
                    
            when user_input == "8" 
                puts "\n\nDailyWords for November 2018:\n\n"
                words_of_month(user_input)
                    
            when user_input == "7" 
                puts "\n\nDailyWords for December 2018:\n\n"
                words_of_month(user_input)
            when user_input == "exit"
                puts "\nSee you tomorrow!\n\n"
                
            else
                puts "\n\nWoah! That was weird... Please try again."
        end
        which_one(user_input)
    end 

    def greeting
        puts "\n\nWelcome to Daily Word!"
    end
    
    def wod_msg
        puts "\nTo view the word of the day type 'wod'."
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

    def more_words_msg
        puts "\nWould you like to see more DailyWords 'yes/no'?"
        puts "To start over enter 'menu'"
        puts "When done enter 'exit' to end DailyWords.\n\n"
    end

    def more_words_menu
       puts "in the more words menu"
        user_input = gets.strip.downcase
        case user_input
            when "yes"
                cal_menu_msg
                cal_menu
            when "menu"
                call
            when "no"
                puts "\nSee you tomorrow!\n\n"
                return
            when "exit"
                puts "\nSee you tomorrow!\n\n"
                
            else
                puts "\n\nWoah! That was weird... Please try again.\n\n"
                more_words_menu
        end
    end

    def which_word
        puts "\nChoose a number to see the words' details.\n"
    end

    def which_one(selected_word)
        range = (1..@list.length).to_a
        selected_word = gets.strip
        
        if selected_word != "exit"
            selected_word = selected_word.to_i
            #binding.pry
                if !range.include?(selected_word)
                    puts "Hmm... Try entering a number between #{range[0]} and #{range[-1]}."
                    which_one(selected_word)
                else
                    show_details(selected_word)
                end
        else
            puts "\nSee you tomorrow!\n"
            return
        end
        more_words_msg
        more_words_menu     
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
        #binding.pry
         @list = @matches.each_with_index do |w, i|
            puts "#{i+1} #{w.name}, #{w.date.strftime('%B-%Y')}"
            
        end
    end

end