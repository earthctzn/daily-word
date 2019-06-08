class DailyWord::Word 
    attr_accessor :date, :definition, :pronounciation, :example
    @@all = []# this will be an array of hashes baby

    def initialize(name, date, definition, example, pronounciation)
        @name = name
        @date = date #research date/time object
        @definition = definition
        @example = example 
        @pronounciation = pronounciation
        @@all << self 
    end


    def self.all
        @@all
    end 

end