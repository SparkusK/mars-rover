#frozen_string_literal: true

RSpec.describe Client do
  let(:test_input) {
    %{
      5 5

      1 2 N

      LMLMLMLMM

      3 3 E

      MMRMMRMRRM
    }
  }

  let(:expected_output) { "1 3 N\n5 1 E" }

  it "should match the test input to the expected output" do
    client = Client.new(input_string: test_input)

    expect(client.retrieve_formatted_output).to match(expected_output)
  end
end
