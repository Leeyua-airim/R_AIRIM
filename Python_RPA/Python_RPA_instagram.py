from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.chrome.options import Options

import time

driver = webdriver.Chrome('./chromedriver')
options = Options()


try:
    driver.get('https://www.instagram.com/')

    time.sleep(2)
    btn = driver.find_element_by_link_text('로그인')
    btn.click()

    time.sleep(1)
    elem = driver.find_element_by_name('username')
    elem.send_keys('01099251077')

    elem = driver.find_element_by_name('password')
    elem.send_keys('rhks1057')
    elem.send_keys(Keys.RETURN)

    time.sleep(2)

    btn = driver.find_element_by_class_name('aOOlW')
    if btn:
        btn.click()

    time.sleep(2)

    alert = Alert(dirver)
    alert.accept

    elem = driver.find_element_by_class_name('LWmhU')
    action = ActionChains(driver)
    action.move_to_element(elem)
    action.click()
    action.send_keys('#파이썬')
    action.perform

except Exception as e:
    print(e)
finally:
    print('완료')
