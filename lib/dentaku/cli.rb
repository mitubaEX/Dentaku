require 'dentaku'
require 'thor'

module Dentaku
  class CLI < Thor
    desc "dentaku EXPRESSION", "eval expression." # コマンドの使用例と、概要
    def dentaku(word) # コマンドはメソッドとして定義する
      calculator = Calculator.new(word)
      puts calculator.eval_expr
    end
  end
end
