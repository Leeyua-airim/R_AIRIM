class email:
    sender = ""

    def send_mail(self,recv,subject,contents):
        print("From:\t" + self.sender)
        print("To: \t" + recv)
        print("Subject: \t" + subject)
        print("Contents \t")
        print(contents,"\n")
        print("-"*20)

'''
e = email()
e.sender = "brink0@naver.com"
recv_list = ['yua@naver.com','yua2@naver.com','yua3@naver.com']

for recv in recv_list:
    e.send_mail(recv,"Hi!","This is RPA")
'''
