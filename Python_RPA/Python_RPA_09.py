from selenium import webdriver
driver = webdriver.Chrome('./chromedriver')

driver.get('http://news.naver.com')

elem = driver.find_element_by_id('right.ranking_contents')
childs = elem.find_elements_by_tag_name('li')

for child in childs:
    print(child.text)

driver.quit()
