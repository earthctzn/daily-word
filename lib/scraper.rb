class DailyWord::Scraper

    DATA = "https://www.merriam-webster.com/word-of-the-day/calendar"

    WOD = "https://www.merriam-webster.com/word-of-the-day"
    
    
    def self.wod
        bulk = Nokogiri::HTML(open(WOD))
    
        word = bulk.css("div.word-and-pronunciation h1").text
        definition = bulk.css("div.wod-definition-container p")[0].text
        date = DateTime.parse(bulk.css("span.w-a-title.margin-lr-0.margin-tb-1875em").text.strip)
        example = bulk.css("div.wotd-examples p").text
        pronunciation = bulk.css("span.word-syllables").text
        url = "https://www.merriam-webster.com/word-of-the-day/#{word}-#{date.strftime("%Y-%m-%d")}"
        d = DailyWord::Word.new(word, date, url, definition, example, pronunciation)
        
        puts d.name.upcase
        puts d.pronunciation 
        puts d.definition
        puts d.example
    
    end
    
    
    
    def self.get_calendar # puts out a numbered list with the month and year
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
        word_data.each do|link| 
         url = "https://www.merriam-webster.com/#{link.attr("href")}"
        end
    end

    def self.get_words
        bulk = Nokogiri::HTML(open(DATA))
        words_by_month = bulk.css("div.more-words-of-day-container")
        words_by_month.each do |wm|
            year_month = wm.css("h3").text.split
            words = bulk.css("ul.more-wod-items a")
            words.each do |link|
                name = link.text
                day = link.attr("href").split("-")[-1]
                month = link.attr("href").split("-")[-2]
                year = link.attr("href").split("-")[-3]
                url = "https://www.merriam-webster.com/#{link.attr("href")}"
                date = DateTime.new(year.to_i, month.to_i, day.to_i)
                DailyWord::Word.new(name, date, url)
            end
        end 
     binding.pry   
    end 
        # binding.pry 
        # words_array = words.map{|w| w.text}
        
        # url_array =[]
        #  words.map do |u|
        #     #binding.pry
        #    if u.attr("href")
        #    url_array << "https://www.merriam-webster.com/#{u.attr("href")}" #not sure why its dying after this line. 
        #    else
        #     puts "URL not available"
        #    end
        #     binding.pry
        #         end
        
         

        # names.each do |name| 
        #     DailyWord::Word.new("#{name}", "#{date}", "#{url}")
        #     end
        # possibly need to split this into 2 methods or I may have to create my hash here with date: word: symbols.
        # words = bulk.css("h2 a")
        # words.each do |url| 
        #     list{url.attr("href")}
    # end
end