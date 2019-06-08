class DailyWord::CLI



    def self.call
        puts "It's working!" 
         DailyWord::Scraper.get_words
    end 

end