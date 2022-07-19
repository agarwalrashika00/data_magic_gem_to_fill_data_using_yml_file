require 'selenium-webdriver'
require 'page-object'
require 'data_magic'

Before do |scenario|
    @browser = Selenium::WebDriver.for :chrome
    @browser.manage.window.resize_to(700,800)
end

After do |scenario|
    @browser.quit
end

World(DataMagic)
World(PageObject)
