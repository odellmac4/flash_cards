require './lib/turn'
require './lib/card'

RSpec.describe Turn do
    it 'is a turn' do
    first_turn = Turn.new("Hawaii" , Card)
    expect(first_turn).to be_instance_of Turn
    end
end