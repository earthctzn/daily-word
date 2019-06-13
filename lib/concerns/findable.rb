module DailyWord::Findable

    def by_date(input)
        self.all.date.select{|dates| words.date == input}
    end 

    def by_name(name)
        self.all.detect{|word| word.name == name}
    end

end