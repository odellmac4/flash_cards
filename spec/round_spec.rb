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

    it 'is a turn' do
        card_1 = Card.new("Where is Barcelona?" , "Spain" , :Geography)
        card_2 = Card.new("Where is Beyonce from?" , "Houston" , :Music)
        card_3 = Card.new("What is Will Smith's occupation?" , "Actor" , :Movies)
        cards = [card_1 , card_2 , card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)
        @new_turn = round.take_turn("Spain")

        expect(@new_turn).to be_instance_of (Turn)
    end

     it 'is a new turn' do
        card_1 = Card.new("Where is Barcelona?" , "Spain" , :Geography)
        card_2 = Card.new("Where is Beyonce from?" , "Houston" , :Music)
        card_3 = Card.new("What is Will Smith's occupation?" , "Actor" , :Movies)
        cards = [card_1 , card_2 , card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        @new_turn = round.take_turn("Spain")
        expect(@new_turn.correct?).to eq (true)

        @new_turn = round.take_turn("New Orleans")
        expect(@new_turn.correct?).to eq (false)
     end

     it 'shows instances of a turn in the turns method(array)' do
        card_1 = Card.new("Where is Barcelona?" , "Spain" , :Geography)
        card_2 = Card.new("Where is Beyonce from?" , "Houston" , :Music)
        card_3 = Card.new("What is Will Smith's occupation?" , "Actor" , :Movies)
        cards = [card_1 , card_2 , card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        @new_turn = round.take_turn("Spain")
        expect(round.turns).to eq([@new_turn])
     end

     it 'shows count of correct turns' do
        card_1 = Card.new("Where is Barcelona?" , "Spain" , :Geography)
        card_2 = Card.new("Where is Beyonce from?" , "Houston" , :Music)
        card_3 = Card.new("What is Will Smith's occupation?" , "Actor" , :Movies)
        cards = [card_1 , card_2 , card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        @new_turn = round.take_turn("Spain")
        expect(round.number_correct).to eq(1)
     end

     it 'shows card for the next turn' do
        card_1 = Card.new("Where is Barcelona?" , "Spain" , :Geography)
        card_2 = Card.new("Where is Beyonce from?" , "Houston" , :Music)
        card_3 = Card.new("What is Will Smith's occupation?" , "Actor" , :Movies)
        cards = [card_1 , card_2 , card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        @new_turn = round.take_turn("Houston")

        expect(round.current_card).to eq(card_2)

        @new_turn = round.take_turn("Actor")
        expect(round.current_card).to eq (card_3)
     end

    # pry(main)> round.take_turn("Venus")
        #=> #<Turn:0x00007f972a215b38...>
     it 'can take a second turn' do
        card_1 = Card.new("Where is Barcelona?" , "Spain" , :Geography)
        card_2 = Card.new("Where is Beyonce from?" , "Houston" , :Music)
        card_3 = Card.new("What is Will Smith's occupation?" , "Actor" , :Movies)
        cards = [card_1 , card_2 , card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)
        
        first_turn = round.take_turn("Spain") # First turn
        second_turn = round.take_turn("Houston") # Second turn

        expect(second_turn).to be_instance_of(Turn)
     end

     it 'counts number of turns' do
        card_1 = Card.new("Where is Barcelona?" , "Spain" , :Geography)
        card_2 = Card.new("Where is Beyonce from?" , "Houston" , :Music)
        card_3 = Card.new("What is Will Smith's occupation?" , "Actor" , :Movies)
        cards = [card_1 , card_2 , card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)
        
        first_turn = round.take_turn("Spain") # First turn
        second_turn = round.take_turn("Houston") # Second turn

        expect(round.turns.count).to eq(2)
     end

     it 'guess in last turn is incorrect' do
        card_1 = Card.new("Where is Barcelona?" , "Spain" , :Geography)
        card_2 = Card.new("Where is Beyonce from?" , "Houston" , :Music)
        card_3 = Card.new("What is Will Smith's occupation?" , "Actor" , :Movies)
        cards = [card_1 , card_2 , card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        first_turn = round.take_turn("Spain") # First turn
        second_turn = round.take_turn("Houston") # Second turn
        third_turn = round.take_turn("Carpenter") # Third turn

        expect(round.turns.last.feedback).to eq("Incorrect.")
        expect(round.number_correct).to eq(2)
     end

     it 'shows count of correct turns in a specific category' do
        card_1 = Card.new("Where is Barcelona?" , "Spain" , :Geography)
        card_2 = Card.new("Where is Beyonce from?" , "Houston" , :Music)
        card_3 = Card.new("What is Will Smith's occupation?" , "Actor" , :Movies)
        cards = [card_1 , card_2 , card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        first_turn = round.take_turn("Spain") # First turn
        second_turn = round.take_turn("Houston") # Second turn
        third_turn = round.take_turn("Carpenter") # Third turn

        expect(round.number_correct_by_category(:Geography)). to eq(1)
        expect(round.number_correct_by_category(:Music)).to eq(1)
        expect(round.number_correct_by_category(:Movies)).to eq(0)
     end

     it 'what percentage of cards are correct?' do
        card_1 = Card.new("Where is Barcelona?" , "Spain" , :Geography)
        card_2 = Card.new("Where is Beyonce from?" , "Houston" , :Music)
        card_3 = Card.new("What is Will Smith's occupation?" , "Actor" , :Movies)
        cards = [card_1 , card_2 , card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        first_turn = round.take_turn("Spain") # First turn
        second_turn = round.take_turn("Houston") # Second turn
        third_turn = round.take_turn("Carpenter") # Third turn

        expect(round.percent_correct).to eq(66.7)
     end
end