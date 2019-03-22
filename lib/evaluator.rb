require 'pry'

module Dentaku
  class Evaluator
    def initialize(word)
      @words = word.split("")
      @current_index = 0
      @func_args = {}
      @func_bodies = {}
    end

    def eval
      skip_whitespace

      if is_def?
        # slide 'def' string
        @current_index += 3
        skip_whitespace

        func_name = parse_letters
        @func_args[func_name] = parse_func_args
        @func_bodies[func_name] = parse_func_body
      end

      puts eval_expr
      eval_call_func
    end

    def eval_call_func
      skip_whitespace

      if is_letter?(@words[@current_index])
        func_name = parse_letters
        return @func_bodies[func_name]
      end
    end

    def parse_letters
      str = ''
      while is_letter?(@words[@current_index]) do
        str += @words[@current_index]
        @current_index += 1
      end
      str
    end

    def parse_func_args
      skip_whitespace
      @current_index += 1
      skip_whitespace

      value = eval_expr

      skip_whitespace
      @current_index += 1
      skip_whitespace

      value
    end

    def parse_func_body
      skip_whitespace
      @current_index += 1
      skip_whitespace

      value = eval_expr

      skip_whitespace
      @current_index += 1
      skip_whitespace

      value
    end

    def is_letter?(word)
      (word =~ /^[a-zA-Z]$/) == 0
    end

    def is_def?
      if @words.length >= 3
        combine_string = @words.slice(@current_index, @current_index + 3)
        return combine_string.join("") == 'def' ? true : false
      end

      false
    end

    def eval_expr
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

      value = 0
      if is_digit?(current_word)
        value = parse_digit
      elsif is_rparen(current_word)
        @current_index += 1
        value = eval_expr
        @current_index += 1
      end
      value
    end

    def is_rparen(word)
      word == '('
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

