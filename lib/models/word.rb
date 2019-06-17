class DailyWord::Word 
    extend DailyWord::Findable
    extend DailyWord::Saveable::ClassMethods
    include DailyWord::Saveable::InstanceMethods

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

    def self.get_months #this method retuns an array of DateTime objects. the array starts with the curent
        self.all.map do |word| 
            DateTime.new(word.date.year, word.date.month)
        end.uniq
    end

    def self.list_months 
        list = self.get_months
        list.each_with_index do |d, i|
        puts "#{i +1}. #{d.strftime('%B-%Y')}"
        end
    end

    def self.display_data(word_obj)#this method is expecting a word object as the the argument
        puts "\nToday's Daily Word is:\n\n"
        puts "\n\n#{word_obj.name.upcase}\n"
        puts "\nPronunciation:\n"
        puts "#{word_obj.pronunciation}\n\n" 
        puts "\nDefinition:\n"
        puts "\n#{word_obj.definition}\n\n"
        puts "\nExample:\n"
        puts "\n#{word_obj.example}\n\n"
    end
end