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
                puts "\nSee you tomorrow 1!\n\n"
                puts "-----------------------------------------------------------------------------------------------------------------"
                return
            elsif user_input == "cal"
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
                puts "\nSee you tomorrow 2!\n\n"
                puts "------------------------------------------------------------------------------------------------------------" 
                return
            else
                case 
                    when user_input == "6" 
                        puts "-----------------------------------------------------------------------------------------------------"
                        puts "\nDailyWords for January 2019:\n"
                        puts "-----------------------------------------------------------------------------------------------------"
                        words_of_month_receiver(user_input)
                        choose_word_msg
                        choose_word_receiver
                        
                    when user_input == "5" 
                        puts "-----------------------------------------------------------------------------------------------------"
                        puts "\nDailyWords for February 2019:\n"
                        puts "-----------------------------------------------------------------------------------------------------"
                        words_of_month_receiver(user_input)
                        choose_word_msg
                        choose_word_receiver
                            
                    when user_input == "4" 
                        puts "-----------------------------------------------------------------------------------------------------"
                        puts "\nDailyWords for March 2019:\n"
                        puts "-----------------------------------------------------------------------------------------------------"
                        words_of_month_receiver(user_input)
                        choose_word_msg
                        choose_word_receiver
                            
                    when user_input == "3" 
                        puts "-----------------------------------------------------------------------------------------------------"
                        puts "\nDailyWords for April 2019:\n"
                        puts "-----------------------------------------------------------------------------------------------------"
                        words_of_month_receiver(user_input)
                        choose_word_msg
                        choose_word_receiver

                    when user_input == "2" 
                        puts "-----------------------------------------------------------------------------------------------------"
                        puts "\nDailyWords for May 2019:\n"
                        puts "-----------------------------------------------------------------------------------------------------"
                        words_of_month_receiver(user_input) 
                        choose_word_msg
                        choose_word_receiver

                    when user_input == "1" 
                        puts "-----------------------------------------------------------------------------------------------------"
                        puts "\nDailyWords for June 2019:\n"
                        puts "-----------------------------------------------------------------------------------------------------"
                        words_of_month_receiver(user_input)
                        choose_word_msg
                        choose_word_receiver

                    when user_input == "13"
                        puts "-----------------------------------------------------------------------------------------------------"
                        puts "\nDailyWords for June 2019:\n"
                        puts "-----------------------------------------------------------------------------------------------------"
                        words_of_month_receiver(user_input)
                        choose_word_msg
                        choose_word_receiver

                    when user_input == "12"
                        puts "-----------------------------------------------------------------------------------------------------"
                        puts "\nDailyWords for July 2018:\n"
                        puts "-----------------------------------------------------------------------------------------------------"
                        words_of_month_receiver(user_input)
                        choose_word_msg
                        choose_word_receiver
                            
                    when user_input == "11" 
                        puts "-----------------------------------------------------------------------------------------------------"
                        puts "\nDailyWords for August 2018:\n"
                        puts "-----------------------------------------------------------------------------------------------------"
                        words_of_month_receiver(user_input)
                        choose_word_msg
                        choose_word_receiver
                            
                    when user_input == "10" 
                        puts "-----------------------------------------------------------------------------------------------------"
                        puts "\nDailyWords for September 2018:\n"
                        puts "-----------------------------------------------------------------------------------------------------"
                        words_of_month_receiver(user_input)
                        choose_word_msg
                        choose_word_receiver
                            
                    when user_input == "9" 
                        puts "-----------------------------------------------------------------------------------------------------"
                        puts "\nDailyWords for October 2018:\n"
                        puts "-----------------------------------------------------------------------------------------------------"
                        words_of_month_receiver(user_input)
                        choose_word_msg
                        choose_word_receiver
                            
                    when user_input == "8" 
                        puts "-----------------------------------------------------------------------------------------------------"
                        puts "\nDailyWords for November 2018:\n"
                        puts "-----------------------------------------------------------------------------------------------------"
                        words_of_month_receiver(user_input)
                        choose_word_msg
                        choose_word_receiver
                            
                    when user_input == "7" 
                        puts "-----------------------------------------------------------------------------------------------------"
                        puts "\nDailyWords for December 2018:\n"
                        puts "-----------------------------------------------------------------------------------------------------"
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
        puts "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>"
        puts "\nWould you like to see more DailyWords? Enter 'yes' to start over or 'no' to exit."
        puts "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>"
    end

    def more_words_receiver
        loop do 
            user_input = gets.strip.downcase
            if user_input == "exit" || user_input == "no"
                puts "-----------------------------------------------------------------------------------------------------"
                puts "\nSee you tomorrow 3!\n"
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
            puts "\nSee you tomorrow 4!\n"
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