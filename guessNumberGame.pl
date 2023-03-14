# Declaring a minimum and maximum number $min = 1;
$max = 100;
#Welcoming the user to game
print "========== Welcome to Guess The number Game ==========\n\n";

#Subroutine to play the game from start 
sub guessNumber{
	#generating a random number between 1 and 100
	$number = int(rand($max - $min + 1)) + $min;

	#letting the user choose the game level
	print "Choose Game level That you want to play \n Enter 1 for Ultimate (4 tries)\n Enter 2 for Hard (7 tries)\n Enter 3 for Medium (12 tries)\n Enter 4 for Easy (20 tries)\nYour Choice: ";
	do{
		$loopBreak = 0;
		$gameLevel = <STDIN>;
		if ($gameLevel == 1){
			$limitNum = 4;
		}
		elsif ($gameLevel == 2){
			$limitNum = 7;
		}
		elsif ($gameLevel == 3){
			$limitNum = 12;
		}
		elsif ($gameLevel == 4){
			$limitNum = 20;
		}
		# running the loop again if inpit isn't 1,2, 3, 4
		else{
			print("Please enter the right input 1, 2, 3 or 4: ");
			$loopBreak = 1;				}
	}while($loopBreak != 0);
	
		$foundIt = 0;	print "Guess a number between $min and $max: ";
	
	# run the loop for the number of tries user choosed 
	for($i = 1; $i <= $limitNum; $i = $i + 1){
		$guess = <STDIN>;
		
		# if condition in case user entered the right number 
		if($guess == $number){
			print "Awesome, You got it! The number was $number.\n";
			$foundIt = 1;
			$i = $limitNum;
						}
		# skipping the last two condidions for the last round of the loop
		elsif($i == $limitNum){
			next;		}
		#if the guess is low or high
		elsif ($guess < $number) {
			print "You guessed too low. \nGuess again: ";
		}
		else{
			print "You guessed too high. \nGuess again: ";
		}
	}
	# Printing a game over message user couldn't find the number in the given tries
	if($foundIt == 0){
		print("Game Over, You lost the game\n");	}
}

# Loop to run again and again if the user want to play the game again
do{
	guessNumber();
	print "\n=============*********=============\n";
	print("\nDo you want to play the game again Enter 1 for yes Enter anything else for no: ");	
	$playAgain = <STDIN>;}while($playAgain == 1);
print "\n============Thanks for playing============\n";
