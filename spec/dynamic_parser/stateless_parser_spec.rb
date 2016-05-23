require "spec_helper"

describe StatelessParser do
  let(:parser) { StatelessParser }
  let(:content_to_parse) { 'Parse me statically!' }
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

  describe '.parse' do
    it 'parses the content properly returning its product' do
      expect(parser.parse(content_to_parse).to_s).to eq("[#<OpenStruct index=0, content=\"Parse\">, #<OpenStruct index=1, content=\"me\">, #<OpenStruct index=2, content=\"statically!\">]")
    end
  end

end
