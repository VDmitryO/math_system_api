require 'rails_helper'
# Specs in this file have access to a helper object that includes
# the TaskServiceHelper. For example:
#
# describe TaskServiceHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe TasksService do
  let(:a) { rand(-100.0..100.0).to_s }
  let(:b) { rand(-100.0..100.0).to_s }
  let(:c) { rand(-100.0..100.0).to_s }
  let(:d) { rand(-100.0..100.0).to_s }

  it 'should do [] for linear equation with a = 0' do
    result = TasksService.new.get_result(:'a' => '0', :'b' => b, :'c' => c)
    p result
    expect(result).to be_empty
  end

  it 'should do [] for quadratic equation with a = 0 b = 0' do
    result = TasksService.new.get_result(a: '0', b: '0', c: c, d: d)
    expect(result).to be_empty
  end

  it 'should do nil for equation with param = string' do
    result = TasksService.new.get_result(a: 'sdf', b: b, c: c)
    expect(result).to be_nil
  end

  it 'should do array for linear equation' do
    result = TasksService.new.get_result(a: a, b: b, c: c)
    expect(result.class).to  be(Array)
  end

  it 'should do array for quadratic equation' do
    result = TasksService.new.get_result(a: a, b: b, c: c, d: d)
    expect(result.class).to be(Array)
  end

end
