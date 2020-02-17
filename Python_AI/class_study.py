class User:
    def __init__(self, name, password):
        self.name = name
        self.password = password
    def login(self, password):
        if self.password == password:
            return True

        else:
            return False
    def logout(self):
        print("logout")
a = User("admin",'password')
if a.login("password"):
    a.logout()
