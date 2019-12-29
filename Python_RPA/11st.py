from selenium import webdriver
from selenium.webdriver.common.keys import Keys

driver = webdriver.Chrome('./chromedriver')

try:
    driver.get('http://11st.co.kr')
    elem = driver.find_element_by_id('AKCKwd')
    elem.send_keys('자전거')
    elem.send_keys(Keys.RETURN)

    from openpyxl import Workbook
    result_xlsx = Workbook()
    worksheet = result_xlsx.active
    worksheet.append(['판매자 이름','상품명','가격'])

    elems = driver.find_elements_by_xpath("//li[contains(@id, 'thisClick_')]")
    for elem in elems:
        title_tag= elem.find_element_by_class_name('info_tit')
        #print(title_tag.text)
        mail_tag = elem.find_element_by_class_name('benefit_tit')
        price_tag = elem.find_element_by_class_name('sale_price')
        print(mail_tag.text,title_tag.text,price_tag.text)
        worksheet.append([mail_tag.text,title_tag.text,price_tag.text])

        file_name = 'E:\\hello-git-sourcetree\\R_GO\\Python_RPA\\11st_result.xlsx'
        result_xlsx.save(file_name)

    from RPA_email_set import send_mail
    send_mail('null','**@naver.com','11st_자전거',file_name)

except Exception as e:
    print(e)
finally:
    print('완료')
    driver.quit()
