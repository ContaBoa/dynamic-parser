require 'ostruct'

class StatelessParser
  include DynamicParser::MicroParser::Stateless
  
  def self.detect(txt)
    txt.include?('static')
  end

  def self.parse(txt)
    tokens = []
    txt.split(' ').each_with_index do |piece, i|
      tokens.push OpenStruct.new(index: i, content: piece)
    end
    tokens
  end
end