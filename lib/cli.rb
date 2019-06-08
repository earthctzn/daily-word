class DailyWord::CLI



    def self.call
        
        puts "Hi there! Welcome to DailyWord!" 
        Dailyword::Scraper.wod 
        puts "Please choose a month to see the daily words."
        puts "To select a month, please type the corresponding number"
         DailyWord::Scraper.get_words
         user_input = gets.chomp -1 
         
        #  if user_input = "1"
        #     DailyWord::Scraper.get_words

         
    end 

end