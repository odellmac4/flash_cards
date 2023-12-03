class Deck

    attr_reader :cards, :count

    def initialize(cards)
        @cards = cards
        @count = cards.length
    end

    def cards_in_category(category)
        @cards.select { |card| card.category == category }
    end
end

    # try select method or each method