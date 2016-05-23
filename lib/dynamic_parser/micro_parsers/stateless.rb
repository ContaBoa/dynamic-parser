module DynamicParser::MicroParser::Stateless
  module ClassMethods
    def detect(txt)
      true
    end

    def parse(txt)
      raise 'This method must parse the given content - statelessly - and return the parsing result, if any.'
    end
  end
  
  def self.included(receiver)
    receiver.extend ClassMethods
  end
end