class DailyWord::CLI

    def call
        words
        self.greeting
        word_of_day
        instructions
    end 


    def greeting
        puts "\n\nWelcome to Daily Word!"
    end


    def menu
        puts "\n\nWould you like to see past words?\n"
        user_input = gets.strip.downcase
        return user_input
    end

    def word_of_day
        DailyWord::Scraper.wod
    end

    def words
        DailyWord::Scraper.get_words
    end
        
    def list_months
       list = DailyWord::Word.all.map do |word| 
            DateTime.new(word.date.year, word.date.month)
        end.uniq[0..11]
        binding.pry
        list.select.with_index do |d, i|
            puts "#{i +1}. #{d.strftime("%B")}"
        end
    end

    def instructions
        user_input = menu
        puts "To view past words, please type the number for the month you wish to see.\n"
        until user_input == "exit" || user_input.include?("n")
            case user_input
                when "y"
                    # binding.pry
                    list_months
                    # DailyWord::Word.by_date(user_input)
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