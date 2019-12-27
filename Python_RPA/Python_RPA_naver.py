from selenium import webdriver
from selenium.webdriver.common.keys import Keys

driver = webdriver.Chrome('./chromedriver')

from openpyxl import Workbook
xlsx = Workbook()
sheet = xlsx.active
sheet.append(['Title','Link','Published data'])


try:
    driver.get('https://naver.com')
    keyword = input('검색어를 입력하세요:' )
    to_id = input('메일주소를 입력하세요: ')

    elem = driver.find_element_by_id('query')
    elem.send_keys(keyword)
    elem.send_keys(Keys.RETURN)

    div = driver.find_element_by_class_name('_blogBase')
    #elem = div.find_element_by_tag_name('ul')
    blogs = div.find_elements_by_xpath('./ul/li')

    for blog in blogs:
        title_tag = blog.find_element_by_class_name('sh_blog_title')

        """
        title = title_tag.get_attribute('title')
        if not title:
            title = title_tag.text
        """
        link = title_tag.get_attribute('href')

        pub_date_tag=blog.find_element_by_class_name('txt_inline')
        sheet.append([title_tag.text,link,pub_date_tag.text])

except Exception as e:
    print(e)
finally:
    driver.quit()

file_name = 'naver_blog.xlsx'
xlsx.save(file_name)
from RPA_email_set import send_mail
send_mail('이재화',to_id,'네이버 '+ keyword +' 검색결과 입니다.',file_name)
print("모든 프로세스가 완료되었습니다.")
