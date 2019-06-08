class DailyWord::Scraper

    DATA = "https://www.merriam-webster.com/word-of-the-day/calendar"

    def self.get_words 
        bulk = Nokogiri::HTML(open(DATA))
        words = bulk.css("div.more-words-of-day-container h3")
        # words.each do |month|

        binding.pry 
       puts "raw data file"
    end
end