# frozen_string_literal: true

RSpec.describe MarsRover::MarsRover do
  let(:rover) { described_class.new(position: { x: 1, y: 3 }, bearing: 'N') }

  it 'has a position' do
    expect(rover.position).to eq( { x: 1, y: 3 } )
  end

  it 'has a bearing' do
    expect(rover.bearing).to eq('N')
  end

  it 'has a destination' do
    expect(rover.destination).to eq({ x: 1, y: 4 })
  end

  context 'when rotating' do
    it 'can rotate left' do
      expect { rover.rotate('L') }.to change { rover.bearing }.from('N').to('W')
    end

    it 'can rotate right' do
      expect { rover.rotate('R') }.to change { rover.bearing }.from('N').to('E')
    end

    it 'raises an error when an invalid direction is offered' do
      expect { rover.rotate('nope')}.to raise_error(ArgumentError)
    end
  end

  context 'when moving forward' do
    it 'only moves forward one square' do
      expect { rover.move_forward }.to change { rover.position } \
      .from({ x: 1, y: 3 })
      .to(  { x: 1, y: 4 })
    end

    it 'does not change bearing' do
      expect { rover.move_forward }.to_not change { rover.bearing }
    end
  end
end
