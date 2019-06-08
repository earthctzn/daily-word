class DailyWord::Scraper

    DATA = "https://www.merriam-webster.com/word-of-the-day/calendar"

    WOD = "https://www.merriam-webster.com/word-of-the-day"
    # def self.wod
    #     bulk = Nokogiri::HTML(open(WOD))
    #     # this will eventually instantiate a word object and add any missing attributes to that instance's data.
    #     word_data = bulk.css()
    
    # end
    
    
    
    def self.get_calendar 
        bulk = Nokogiri::HTML(open(DATA))
        words = bulk.css("div.more-words-of-day-container h3")
        # months = words.split(/\s|\d{4}/).reject(&:empty?)
        # Word.new()
        # words.each_with_index{|month, i| puts "#{i+1}. #{month.text}"}
        
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