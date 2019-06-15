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
        
        puts "\nToday's Daily Word is:\n\n"
        puts "\n\n#{d.name.upcase}\n"
        puts "#{d.pronunciation}\n\n" 
        puts "\nDefinition:\n"
        puts "\n#{d.definition}\n\n"
        puts "\nExample:\n"
        puts "\n#{d.example}\n\n"
    
    end


    def self.get_missing_data(word)#this method is expecting the word variable to be a word object not a string.
        if word.is_full? == false
        bulk = Nokogiri::HTML(open("#{word.url}"))
        word.definition = bulk.css("div.wod-definition-container p")[0].text
        word.example = bulk.css("div.wotd-examples p").text
        word.pronunciation = bulk.css("span.word-syllables").text
        end 
    end

    def self.get_words
        bulk = Nokogiri::HTML(open(DATA))
        words_from_cal = bulk.css("div.more-words-of-day-container")
        words_from_cal.each do |wm|
            year_month = wm.css("h3").text.split
            words = wm.css("ul.more-wod-items a")
            words.each do |link|
                name = link.text
                #binding.pry
                day = link.attr("href").split("-")[-1] 
                month = link.attr("href").split("-")[-2]
                year = link.attr("href").split("-")[-3]
                url = "https://www.merriam-webster.com/#{link.attr("href")}"
                date = DateTime.new(year.to_i, month.to_i, day.to_i)
                DailyWord::Word.new(name, date, url)
            end
        end  
    end 
        
end