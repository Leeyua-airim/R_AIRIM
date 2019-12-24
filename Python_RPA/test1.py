import smtplib
from email.message import EmailMessage

import getpass
password = getpass.getpass('password: ')

message = EmailMessage()
message['Subject'] = 'WEPLAY 파이썬 업무자동화 - 이메일 텍스트'
message['From'] = 'brink0@naver.com'		# 송신자 이메일
message['To'] = 'brink9205@gmail.com','altnr23@naver.com'	# 수신자 이메일 다수 (구분자: 콤마)
message.set_content('''이메일내용
안녕하세요. WEPLAY입니다.

감사합니다.
''')

with smtplib.SMTP_SSL('smtp.naver.com', 465) as server:
    server.ehlo()
    server.login('brink0', '!leeyua1057')
    server.send_message(message)

print('이메일을 발송했습니다.')
