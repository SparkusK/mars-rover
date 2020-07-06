class Instruction
  attr_accessor :rover, :command, :coordinator

  def initialize(rover:, command:, coordinator:)
    @rover       = rover
    @command     = command
    @coordinator = coordinator
  end

  def apply(rover)
    rover.rotate('l')       if command == 'L'
    rover.rotate('r')       if command == 'R'
    coordinator.move(rover) if command == 'M'
  end
end
