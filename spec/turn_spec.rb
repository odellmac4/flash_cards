require './lib/turn'
require './lib/card'

RSpec.describe Turn do
    it 'is a turn' do
    card = Card.new("Where is Honolulu?" , "Hawaii" , :Geography)
    first_turn = Turn.new("Hawaii" , card)
    expect(first_turn).to be_instance_of Turn
    end
end