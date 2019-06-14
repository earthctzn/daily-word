module DailyWord::Findable


    def by_name(name)
        self.all.detect{|word| word.name == name} # this should also use the  get_missing_data method.
    end


end