class CompositeParser
  include DynamicParser::Parser
  def self.micro_parsers
    [StatefulParser, StatelessParser]
  end
end