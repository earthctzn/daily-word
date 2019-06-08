class DailyWord::Scraper

    DATA = "https://www.merriam-webster.com/word-of-the-day/calendar"

    WOD = "https://www.merriam-webster.com/word-of-the-day"
    def self.wod
        bulk = Nokogiri::HTML(open(WOD))

    
    
    end
    
    
    
    def self.get_calendar 
        bulk = Nokogiri::HTML(open(DATA))
        words = bulk.css("div.more-words-of-day-container h3")
        list = words.each_with_index{|month, i| puts "#{i+1}. #{month.text}"}
        list# I will be creating my word hash here...baby
        binding.pry
    end

    def self.get_words
        bulk = Nokogiri::HTML(open(DATA))
        dates = bulk.css("ul.more-wod-items h4")
        binding.pry
        while list.length < dates.length do 
            list[:"#{date.text}"] = dates.each{|date| "date.text"}
        end
        # possibly need to split this into 2 methods or I may have to create my hash here with date: word: symbols.
        # words = bulk.css("h2 a")
        # words.each do |url| 
        #     list{url.attr("href")}
    end

end