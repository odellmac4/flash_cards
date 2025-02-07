require 'pry'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

@card_1 = Card.new("Where is Barcelona?" , "spain" , :Geography)
@card_2 = Card.new("What is the name of Beyonce's first album?" , "dangerously in love" , :Music)
@card_3 = Card.new("Will Smith starred as a genie in what movie?" , "aladdin" , :Movies)
@card_4 = Card.new("In what city is the Mona Lisa located?" , "paris" , :Geography)
@card_5 = Card.new("What artist is performing at this year's Super Bowl?" , "usher" , :Music)
@card_6 = Card.new("What actor plays the voice of shrek?" , "mike myers" , :Movies)

@cards = [@card_1 , @card_2 , @card_3 , @card_4 , @card_5 , @card_6]

# @cards = CardGenerator.new("card.txt")

@deck = Deck.new(@cards)

@round = Round.new(@deck)

@number_of_card = 1

def start


    puts "Welcome! You're playing with #{@cards.count} cards"
    puts "-------------------------------------------------"
    
    # *MORE FLEXIBLE METHOD*
    # @cards.each do |card|
    #     puts "This is card number 1 out of #{@cards.count}."

    #     puts "Question: #{card.question}"
    #     guess = gets.chomp

    #     turn = @round.take_turn(guess)
    #     puts turn.feedback
    #     @number_of_card += 1

    # end

        puts "This is card number #{@number_of_card} out of #{@cards.count}." 
        
        puts "Question: #{@card_1.question}"
        guess_1 = gets.chomp
        
        turn_1 = @round.take_turn(guess_1)
        puts turn_1.feedback
        @number_of_card += 1
        
        puts "This is card number #{@number_of_card} out of #{@cards.count}."
        
        puts "Question: #{@card_2.question}"
        guess_2 = gets.chomp

        turn_2 = @round.take_turn(guess_2)
        puts turn_2.feedback
        @number_of_card += 1

        puts "This is card number #{@number_of_card} out of #{@cards.count}."
        
        puts "Question: #{@card_3.question}"
        guess_3 = gets.chomp

        turn_3 = @round.take_turn(guess_3)
        puts turn_3.feedback
        @number_of_card += 1

        puts "This is card number #{@number_of_card} out of #{@cards.count}."
        
        puts "Question: #{@card_4.question}"
        guess_4 = gets.chomp

        turn_4 = @round.take_turn(guess_4)
        puts turn_4.feedback
        @number_of_card += 1

        puts "This is card number #{@number_of_card} out of #{@cards.count}."
        
        puts "Question: #{@card_5.question}"
        guess_5 = gets.chomp

        turn_5 = @round.take_turn(guess_5)
        puts turn_5.feedback
        @number_of_card += 1

        puts "This is card number #{@number_of_card} out of #{@cards.count}."
        
        puts "Question: #{@card_6.question}"
        guess_6 = gets.chomp

        turn_6 = @round.take_turn(guess_6)
        puts turn_6.feedback
        @number_of_card += 1

        puts "****** Game over! ******"
        puts "You had #{@round.number_correct} out of #{@cards.count} for a score of #{@round.percent_correct}%"

        def individual_category_count
            individual_category = []
            @cards.each do |card|
                individual_category << card.category
            end
            individual_category.uniq!
        end

        individual_category_count.each do |category|
            puts "#{category} - #{@round.percent_correct_by_category(category)}% correct"
        end
end
start