class Animal(object):
    def __init__(self, name, age):
        self.name = name
        self.age = age
    def result(self):
        print("Name: ", self.name)
        print("Age: ", self.age)
class Dog(Animal):
    def bark(self):
        print(self.name, " bark: purr, purr!")
class Cat(Animal):
    def miaow(self):
        print(self.name, " miaow: meow, meow!")

dog = Dog("pug", 5)
cat = Cat("kitty", 3)
dog.result()
dog.bark()
cat.result()
cat.miaow()
