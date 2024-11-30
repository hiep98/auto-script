database ={
    'home': 'ngoi nha',
    'baby': 'tre em',

}

def show_menu():
    print("----------------")
    print("---DICTIONARY---")
    print("----------------")
    print("1. add vocabulary")
    print("2. find vocabulary")
    print("3. remove vocabulary")
    print("4. watch vocabulary")
    print("press 0 to exit")
    print("----------------")

def add():
    word = input("new word: ")
    mean = input("it mean: ")
    database[word] = mean
    print("+ new word add successful")
    
def find():
    word = input("type  word: ")
    if word in database:
        print("+ finded: [%s: %s]" % (word, database[word]))
    else:
        print("not found: [ %s ]" % word)
    
def delete():
    word = input("type  word: ")
    if word in database:
        del database[world]
        print("word [ %s ] is delete" % word )
    else:
        print("not found: [ %s ]" % word)
    
def view_all():
    for world, mean in database.items():
        print("[ %s: %s ]" % (world,mean) )

# show menu
show_menu()

# main program
choice = int(input("PLEASE CHOOSE: "))

while choice != 0:
    if choice == 0:
        break
    elif choice == 1:
        add()
    # todo: add vocabulary
    elif choice == 2:
        find()
    # todo: find vocabulary
    elif choice == 3:
        delete()
    # todo: remove vocabulary
    elif choice == 4:
        view_all()
    # todo: watch vocabulary
    else:
        print(" this choose not match.")
    choice = int(input("PLEASE CHOOSE: "))
print("thank you")
