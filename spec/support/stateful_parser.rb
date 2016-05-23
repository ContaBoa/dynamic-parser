require 'ostruct'

class StatefulParser
  include DynamicParser::MicroParser::Stateful
  def initialize
    @data = []
  end
  
  def detect(txt)
    self.class.detect(txt)
  end

  def self.detect(txt)
    if txt.match('stateful') == nil
      false
    else
      true
    end
  end

  def parse!(txt)
    tokens = []
    txt.split(' ').each_with_index do |piece, i|
      @data.push OpenStruct.new(index: i, content: piece)
    end
    # you could be doing some IO here, like writing to a file, database, http...
  end

  def gimme_data
    @data
  end
end