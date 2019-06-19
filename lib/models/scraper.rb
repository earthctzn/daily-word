class DailyWord::Scraper

    DATA = "https://www.merriam-webster.com/word-of-the-day/calendar"

    WOD = "https://www.merriam-webster.com/word-of-the-day"
    
    
    def self.wod
        bulk = Nokogiri::HTML(open(WOD))
        word = bulk.css("div.word-and-pronunciation h1").text.split(' ').join('-')
        definition = bulk.css("div.wod-definition-container p")[0].text
        date = DateTime.parse(bulk.css("span.w-a-title.margin-lr-0.margin-tb-1875em").text.strip)
        example = bulk.css("div.wotd-examples p").text
        pronunciation = bulk.css("span.word-syllables").text
        url = "https://www.merriam-webster.com/word-of-the-day/#{word}-#{date.strftime("%Y-%m-%d")}"
        # binding.pry
        d = DailyWord::Word.all.find{ |obj| obj.pronunciation == pronunciation} || DailyWord::Word.new(word, date, url, definition, example, pronunciation)
        DailyWord::Word.display_data(d)
    end


    def self.get_missing_data(word)#this method is expecting the word variable to be a word object not a string.
        if word.is_full? == false
            bulk = Nokogiri::HTML(open(word.url))
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
                day = link.attr("href").split("-")[-1] 
                month = link.attr("href").split("-")[-2]
                year = link.attr("href").split("-")[-3]
                date = DateTime.new(year.to_i, month.to_i, day.to_i)
                partial_url = link.attr("href").split(' ').join('-')
                # binding.pry
                url = "https://www.merriam-webster.com/word-of-the-day/#{partial_url}"
                # binding.pry
                if !DailyWord::Word.all.find{ |obj| obj.name == name}
                    DailyWord::Word.new(name, date, url)
                end
            end
        end  
    end 
        
end