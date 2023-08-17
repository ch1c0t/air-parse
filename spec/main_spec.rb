require 'helper'

describe Air::Parse do
  let(:stairs) {
    Air.parse_file 'spec/flutter.air'
  }

  it do
    expect(stairs).to pose {
      is_a Array
    }
  end
end
