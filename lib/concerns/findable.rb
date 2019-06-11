module Concerns::Findable

    def by_date(input)
        self.all.detect do |words|
          if  DailyWord::Word.date.include?(input)
          end
        end
            
    end 

    def find_by_name(name)
        self.all.detect{|word| word.name == name}
    end


end