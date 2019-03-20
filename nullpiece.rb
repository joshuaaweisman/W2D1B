require_relative "piece"
require "singleton"

class NullPiece
  include Singleton

  def initialize
    @rep = "   "
  end

  def to_s
    @rep
  end

end