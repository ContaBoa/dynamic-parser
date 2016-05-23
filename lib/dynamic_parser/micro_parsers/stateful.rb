module DynamicParser::MicroParser::Stateful
  module ClassMethods
    #This method must return true or false to tell if this MicroParser is responsible for parsing the given txt content.
    def detect(txt)
      true
    end
  end
  
  module InstanceMethods
    #This method must return true or false to tell if this MicroParser is responsible for parsing the given txt content.
    def detect(txt)
      true
    end

    def parse!(txt)
      raise 'This method must parse the given content - statefully - and is not expected to return any value.'
    end
  end
  
  def self.included(receiver)
    receiver.extend ClassMethods
    receiver.include InstanceMethods
  end
end