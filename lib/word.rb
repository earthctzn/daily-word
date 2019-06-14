class DailyWord::Word
    extend DailyWord::Findable

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

    def self.is_full?
        if  @definition != nil || @example != nil || @pronunciation == !nil
            return true
        else
            return false
        end
    end

    def self.get_months
        list = self.all.map do |word| 
            DateTime.new(word.date.year, word.date.month)
        end.uniq
    end
    def self.list_months
        list = DailyWord::Word.get_months
        list.each_with_index do |d, i|
        puts "\n#{i +1}. #{d.strftime('%B-%Y')}"
        end
    end
end