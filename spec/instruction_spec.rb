# frozen_string_literal: true

# RSpec.describe Instruction do
#   let(:rover)       { MarsRover::MarsRover.new(position: { x: 1, y: 3 }, bearing: 'N') }
#   let(:map)         { MarsRover::Map.new(width: 5, length: 5) }
#   let(:coordinator) { MarsRover::RoversCoordinator.new(rovers: [rover], map: map) }
#   let(:command)     { 'L' }
#   let(:instruction) { Instruction.new(rover: rover, command: command, coordinator: coordinator) }
#
#   it 'has a rover' do
#     expect(instruction.rover).to eq(rover)
#   end
#
#   it 'has a command' do
#     expect(instruction.command).to eq(command)
#   end
#
#   it 'has a coordinator' do
#     expect(instruction.coordinator).to eq(coordinator)
#   end
#
#   context "when applying itself to a rover" do
#     it 'can rotate a rover left' do
#       instruction.command = 'L'
#       expect { instruction.apply }.to change{ rover.bearing }.from('N').to('W')
#     end
#
#     it 'can rotate a rover right' do
#       instruction.command = 'R'
#       expect { instruction.apply }.to change{ rover.bearing }.from('N').to('E')
#     end
#
#     it 'can tell the coordinator to move it' do
#       instruction.command = 'M'
#       expect { instruction.apply }.to change{ rover.y }.by(1)
#     end
#   end
# end
