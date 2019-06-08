class DailyWord::Scraper

    DATA = "https://www.merriam-webster.com/word-of-the-day/calendar"

    def self.get_calendar 
        bulk = Nokogiri::HTML(open(DATA))
        words = bulk.css("div.more-words-of-day-container h3")
        list = words.each_with_index{|month, i| puts "#{i+1}. #{month.text}"}
        list
        binding.pry
    end

    def self.get_words
        list = {}
        bulk = Nokogiri::HTML(open(DATA))
        dates = bulk.css("ul.more-wod-items h4").to_a
        dates.each{|date| list{"#{date}:"}}
        # possibly need to split this into 2 methods or I may have to create my hash here with date: word: symbols.
        words = bulk.css("h2 a")
        words.each do |url| 
            list{url.attr("href")}
    end

end