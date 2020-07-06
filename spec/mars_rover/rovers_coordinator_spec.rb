# frozen_string_literal: true

RSpec.describe MarsRover::RoversCoordinator do
  let(:rovers) { [
    MarsRover::MarsRover.new(position: { x: 1,  y: 5 }, bearing: 'N'),
    MarsRover::MarsRover.new(position: { x: 1,  y: 6 }, bearing: 'E'),
    MarsRover::MarsRover.new(position: { x: 10, y: 8 }, bearing: 'E'),
  ]}
  let(:map)         { MarsRover::Map.new(width: 10, length: 10) }
  let(:coordinator) { described_class.new(rovers: rovers, map: map) }

  it 'has a list of Rovers' do
    expect(coordinator.rovers).to eq(rovers)
  end

  it 'has a Map' do
    expect(coordinator.map).to eq(map)
  end

  it 'retrieves a list of Rover positions' do
    expect(coordinator.rover_positions).to eq(
      "1 5 N\n" +
      "1 6 E\n" +
      "10 8 E"
    )
  end

  context 'when dealing with moving rovers' do
    let(:blocked_rover)      { rovers.first }
    let(:on_the_edge_rover)  { rovers.last }
    let(:unobstructed_rover) { rovers[1] }

    context 'when being asked if a rover can move' do
      it 'will report that a rover cannot move if there is another rover in the way' do
        expect(coordinator.can_move?(blocked_rover)).to be_falsey
      end

      it 'will report that a rover cannot move if the destination is out of bounds' do
        expect(coordinator.can_move?(on_the_edge_rover)).to be_falsey
      end

      it 'will report that a rover can move if the conditions are met' do
        expect(coordinator.can_move?(unobstructed_rover)).to be true
      end
    end

    context 'when moving a rover' do
      it 'will move the rover if it can move' do
        expect { coordinator.move(unobstructed_rover) }.to change { unobstructed_rover.x }.by(1)
      end

      it 'will not move the rover if it cannot move' do
        expect { coordinator.move(on_the_edge_rover) }.to_not change { unobstructed_rover.x }
      end
    end
  end
end
