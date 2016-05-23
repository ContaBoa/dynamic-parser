module DynamicParser::Parser
  module ClassMethods
    #filters the microparsers list for the given content
    def build(txt)
      parsers = []
      self.micro_parsers.each do |parser|
        parsers << parser if parser.detect(txt)
      end
      parsers
    end

    def parse(txt, &block)
      parsers = build(txt)
      parsers.each do |micro_parser|
        if micro_parser.ancestors.include?(DynamicParser::MicroParser::Stateful)
          micro_parser.new.parse!(txt)
        elsif micro_parser.ancestors.include?(DynamicParser::MicroParser::Stateless)
          if block_given?
            block.call(micro_parser, micro_parser.parse(txt))
          else
            raise 'You must give a block for Stateless parsers' 
          end
        else
          raise "#{micro_parser} is not a valid MicroParser!"
        end  
      end
      parsers.size
    end

    def micro_parsers
      raise 'This method should return an Array of MicroParsers'
    end
  end
  
  def self.included(receiver)
    receiver.extend         ClassMethods
  end
end