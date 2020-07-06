module MarsRover
  class MarsRover
    attr_accessor :position, :bearing

    def initialize(position: default_position, bearing: default_bearing)
      @position = position
      @bearing  = bearing
    end

    def x
      position[:x]
    end

    def y
      position[:y]
    end

    def destination
      case @bearing
        when 'N' then { x: x,     y: y + 1 }
        when 'E' then { x: x + 1, y: y     }
        when 'S' then { x: x,     y: y - 1 }
        when 'W' then { x: x - 1, y: y     }
      end
    end

    def move_forward
      @position = destination
    end

    def rotate(direction)
      if left_aliases.include? direction.to_s.downcase
        rotate_left
      elsif right_aliases.include? direction.to_s.downcase
        rotate_right
      else
        raise ArgumentError.new("Incorrect direction specified. The correct inputs are: #{direction_aliases}")
      end
    end

    private

    def default_position
      { x: 0, y: 0 }
    end

    def default_bearing
      'N'
    end

    def rotate_right
      @bearing =
      case @bearing
        when 'N' then 'E'
        when 'E' then 'S'
        when 'S' then 'W'
        when 'W' then 'N'
      end
    end

    def rotate_left
      @bearing =
      case @bearing
        when 'N' then 'W'
        when 'W' then 'S'
        when 'S' then 'E'
        when 'E' then 'N'
      end
    end

    def left_aliases
      %w{ l left anticlockwise anti-clockwise -90 }
    end

    def right_aliases
      %w{ r right clockwise 90 }
    end

    def direction_aliases
      left_aliases + right_aliases
    end
  end
end
