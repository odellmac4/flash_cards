class Round

    attr_reader :deck, :turns

    def initialize(deck)
        @deck = deck
        @turns = []
    end

    def current_card
        @deck.cards.fetch(0)
    end

    def take_turn(guess)
        @new_turn = Turn.new(guess , current_card)
        @turns << @new_turn
        @deck.cards.rotate!(1)
        @new_turn
    end

    def number_correct
        @turns.count do |turn|
            turn.correct?
        end
    end

    def number_correct_by_category(category)

        @turns.count {|turn| turn.correct? && turn.card.category == category}

        # category_count = @turns.select { |turn| turn.correct? && turn.card.category == category}
        # category_count.count
    end
end

#How do I make it check thru every turn and see if each is correct (iteration method)
# for number_correct use count method and use it as iteration (count do end)
# @new_turn.correct?

# @turns.count do |turn|
#     turn.correct?
# end

#rotate method