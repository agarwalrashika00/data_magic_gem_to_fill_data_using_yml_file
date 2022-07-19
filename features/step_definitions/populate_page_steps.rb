require_relative '../pages/fill_form.rb'

Given(/^I am on the site$/) do
    @google_search = FillForm.new(@browser)
    @google_search.visit
end

When("I populate the page with data for {string}") do |user|
    @google_search.populate_page(user)
    sleep 2
end

Then("submit the form and take screenshot of the output for {string}") do |user|
    @browser.execute_script("window.scrollTo(0, document.body.scrollHeight)")
    sleep 2
    @google_search.submit_form
    sleep 2
    @google_search.save_screenshot(user)
end