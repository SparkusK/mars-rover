class Client
  attr_accessor :coordinator

  # Usage:
  # client = MarsRover::Client.new(input_string: input_string)
  #
  # client.retrieve_formatted_output
  def initialize(input_string:)
    @coordinator = InstructionsParser.parse(input_string: input_string)
  end

  def retrieve_formatted_output
    coordinator.apply_instructions
    coordinator.rover_positions
  end
end
