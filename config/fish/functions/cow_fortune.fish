function cow_fortune
    # Cow Files
    set cowsayOptions \
        "beavis.zen" \
        blowfish \
        bong \
        bud-frogs \
        bunny \
        cheese \
        cower \
        daemon \
        default \
        dragon \
        dragon-and-cow \
        elephant \
        elephant-in-snake \
        eyes \
        flaming-sheep \
        ghostbusters \
        head-in \
        hellokitty \
        # kiss \
        kitty \
        koala \
        kosh \
        luke-koala \
        meow \
        milk \
        moofasa \
        moose \
        mutilated \
        ren \
        satanic \
        sheep \
        skeleton \
        small \
        stegosaurus \
        stimpy \
        supermilker \
        surgery \
        three-eyes \
        turkey \
        turtle \
        tux \
        udder \
        vader \
        vader-koala \
        www

    # Randomly pick a file
    set chosen_file $cowsayOptions[(math (random)"%"(count $cowsayOptions)"+1")]

    # Get fortune
    set cow_fortune_fortune (fortune)

    # Output it to the console
    cowsay -f $chosen_file $cow_fortune_fortune
end
