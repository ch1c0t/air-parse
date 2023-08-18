require 'helper'

describe Air::Parse do
  let(:stairs) {
    Air.parse_file 'spec/flutter.air'
  }

  it 'returns an Array of Stairs' do
    expect(stairs).to pose {
      is_a Array
      its :size, 4
    }

    stairs.each do |stair|
      expect(stair).to be_a Air::Parse::Stair
    end
  end

  it 'Stair#line' do
    expect(stairs[0].line).to eq "import 'dart:async'"
    expect(stairs[1].line).to eq "import 'package:flutter/material.dart'"
    expect(stairs[2].line).to eq "class MyWidget extends StatelessWidget"
    expect(stairs[3].line).to eq "class BlueBox extends StatelessWidget"
  end

  it 'Stair#stairs' do
    expect(stairs[0]).to pose {
      its :stairs, []
    }

    expect(stairs[1]).to pose {
      its :stairs, []
    }
    
    expect(stairs[2].stairs.size).to be 2
    expect(stairs[3].stairs.size).to be 4

    array = stairs[3].stairs.map(&:line)
    expect(array).to pose {
      is_a Array
      key 0, '@override'
      key 1, 'Widget build(BuildContext context)'
      key 2, 'third stair'
      key 3, 'fourth stair'
    }
  end

  it 'Stair#leaf?' do
    expect(stairs[0].leaf?).to be true
    expect(stairs[1].leaf?).to be true

    a = stairs[3].stairs
    expect(a[0].leaf?).to be true
    expect(a[1].leaf?).to be false
    expect(a[2].leaf?).to be true
    expect(a[3].leaf?).to be true
  end
end
