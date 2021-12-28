function say_all_voices
  set allVoices \
    "Alex" \
    "Alice" \
    "Alva" \
    "Amelie" \
    "Anna" \
    "Carmit" \
    "Damayanti" \
    "Daniel" \
    "Diego" \
    "Ellen" \
    "Fiona" \
    "Fred" \
    "Ioana" \
    "Joana" \
    "Jorge" \
    "Juan" \
    "Kanya" \
    "Karen" \
    "Kate" \
    "Kyoko" \
    "Laura" \
    "Lekha" \
    "Luca" \
    "Luciana" \
    "Maged" \
    "Mariska" \
    "Mei-Jia" \
    "Melina" \
    "Milena" \
    "Moira" \
    "Monica" \
    "Nora" \
    "Oliver" \
    "Paulina" \
    "Rishi" \
    "Samantha" \
    "Sara" \
    "Satu" \
    "Serena" \
    "Sin-ji" \
    "Tessa" \
    "Thomas" \
    "Ting-Ting" \
    "Veena" \
    "Victoria" \
    "Xander" \
    "Yelda" \
    "Yuna" \
    "Yuri" \
    "Zosia" \
    "Zuzana"

    for voice in allVoices;
      say "Hello, my name is $voice. I am an downloaded voice" -v $voice --interactive=/green
    end
end
