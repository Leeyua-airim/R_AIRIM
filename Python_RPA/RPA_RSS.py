import feedparser
from urllib.parse import quote
from RPA_email_set import send_mail
from openpyxl import Workbook
import ssl

base_rss_url = " https://news.google.com/news/rss/?ned=kr&gl=KR&hl=ko"
base_rss_url = 'https://news.google.com/news/rss/headlines/section/topic'
business_rss = base_rss_url+quote('/BUSINESS.ko_kr/경제?ned=kr&hl=ko')
tech_rss = base_rss_url+quote('/SCITECH.ko_kr/과학기술?ned=kr&hl=ko')
health_rss = base_rss_url+quote('/HEALTH.ko_kr/건강?ned=kr&hl=ko')

xlsx=Workbook()
business_sheet = xlsx.create_sheet('경제')
business_sheet.append(['기사제목','링크','날짜'])
xlsx.save('test22.xlsx')
