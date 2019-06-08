class DailyWord::Word 
    attr_accessor :name, :date, :definition, :example, :pronounciation
    @@all = []

    def initialize(name = nil, date = nil, definition = nil, example = nil, pronounciation = nil)
        @name = name if !name == nil 
        @date = date if !date == nil 
        @definition = definition if !definition == nil
        @example = example if !example == nil 
        @pronounciation = pronounciation if !pronounciation == nil
        @@all << self 
    end
        

    def self.all
        @@all
    end 

end