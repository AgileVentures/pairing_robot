require 'pairing_robot'

describe 'pairing_robot' do

  subject(:robot_math) { RobotMath.new }

  let(:single_argument_error) do
    double ArgumentError, 
           message: 'wrong number of arguments (given 1, expected 0)',
           backtrace: ["(eval):1:in `triple'"],
           class: ArgumentError
  end

  let(:double_argument_error) do
    double ArgumentError, 
           message: 'wrong number of arguments (given 2, expected 1)',
           backtrace: ["(eval):1:in `triple'"],
           class: ArgumentError
  end

  it 'can fix a NoMethodError' do
    fix_code(NoMethodError.new("undefined method `triple' for main:Object"))
    expect { triple }.not_to raise_error NoMethodError
  end

  it 'can fix an ArgumentError for one missing argument' do
    fix_code(single_argument_error)
    expect { triple(2) }.not_to raise_error ArgumentError
  end

  it 'can fix an ArgumentError for two missing arguments' do
    fix_code(double_argument_error)
    expect { triple(2,3) }.not_to raise_error ArgumentError
  end

  xit 'can fix a NoMethodError on an object'

  xit 'can fix a ArgumentError on an object'

end