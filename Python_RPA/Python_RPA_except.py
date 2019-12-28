import sys
import io
sys.stdout = io.TextIOWrapper(sys.stdout.detach(), encoding = 'utf-8')
sys.stderr = io.TextIOWrapper(sys.stderr.detach(), encoding = 'utf-8')

'''from selenium import webdriver

driver = webdriver.Chrome('./chromedriver')

try:
    driver.get('http://news.naver.com')
    elem = driver.find_element_by_id('right.ranking_contents')
    childs = elem.find_elements_by_tag_name('li')

    for child in child: #에러 부분
        print(child.text)
except Exception as e:
    print(e)
finally:
    driver.quit()
'''

try:
    int('abc')
    print("try가 모두 실행되었습니다.")

except Exception as e:
    print("에러가 발생하였습니다.")
    print(e)
finally:
    print("Finally가 실행되었습니다.")
