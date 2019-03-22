require 'dentaku'
require 'thor'

module Dentaku
  class CLI < Thor
    desc "dentaku EXPRESSION", "eval expression." # コマンドの使用例と、概要
    def dentaku(word) # コマンドはメソッドとして定義する
      puts Dentaku.new.perform(word)
    end
  end
end
