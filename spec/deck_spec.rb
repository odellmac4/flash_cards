require './lib/card'
require './lib/deck'

#Use `before(:each) do` to repeat instances in the describe block

RSpec.describe Deck do
    it 'is a deck' do
        card_1 = Card.new("Where is Barcelona?" , "Spain" , :Geography)
        card_2 = Card.new("Where is Beyonce from?" , "Houston" , :Music)
        card_3 = Card.new("What is Will Smith's occupation?" , "Actor" , :Movies)
        cards = [card_1 , card_2 , card_3]
        deck = Deck.new(cards)
        expect(deck).to be_instance_of Deck
    end

    it 'count of cards in a deck' do
        card_1 = Card.new("Where is Barcelona?" , "Spain" , :Geography)
        card_2 = Card.new("Where is Beyonce from?" , "Houston" , :Music)
        card_3 = Card.new("What is Will Smith's occupation?" , "Actor" , :Movies)
        cards = [card_1 , card_2 , card_3]
        deck = Deck.new(cards)

        expect(deck.count).to eq (3)
    end
end