# frozen_string_literal: true

module MarsRover
  class Map
    attr_accessor :width, :length

    def initialize(width:, length:)
      raise ArgumentError.new("Incorrect input was passed in.") unless is_valid?(width) && is_valid?(length)

      @width =  width
      @length = length
    end

    def includes_point?(x:, y:)
      return false unless is_valid?(x) && is_valid?(y)
      return false if     x > width    || y > length

      true
    end

    private

    def is_valid?(number)
      return false if number.nil? || not(number.is_a? Integer) || number.negative?

      true
    end
  end
end
