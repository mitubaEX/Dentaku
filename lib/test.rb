require "test/version"
require "test/cli" # ここ追加

module Test
  class Error < StandardError; end
  # Your code goes here...
  class Calculator
    def initialize(word)
      @word = word
    end

    def eval
      @word
    end
  end
end
