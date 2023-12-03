require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
    it 'is a round' do
        card_1 = Card.new("Where is Barcelona?" , "Spain" , :Geography)
        card_2 = Card.new("Where is Beyonce from?" , "Houston" , :Music)
        card_3 = Card.new("What is Will Smith's occupation?" , "Actor" , :Movies)
        cards = [card_1 , card_2 , card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        expect(round).to be_instance_of(Round)
    end

    it 'is a deck' do
        card_1 = Card.new("Where is Barcelona?" , "Spain" , :Geography)
        card_2 = Card.new("Where is Beyonce from?" , "Houston" , :Music)
        card_3 = Card.new("What is Will Smith's occupation?" , "Actor" , :Movies)
        cards = [card_1 , card_2 , card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        expect(round.deck).to eq(deck)
    end

    it 'returns a Turn object with the card used for a specific turn' do
        card_1 = Card.new("Where is Barcelona?" , "Spain" , :Geography)
        card_2 = Card.new("Where is Beyonce from?" , "Houston" , :Music)
        card_3 = Card.new("What is Will Smith's occupation?" , "Actor" , :Movies)
        cards = [card_1 , card_2 , card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        expect(round.turns).to eq([])
    end

    it 'current card is the first card in the deck' do
        card_1 = Card.new("Where is Barcelona?" , "Spain" , :Geography)
        card_2 = Card.new("Where is Beyonce from?" , "Houston" , :Music)
        card_3 = Card.new("What is Will Smith's occupation?" , "Actor" , :Movies)
        cards = [card_1 , card_2 , card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)
        
        expect(round.current_card).to eq(card_1)
    end
end