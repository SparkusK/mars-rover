# frozen_string_literal: true

RSpec.describe InstructionsParser do
  context 'when it parses a string' do
    let(:input_string) { <<-EOS
      5 5

      1 2 N

      LMLMLMLMM

      3 3 E

      MMRMMRMRRM
    EOS
    }

    it 'parses the string into relevant objects', :aggregate_failures do
      outcome = described_class.parse(input_string: input_string)

      expected_rovers      = [ MarsRover::MarsRover.new(position: { x: 1, y: 2 }, bearing: 'N'), MarsRover::MarsRover.new(position: { x: 3, y: 3 }, bearing: 'E')]
      expected_map         = MarsRover::Map.new(width: 5, length: 5)
      expected_coordinator = MarsRover::RoversCoordinator.new(rovers: expected_rovers, map: expected_map, rover_instructions: {})

      expect(outcome.rovers.first.position).to  eq(expected_rovers.first.position)
      expect(outcome.rovers.first.bearing).to   eq(expected_rovers.first.bearing)
      expect(outcome.rovers.last.position).to   eq(expected_rovers.last.position)
      expect(outcome.rovers.last.bearing).to    eq(expected_rovers.last.bearing)

      expect(outcome.map.width).to  eq(expected_map.width)
      expect(outcome.map.length).to eq(expected_map.length)

      expect(outcome.rover_instructions.keys.first.position).to eq(expected_rovers.first.position)
      expect(outcome.rover_instructions.keys.first.bearing).to  eq(expected_rovers.first.bearing)
      expect(outcome.rover_instructions.values.first).to        eq("LMLMLMLMM")

      expect(outcome.rover_instructions.keys.last.position).to eq(expected_rovers.last.position)
      expect(outcome.rover_instructions.keys.last.bearing).to  eq(expected_rovers.last.bearing)
      expect(outcome.rover_instructions.values.last).to        eq("MMRMMRMRRM")
    end
  end
end
