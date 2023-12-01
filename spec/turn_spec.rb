require './lib/turn'
require './lib/card'

RSpec.describe Turn do
    it 'is a turn' do
        card = Card.new("Where is Honolulu?" , "Hawaii" , :Geography)
        first_turn = Turn.new("Hawaii" , card)
        expect(first_turn).to be_instance_of Turn
    end

    it 'returns the card used for an instance of a turn' do
        card = Card.new("Where is Honolulu?" , "Hawaii" , :Geography)
        first_turn = Turn.new("Hawaii" , card)
        expect(first_turn.card).to eq (card)
    end

    it 'returns the guess in an instance of a turn' do
        card = Card.new("Where is Honolulu?" , "Hawaii" , :Geography)
        first_turn = Turn.new("Hawaii" , card)
        expect(first_turn.guess). to eq ("Hawaii")
    end

    it 'answer is correct or incorrect' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        first_turn = Turn.new("Juneau" , card)
        expect(first_turn.correct?).to be (true)
    end

end