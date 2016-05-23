require "spec_helper"

describe DynamicParser::RegexCache do

  describe '.match' do
    it 'returns the expected content' do
      expect(
        DynamicParser::RegexCache.match(/txt/,'some txt content') do |matched|
          matched.to_s
        end
      ).to eq('txt')
    end

    if defined?(Rails) && Rails.respond_to?(:cache)
      it 'caches the expected content' do
        class Dummy
          def self.call
            true
          end
        end
        Dummy.should_receive(:call).once
        DynamicParser::RegexCache.match(/txt/,'some txt content') do |matched|
          Dummy.call
          matched.to_s
        end

        DynamicParser::RegexCache.match(/txt/,'some txt content') do |matched|
          Dummy.call
          matched.to_s
        end
      end
    else
      puts "There's no supported cache driver on this environment, skipping the test."
    end

  end

end
