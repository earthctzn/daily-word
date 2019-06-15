module DailyWord::Saveable

  module InstanceMethods

    def save
      self.class.all << self
    end

  end
  module ClassMethods

    def create(name, date, url, definition, example, pronunciation)
      self.new(name=nil, date=nil, url=nil, definition=nil, example=nil, pronunciation=nil).tap(&:save)
    end
  
  end

end
  