class DailyWord::Word 
    attr_accessor :name, :date, :url, :definition, :example, :pronounciation

    @@all = []

    def initialize(name = nil, date = nil, url = nil, definition = nil, example = nil, pronounciation = nil)
        @name = name 
        @date = date 
        @url = url 
        @definition = definition 
        @example = example
        @pronounciation = pronounciation
        @@all << self 
    end
        

    def self.all
        @@all
    end 

end