class DailyWord::CLI

    def call
        self.greeting
        words
        word_of_day
        # menu
        # instructions
        # puts greeting then
        # gets the words and 
        # runs word_of_day then
        # start instrucions loop
        loop do
            user_input = menu
            if user_input == "exit" || user_input.include?("n")
                puts "\nGood bye!"
                return 
            else
                case user_input
                    when "y"
                        list_months
                        instructions
                        # DailyWord::Word.by_date(user_input)
                        # puts "Type in a word from the list to learn more!"
                        # when user_input == "word from the list"
                        # DailyWord::Word.by_name(user_input)
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
        end.uniq
       list.each_with_index do |d, i|
        puts "\n#{i +1}. #{d.strftime('%B-%Y')}"
        end
    end

    def instructions
        user_input = nil
        puts "\nTo view past words, please type the number for the month you wish to see.\n"
        user_input = gets.strip.downcase
        return user_input
    end
end