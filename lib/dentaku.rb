require "dentaku/version"
require "dentaku/cli" # ここ追加
require "evaluator"

module Dentaku
  class Error < StandardError; end
  # Your code goes here...
  class Dentaku
    def perform(word)
      Evaluator.new(word).eval_expr
    end
  end
end
