require "test/version"
require "test/cli" # ここ追加

module Test
  class Error < StandardError; end
  # Your code goes here...
  class Calculator
    def initialize(word)
      @words = word.split("")
      @current_index = 0
      @previous_index = 0
    end

    def eval
      value = 0
      while @current_index != @words.length do
        skip_whitespace
        current_word = @words[@current_index]

        if is_digit?(current_word)
          value = parse_digit

        elsif is_plus?(current_word)
          @current_index += 1
          value = value + self.eval

        elsif is_minus?(current_word)
          @current_index += 1
          value = value - self.eval

        elsif is_multi?(current_word)
          @current_index += 1
          value = value * self.eval

        elsif is_div?(current_word)
          @current_index += 1
          value = value / self.eval

        elsif is_mod?(current_word)
          @current_index += 1
          value = value % self.eval
        end
      end
      value
    end

    def is_plus?(word)
      word == '+'
    end
    def is_minus?(word)
      word == '-'
    end
    def is_multi?(word)
      word == '*'
    end
    def is_div?(word)
      word == '/'
    end
    def is_mod?(word)
      word == '%'
    end

    def parse_digit
      num = 0
      while is_digit?(@words[@current_index]) do
        num = num * 10 + @words[@current_index].to_i
        @current_index += 1
      end
      num
    end

    def is_digit?(word)
      (word =~ /^[0-9]$/) == 0
    end

    def skip_whitespace
      while is_whitespace? do
        @current_index += 1
      end
    end

    def is_whitespace?
      @words[@current_index] == ' '
    end
  end
end
