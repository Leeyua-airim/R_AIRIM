import time
from selenium import webdriver
from selenium.webdriver.common.alert import Alert

driver = webdriver.Chrome('./chromedriver')

try:
    driver.get('https://www.w3resource.com/javascript/alert-example1.html')

    time.sleep(1)

    alert = Alert(driver)
    alert.accept()

    input()

except Exception as e:
    raise
