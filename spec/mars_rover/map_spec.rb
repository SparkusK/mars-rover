# frozen_string_literal: true

RSpec.describe MarsRover::Map do
  let(:map) { MarsRover::Map.new(width: 5, length: 5) }

  it 'has a width' do
    expect(map.width).to eq(5)
  end

  it 'has a length' do
    expect(map.length).to eq(5)
  end

  it 'can tell when a point is out of bounds', :aggregate_failures do
    expect(map.includes_point?(x: 7,  y: 3 )).to be_falsey
    expect(map.includes_point?(x: -1, y: 3 )).to be_falsey
    expect(map.includes_point?(x: 3,  y: 7 )).to be_falsey
    expect(map.includes_point?(x: 3,  y: -1)).to be_falsey

    expect(map.includes_point?(x: 3,  y: 3)).to be true
  end

  context 'when initializing maps' do
    it 'fails when incorrect input is given', :aggregate_failures do
      expect { described_class.new() }.to                      raise_error(ArgumentError)
      expect { described_class.new(width:  1) }.to             raise_error(ArgumentError)
      expect { described_class.new(length: 1) }.to             raise_error(ArgumentError)

      expect { described_class.new(width: nil, length: 3) }.to raise_error(ArgumentError)
      expect { described_class.new(width: 3, length: nil) }.to raise_error(ArgumentError)

      expect { described_class.new(width: -1, length: 3)  }.to raise_error(ArgumentError)
      expect { described_class.new(width: 3,  length: -1) }.to raise_error(ArgumentError)
    end
  end
end
