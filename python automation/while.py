secret = "python"
language = ""
while language != secret:
    language = input("Which programming language does the book use? ")

if language != secret:
    print("Wrong!")
else:
    print("You guessed it right!")
