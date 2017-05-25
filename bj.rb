cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"]

def score(whos_hand)
	if whos_hand == user_hand
		user_score = 0
		user_hand.each do |x| 
		if x == "J" || x =="Q" || x == "K" || x == "A"
			user_score += 10
		else
			user_score += x
		end
	end
	else
		diller_score = 0
		diller_score.each do |x| 
		if x == "J" || x =="Q" || x == "K" || x == "A"
			diller_score += 10
		else
			diller_score += x
		end
	end
	end
end

def playornot()
	loop do
		if user_answer = "yes" || user_answer = "y"
		 	break
		elsif user_answer = "no" || user_answer = "n"
		 	puts "Bye. See you tommorow;)"
		 	exit
		else
		 	puts "You should answer simply \"yes\" or \"no\".\n>>"
			user_answer = gets.chomp
		end
	end
end



puts "Are you ready to play?"
user_answer = gets.chomp

loop do
if user_answer == "yes" || user_answer == "y"

	user_hand = []
	user_score = 0
	diller_hand = []
	diller_score = 0

	2.times {user_hand.push(cards.sample)}
	2.times {diller_hand.push(cards.sample)}

	user_hand.each do |x| 
		if x == "J" || x =="Q" || x == "K" || x == "A"
			user_score += 10
		else
			user_score += x
		end
	end

	diller_hand.each do |x| 
		if x == "J" || x =="Q" || x == "K" || x == "A"
			diller_score += 10
		else
			diller_score += x
		end
	end

	puts "Your hand: #{user_hand}    Dillers hand: #{diller_hand}\nYour score: #{user_score}    Dillers score: #{diller_score}\nOne more card?"
	user_answer = gets.chomp

	loop do
		if user_answer == "yes" || user_answer == "y"
		 	user_hand.push(cards.sample)

		 	user_score = 0
		 	user_hand.each do |x| 
				if x == "J" || x =="Q" || x == "K" || x == "A"
					user_score+=10
				else
					user_score += x
				end
			end

			if user_score >= 21
				puts "\nYour hand: #{user_hand}    Dillers hand: #{diller_hand}\nYour score: #{user_score}    Dillers score: #{diller_score}"
				break
			else
				puts "\nYour hand: #{user_hand}    Dillers hand: #{diller_hand}\nYour score: #{user_score}    Dillers score: #{diller_score}\nOne more card?"
				user_answer = gets.chomp
			end

		elsif user_answer == "n" || user_answer == "no"
			puts "\nYour hand: #{user_hand}    Dillers hand: #{diller_hand}\nYour score: #{user_score}    Dillers score: #{diller_score}"
			break
		else
			puts "You should answer simply \"yes\" or \"no\".\n>>"
			user_answer = gets.chomp
		end
	end

	loop do
		if diller_score < 18
			puts "\nCard for diller"
			diller_hand.push(cards.sample)
					
			diller_score = 0
			diller_hand.each do |x| 
				if x == "J" || x =="Q" || x == "K" || x == "A"
					diller_score += 10
				else
					diller_score += x
				end
			end
		else
			break
		end
	end	

	if user_score == 21 && diller_score == 21

		puts "\nYour hand: #{user_hand}    Dillers hand: #{diller_hand}\nYour score: #{user_score}    Dillers score: #{diller_score}\nBlackJack! Split!\n Play again?"
		user_answer = gets.chomp

		playornot()

	elsif user_score == 21 && diller_score != 21

		puts "\nYour hand: #{user_hand}    Dillers hand: #{diller_hand}\nYour score: #{user_score}    Dillers score: #{diller_score}\nBlackJack! You win!\n Play again?"
		user_answer = gets.chomp

		playornot()

	elsif diller_score == 21 && user_score != 21

		puts "\nYour hand: #{user_hand}    Dillers hand: #{diller_hand}\nYour score: #{user_score}    Dillers score: #{diller_score}\nBlackJack! You loose!\n Play again?"
		user_answer = gets.chomp

		playornot()

	elsif user_score == diller_score && user_score < 21

		puts "\nYour hand: #{user_hand}    Dillers hand: #{diller_hand}\nYour score: #{user_score}    Dillers score: #{diller_score}\nSplit!\n Play again?"
		user_answer = gets.chomp

		playornot()

	elsif user_score > diller_score && user_score < 21 || user_score < 21 && diller_score > 21
		
		puts "\nYour hand: #{user_hand}    Dillers hand: #{diller_hand}\nYour score: #{user_score}    Dillers score: #{diller_score}\nYou win!\n Play again?"
		user_answer = gets.chomp

		playornot()

	elsif user_score < diller_score && diller_score < 21 || diller_score < 21 && user_score >21

		puts "\nYour hand: #{user_hand}    Dillers hand: #{diller_hand}\nYour score: #{user_score}    Dillers score: #{diller_score}\nYou loose!\n Play again?"
		user_answer = gets.chomp

		playornot()

	else
		puts "\nYou loose!"
		user_answer = gets.chomp

		playornot()

	end


elsif user_answer == "no" || user_answer == "n"
	puts "Bye. See you tommorow;)"
	break
else
	puts "You should answer simply \"yes\" or \"no\".\n>>"
	user_answer = gets.chomp
end
end