class DailyWord::Word 
    attr_accessor :name, :date, :url, :definition, :example, :pronunciation

    @@all = []

    def initialize(name = nil, date = nil, url = nil, definition = nil, example = nil, pronunciation = nil)
        @name = name 
        @date = date 
        @url = url 
        @definition = definition 
        @example = example
        @pronunciation = pronunciation
        @@all << self 
    end
        

    def self.all
        @@all
    end 

end