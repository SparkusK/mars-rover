class InstructionsParser
  attr_accessor :coordinator, :rover_instructions

  # TODO: make sure the input string is valid, raise an error if not
  def initialize(input_string:)
    substrings = cleaned_substrings(input_string)

    rovers             = []
    rover_instructions = Hash.new(0)
    chunked_rover_data_and_instructions(substrings).each do |rover_instruction_map|
      rover   = extract_rover(rover_instruction_map)
      rovers += [rover]
      rover_instructions[rover] = rover_instruction_map[1]
    end

    @rover_instructions = rover_instructions
    @coordinator        = MarsRover::RoversCoordinator.new(map: extract_map(substrings[0]), rovers: rovers)
  end

  def apply_instructions
    rover_instructions.each do |rover, commands|
      coordinator.apply_instructions(rover: rover, command_list: command_list)
    end
  end

  private

  def extract_map(substring)
    map_dimensions = substring.split(' ').map(&:to_i)

    MarsRover::Map.new(width: map_dimensions.first, length: map_dimensions.last)
  end

  def extract_rover(rover_instruction_map)
    rover_data = rover_instruction_map[0].split(' ')

    x       = rover_data[0].to_i
    y       = rover_data[1].to_i
    bearing = rover_data[2]

    MarsRover::MarsRover.new(position: { x: x, y: y }, bearing: bearing)
  end

  # This returns something like [["1 2 N", "LMLMLMLMM"], ["3 3 E", "MMRMMRMRRM"]]
  def chunked_rover_data_and_instructions(substrings)
    substrings[1..-1].each_slice(2).to_a
  end

  def cleaned_substrings(input_string)
    input_string.split("\n").reject(&:empty?).map(&:strip)
  end
end
