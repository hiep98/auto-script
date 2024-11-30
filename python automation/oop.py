class person:
    def __init__(self, first, middle, last, age):
        self.first = first
        self.middle = middle
        self.last = last
        self.age = age
    def __str__(self):
        return self.first + ' ' + self.middle + ' ' + self.last + ' ' + str(self.age)
    def initials(self):
        return self.first[0]  + self.middle[0] + self.last[0]
    
    def changeage(self, amount):
        self.age += amount

aperson = person('dai', 'chi', 'zan', 22)
print(aperson)
aperson.changeage(2)
print(aperson)
print(aperson.initials())
