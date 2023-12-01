require './lib/card'
require './lib/deck'

RSpec.describe Deck do
    it 'creates an array of cards' do
        card_1 = Card.new("Where is Barcelona?" , "Spain" , :Geography)
        card_2 = Card.new("Where is Beyonce from?" , "Houston" , :Music)
        card_3 = Card.new("What is Will Smith's occupation?" , "Actor" , :Movies)
        cards = [card_1 , card_2 , card_3]
        deck = Deck.new(cards)
        expect(deck).to be_instance_of Deck
    end
end