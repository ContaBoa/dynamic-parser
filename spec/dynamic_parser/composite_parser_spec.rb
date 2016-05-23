require "spec_helper"

describe CompositeParser do
  let(:parser) { CompositeParser }
  let(:content_to_parse_statefully) { 'Parse me statefully!' }
  let(:content_to_parse_statically) { 'Parse me statically!' }
  let(:content_to_parse) { 'Parse me statefully! Parse me statically!' }
  
  describe '.build' do
    it 'builds a microparser Array for the static parser' do
      expect(parser.build(content_to_parse_statefully)).to eq([StatefulParser])
    end
    it 'builds a microparser Array for the stateful parser' do
      expect(parser.build(content_to_parse_statically)).to eq([StatelessParser])
    end
    it 'builds a microparser Array for the both parsers' do
      expect(parser.build(content_to_parse)).to match_array([StatelessParser,StatefulParser])
    end
  end

  describe '.parse' do
    context 'stateful only' do
      it 'parses the content returning the number of MicroParsers involved' do
        expect(parser.parse(content_to_parse_statefully)).to eq(1)
      end
    end

    context 'static only' do
      it 'raises error when no block given' do
        expect{parser.parse(content_to_parse_statically)}.to raise_error
      end
      it 'parses the content and runs the given block' do
        parser.parse(content_to_parse_statically) do |parser, result|
          expect(parser).to eq(StatelessParser)
          expect(result.to_s).to eq("[#<OpenStruct index=0, content=\"Parse\">, #<OpenStruct index=1, content=\"me\">, #<OpenStruct index=2, content=\"statically!\">]")
        end
      end
    end

    context 'static & stateful' do
      it 'parses the content and runs the given block' do
        parser.parse(content_to_parse) do |parser, result|
          expect(parser).to eq(StatelessParser)
          expect(result.to_s).to eq("[#<OpenStruct index=0, content=\"Parse\">, #<OpenStruct index=1, content=\"me\">, #<OpenStruct index=2, content=\"statefully!\">, #<OpenStruct index=3, content=\"Parse\">, #<OpenStruct index=4, content=\"me\">, #<OpenStruct index=5, content=\"statically!\">]")
        end
      end
    end

  end

end