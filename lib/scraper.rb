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
        months = bulk.css("div.more-words-of-day-container h3")
        months.map.with_index do |month, i|
            puts "#{i+1}. #{month.text}"
        end
        

        # links.each do |url|
        #     names = word_data.map{|url| url.text}
                
               
            # end
        
        # end
        
    end

    def self.get_url
        bulk = Nokogiri::HTML(open(DATA))
        word_data = bulk.css("h2 a")
        word_data.map{|url| url.attr("href")}
    end





    def self.get_words
        bulk = Nokogiri::HTML(open(DATA))
        months = bulk.css("ul.more-wod-items h4")
        years = bulk.css("div.more-words-of-day-container h3")
        years.map do |y|
           year = y.text.split.last
            months.select do |md|
                mnthdy = md.text
            binding.pry
            date = DateTime.parse("#{mnthdy}", "#{year}")
            end 
        end
    end
         
        # while list.length < dates.length do 
        #     list[:"#{date.text}"] = dates.each{|date| "date.text"}
        # end
        # names.each do |name| 
        #     DailyWord::Word.new("#{name}", "#{date}", "#{url}")
        #     end
        # possibly need to split this into 2 methods or I may have to create my hash here with date: word: symbols.
        # words = bulk.css("h2 a")
        # words.each do |url| 
        #     list{url.attr("href")}
    # end
end