require 'pry'

module MarsRover
  class RoversCoordinator
    attr_accessor :rovers, :map, :rover_instructions

    def initialize(rovers:, map:, rover_instructions:)
      @rovers             = rovers
      @map                = map
      @rover_instructions = rover_instructions
    end

    def apply_instructions
      rover_instructions.each do |rover, commands|
        commands.each_char do |command|
          apply_instruction(command, rover)
        end
      end
    end

    def can_move?(rover)
      return true unless there_is_another_rover?(rover) or it_will_fall_off?(rover)

      false
    end

    def move(rover)
      rover.move_forward if can_move?(rover)
    end

    def rover_positions
      rovers.map(&:formatted_position).join("\n")
    end

    private

    def apply_instruction(command, rover)
      rover.rotate('l') if command == 'L'
      rover.rotate('r') if command == 'R'
      move(rover)       if command == 'M'
    end

    def there_is_another_rover?(rover)
      rover.destination.tap do |p|
        rovers.each do |other_rover|
          return true if p[:x] == other_rover.x && p[:y] == other_rover.y
        end
      end

      false
    end

    def it_will_fall_off?(rover)
      return true if rover.bearing == 'N' && rover.y == map.length
      return true if rover.bearing == 'E' && rover.x == map.width
      return true if rover.bearing == 'S' && rover.y == 0
      return true if rover.bearing == 'W' && rover.x == 0

      false
    end
  end
end
