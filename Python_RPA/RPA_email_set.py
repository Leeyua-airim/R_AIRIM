from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from smtplib import SMTP_SSL


SMTP_SERVER = 'smtp.naver.com'
SMTP_PORT = 465
SMTP_USER = 'brink0'
SMTP_PASSWORD = '*'

def send_mail(name,addr,contents,attachment=False):
    msg = MIMEMultipart("alternative")    #클래스 함수 설정 및 alternative인자값

    if attachment:
        msg = MIMEMultipart("mixed")

    msg['From'] = SMTP_USER
    msg['To'] = addr
    msg['Subject'] = name+'님, 메일이 도착하였습니다.'

    text = MIMEText(contents)
    msg.attach(text)

    if attachment:
        from email.mime.base import MIMEBase
        from email import encoders

        file_data = MIMEBase('application','octet-stream')
        f = open(attachment,'rb')
        file_contents = f.read()
        file_data.set_payload(file_contents) #실제 전송할 데이터
        encoders.encode_base64(file_data) #인코딩

        from os.path import basename
        filename = basename(attachment)
        file_data.add_header('Content-Disposition','attachment',filename=filename)
        msg.attach(file_data)

    smtp = SMTP_SSL(SMTP_SERVER, SMTP_PORT)
    smtp.login(SMTP_USER, SMTP_PASSWORD)
    smtp.sendmail('brink0@naver.com',addr,msg.as_string())
    smtp.close()
