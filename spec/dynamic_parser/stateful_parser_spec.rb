require "spec_helper"

describe StatefulParser do
  let(:parser) { StatefulParser.new }
  let(:content_to_parse) { 'Parse me statefully!' }
  let(:content_to_reject) { 'Do not parse this!' }
  
  describe ".detect" do
    context 'parseable content' do
      it "returns true" do
        expect(parser.detect(content_to_parse)).to eq(true)
      end
    end
    context 'rejectable content' do
      it "returns false" do
        expect(parser.detect(content_to_reject)).to eq(false)
      end
    end
  end

  describe '#parse' do
    before(:each) do
      parser.parse!(content_to_parse)
    end
    it 'parses the content properly' do
      expect(parser.gimme_data.to_s).to eq("[#<OpenStruct index=0, content=\"Parse\">, #<OpenStruct index=1, content=\"me\">, #<OpenStruct index=2, content=\"statefully!\">]")
    end
  end

end
