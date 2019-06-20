class DailyWord::CLI

    def call
        greeting
        words
        word_of_day
        cal_msg
        loop do

            user_input = gets.strip.downcase
            if user_input == "exit"
                puts "-----------------------------------------------------------------------------------------------------------------"
                puts "\nSee you tomorrow!\n\n"
                puts "-----------------------------------------------------------------------------------------------------------------"
                quitting
            elsif user_input == "cal" || user_input.include?("c")
                months
                choose_month_msg
                choose_month_receiver
            else
                puts "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>"
                puts "\nWoah! That was weird... Please try again\n"
                puts "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>"
            end
        end 

    end 

    def cal_msg
        puts "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>"
        puts "\nTo see the Daily Words calendar enter 'cal'\n\n"
        puts "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>"
    end

    def choose_month_msg
        puts "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>"
        puts "\nChoose a number from the list to view the words for that month.\n"
        puts "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>"
    end 

    def choose_month_receiver
        loop do
            user_input = gets.strip.downcase
            if user_input == "exit"
                exit
                puts "------------------------------------------------------------------------------------------------------------"
                puts "\nSee you tomorrow!\n\n"
                puts "------------------------------------------------------------------------------------------------------------" 
                quitting
            else
                case user_input.to_i
                    when 1..13
                        daily_words_msg(user_input)
                        words_of_month_receiver(user_input)
                        choose_word_msg
                        choose_word_receiver
                        
                    else
                        puts "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>"
                        puts "\nWoah! That was weird... Please try again\n"
                        puts "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>"
                        choose_month_msg
                        choose_month_receiver
                end  
            end   
        end
    end 


    def greeting
        puts "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>"
        puts "\nWelcome to Daily Word!\n"
        puts "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>"
    end





    def daily_words_msg(user_input)
        puts "-----------------------------------------------------------------------------------------------------"
        puts "\nDailyWords for #{DailyWord::Word.get_months[user_input.to_i-1].strftime("%B-%Y")}:\n"
        puts "-----------------------------------------------------------------------------------------------------"
    end



    def months 
        # binding.pry
        DailyWord::Word.list_months
    end



    def word_of_day
        DailyWord::Scraper.wod
    end

    def words
        DailyWord::Scraper.get_words
    end



    def more_words_msg
        puts "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>"
        puts "\nWould you like to see more DailyWords? Enter 'yes' to start over or 'no' to exit.\n\n"
        puts "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>"
    end

    def more_words_receiver
        loop do 
            user_input = gets.strip.downcase
            if user_input == "exit" || user_input == "no"
                puts "-----------------------------------------------------------------------------------------------------"
                puts "\nSee you tomorrow!\n"
                puts "-----------------------------------------------------------------------------------------------------"
                quitting 
            elsif user_input == "yes"
                call
            else
                puts "-----------------------------------------------------------------------------------------------------"
                puts "\nWoah! That was weird... Please try again.\n"
                puts "-----------------------------------------------------------------------------------------------------"
                more_words_msg
                more_words_receiver
            end
        end
    end

    def choose_word_msg
        puts "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>"
        puts "\nChoose a number to see the words' details.\n"
        puts "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>"
    end

    def choose_word_receiver
        user_input = gets.strip
        if user_input != "exit"
            range = (1..@list.length).to_a        
                user_input = user_input.to_i
                if !range.include?(user_input)
                    puts "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>"
                    puts "\nHmm... Try entering a number between #{range[0]} and #{range[-1]}.\n\n"
                    puts "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>"
                    choose_word_receiver
                else
                    show_details(user_input)
                    more_words_msg
                    more_words_receiver
                end
        else
            puts "-----------------------------------------------------------------------------------------------------"
            puts "\nSee you tomorrow!\n"
            puts "-----------------------------------------------------------------------------------------------------"
            quitting
        end
    
    end

    def quitting
        begin
            exit!
        end
    end

    def show_details(input)
        word_obj = @matches[input.to_i-1]
        DailyWord::Scraper.get_missing_data(word_obj) 
        DailyWord::Word.display_data(word_obj)
    end

    def words_of_month_receiver(input)
        month = DailyWord::Word.get_months[input.to_i-1].strftime("%B-%Y")
        @matches = DailyWord::Word.all.select{|d|d.date.strftime("%B-%Y") == month}
        @list = @matches.each_with_index do |w, i|
            puts "#{i+1} #{w.name}, #{w.date.strftime('%B-%Y')}" 
        end
    end
end