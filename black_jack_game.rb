@dealer_wins = 0
@user_wins = 0

def black_jack
	cards = [2,3,4,5,6,7,8,9,10,10,10,10,11]
	deck = []
	4.times {cards.each { |card| deck << card }}
	user_hand = []
	dealer_hand = []
	dealer_hand << deck.shuffle.sample
	2.times { user_hand << deck.shuffle.sample}
	puts "Dealer showing: #{dealer_hand.first}"
	puts "Your cards: #{user_hand.first} + #{user_hand.last}"
	
	if user_hand.reduce(:+) == 21
		puts "BLACKJACK!!!!!"
		@user_wins += 1
		loop_it
	end
	
	@response = gets.chomp
	
	until @response != 'hit'
		user_hand << deck.shuffle.sample
		puts "New card: #{user_hand.last}"
		if user_hand.reduce(:+) > 21
			puts "YOU BUST!"
			@dealer_wins += 1
			loop_it
		end
		if user_hand.reduce(:+) == 21
			puts "YOU WIN!"
			@user_wins += 1
			loop_it
		end 
		@response = gets.chomp
	end
	
	dealer_hand << deck.shuffle.sample
	puts "Dealer hand: #{dealer_hand.reduce(:+)}"
	sleep(1)
	
	until dealer_hand.reduce(:+) > user_hand.reduce(:+) || dealer_hand.reduce(:+) > 21
		sleep(1)
		dealer_hand << deck.shuffle.sample
		if dealer_hand.reduce(:+) > 21
			puts "Dealer hand: #{dealer_hand.reduce(:+)}"
			puts "Dealer BUSTS"
		else
			puts "Dealer hand: #{dealer_hand.reduce(:+)}"
		end
		sleep(1)
	end
	
	sleep(1)

	if dealer_hand.reduce(:+) > user_hand.reduce(:+) && dealer_hand.reduce(:+) <= 21
		puts "Dealer Wins"
		@dealer_wins += 1
	else
		puts "YOU WIN!!!"
		@user_wins += 1
	end
end

def loop_it
	until @response == "quit"
		sleep(1)
		puts
		puts "Dealer wins: #{@dealer_wins}"
		puts "Your wins: #{@user_wins}"
		puts 
		black_jack
	end
end

loop_it