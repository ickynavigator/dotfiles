function fish_greeting

	# Greeting messages
	set powered_msgs \
		"candy!" \
		"rubber bands" \
		"a black hole" \
		"logic" \
		"electromagnetic cheese" \
        "a sharpie" \
        "a bag of cotton balls" \
        "a football" \
        "a shawl" \
        "a giraffe" \
        "a chicken" \
        "a spring" \
        "a nail filer" \
        "a panda" \
        "a catalogue" \
        "an ice pick" \
        "a statuette" \
        "a purse" \
        "a magnifying glass" \
        "a brush" \
        "a pair of scissors" \
        "a cow" \
        "a bag of popcorn" \
        "a knife" \
        "a game cartridge" \
        "a chair" \
        "a pack of cards" \
        "a jar of peanut butter" \
        "a washing machine" \
        "an incense holder" \
        "a martini glass" \
        "a bed" \
        "a soccer ball" \
        "a straw" \
        "a feather duster"

	# Randomly pick a message
	set chosen_msg $powered_msgs[(math (random)"%"(count $powered_msgs)"+1")]

	# Output it to the console
    # figlet "Obi Fortune"
    # figlet "ickynavigator"
    # cow_fortune
    printf (set_color FF4500)"Welcome %s \nThis terminal session is powered by %s\nCurrent Location : %s\n" $USER $chosen_msg $PWD
    neofetch
end
