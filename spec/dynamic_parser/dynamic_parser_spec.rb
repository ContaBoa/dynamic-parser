require "spec_helper"

describe DynamicParser, "::config" do
  it "returns a valid version" do
    version = DynamicParser::Version::STRING
    expect(version.split('.').size).to be >= 3
  end
end