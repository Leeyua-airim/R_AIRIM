from selenium.webdriver.common.keys import Keys
from selenium import webdriver

driver = webdriver.Chrome('./chromedriver')

try:
    driver.get('http://cafe.naver.com/joonggonara')
    elem = driver.find_element_by_id('topLayerQueryInput')
    elem.send_keys('자전거')
    elem.send_keys(Keys.RETURN)

    forms = driver.find_element_by_class_name('article-board')
    for form in forms:
        print(form)
except Exception as e:
    print(e)
