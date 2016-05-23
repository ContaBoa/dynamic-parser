[![Code Climate](https://codeclimate.com/github/lucasmartins/dynamic_parser.png)](https://codeclimate.com/github/lucasmartins/dynamic_parser) [![Code Climate](https://codeclimate.com/github/lucasmartins/dynamic_parser/coverage.png)](https://codeclimate.com/github/lucasmartins/dynamic_parser) [ ![Codeship Status for ContaBoa/dynamic_parser](https://codeship.io/projects/dee1ef60-da1c-0131-2e3f-2a27b6732ed0/status)](https://codeship.io/projects/24259)

Dynamic Parser
==============

**IN PROGRESS**

Install
=======

Just add it to your Gemfile - not really
```ruby
  gem 'dynamic_parser', github: 'agentevirtual/dynamic_parser'
```

Use
===

Your Dynamic Parser may be a composite of both `Stateless` and `Stateful` parsers. To build a composite/dynamic paser, first you need one or more `MicroParsers`.

The following samples will expect a text/String as the received artifact to be parsed, but you're free to use any kind of object/content.

## Stateless MicroParser

```ruby
# parses the artifact statically
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
```

## Stateful MicroParser

```ruby
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
```

## Composite Parser

When running a composite parser, all `MicroParsers` found at `.micro_parsers` will be filtered through the `.detect` method, and then called `.parse`/`#parse`.

```ruby
class CompositeParser
  include DynamicParser::Parser
  def self.micro_parsers
    [StatefulParser, StatelessParser]
  end
end
```

```ruby
# run you dynamic parser
CompositeParser.parse do |micro_parser, output|
  case
  when micro_parser==StatelessParser
    # do something with output here
  end
end
```

Docs
====
You should check the [factories](https://github.com/ContaBoa/dynamic_parser/tree/master/spec/factories) to learn what you need to build your objects, and the [tests](https://github.com/ContaBoa/dynamic_parser/tree/master/spec/DynamicParser) to learn how to use them. But hey, we have docs [right here](http://rdoc.info/github/ContaBoa/dynamic_parser/master/frames).

Roadmap
=======

- ...;

Contribute
==========

Just fork [DynamicParser](https://github.com/ContaBoa/dynamic_parser), add your feature+spec, and make a pull request.

License
=======

Please see [LICENSE](https://github.com/ContaBoa/dynamic_parser/blob/master/LICENSE) for licensing details.
