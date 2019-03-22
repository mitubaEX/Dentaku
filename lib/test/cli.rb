require 'test'
require 'thor'

module Test
  class CLI < Thor
    desc "dentaku EXPRESSION", "eval expression." # コマンドの使用例と、概要
    def dentaku(word) # コマンドはメソッドとして定義する
      calculator = Calculator.new(word)
      puts calculator.eval
    end
  end
end
