class DailyWord::Word 
    attr_accessor :date, :definition
    @@all = []

    def self.all
        @@all
    end 

end