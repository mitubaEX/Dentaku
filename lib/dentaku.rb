require "dentaku/version"
require "dentaku/cli" # ここ追加

module Dentaku
  class Error < StandardError; end
  # Your code goes here...
  class Calculator
    def initialize(word)
      @words = word.split("")
      @current_index = 0
      @previous_index = 0
    end

    def eval
      value = self.eval_term

      skip_whitespace
      current_word = @words[@current_index]
      while current_word == '+' || current_word == '-' do
        skip_whitespace
        current_word = @words[@current_index]

        case current_word
        when '+'
          @current_index += 1
          value += self.eval_term
        when '-'
          @current_index += 1
          value -= self.eval_term
        end
      end
      value
    end

    def eval_term
      value = self.eval_fact

      skip_whitespace
      current_word = @words[@current_index]
      while current_word == '*' || current_word == '/' || current_word == '/' do
        skip_whitespace
        current_word = @words[@current_index]

        case current_word
        when '*'
          @current_index += 1
          value *= self.eval_fact
        when '/'
          @current_index += 1
          value /= self.eval_fact
        when '%'
          @current_index += 1
          value %= self.eval_fact
        end
      end
      value
    end

    def eval_fact
      skip_whitespace
      current_word = @words[@current_index]

      if is_digit?(current_word)
        parse_digit
      end

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
