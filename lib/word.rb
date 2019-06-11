class DailyWord::Word
    include Concerns::Findable
    attr_accessor :name, :date, :url, :definition, :example, :pronunciation

    @@all = []

    def self.all
        @@all
    end 

    def initialize(name = nil, date = nil, url = nil, definition = nil, example = nil, pronunciation = nil)
        @name = name 
        @date = date 
        @url = url 
        @definition = definition 
        @example = example
        @pronunciation = pronunciation
        @@all << self 
    end

    def is_full?
        if  @definition != nil || @example != nil || @pronunciation == !nil
            return true
        else
            return false
        end
    end



end