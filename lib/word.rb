class DailyWord::Word 
    attr_accessor :date, :definition
    @@all = []

    def initialize
        @date = date
        @definition = definition
        @@all << self 
    end

    
    def self.all
        @@all
    end 

end