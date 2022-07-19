class FillForm
    include PageObject
    include DataMagic

    DataMagic.yml_directory = 'C:\Users\Rashika\Desktop\fixture- Data magic\features\data\yml'
    DataMagic.load 'fixtures.yml'

    page_url 'https://demoqa.com/automation-practice-form'
    text_field(:firstname, :id => 'firstName')
    text_field(:lastname, :id => 'lastName')
    text_field(:email, :id => 'userEmail')
    text_field(:mobile, :id => 'userNumber')
    Label_Elements = {:class => 'custom-control-label'}
    text_field(:subjects, :id => 'subjectsInput')
    text_field(:dob, :id => 'dateOfBirthInput')
    text_area(:address, :id => 'currentAddress')
    text_field(:state, :id => 'react-select-3-input')
    text_field(:city, :id => 'react-select-4-input')
    button(:submit, :id => 'submit')

    def visit
        goto
    end

    def populate_page(user)
        user_data = data_for "fixtures/#{user}"
        populate_page_with user_data

        user_data['subjects'].split(', ').each do |subject|
            self.subjects = subject
            subjects_element.send_keys :enter
        end

        @browser.find_elements(Label_Elements).each do |ele|
            if(ele.text == user_data['gender'])
                ele.click
            end

            if(user_data['hobbies'].split(', ').include? ele.text)
                ele.click
            end
        end

        self.state = user_data['state']
        state_element.send_keys :enter

        self.city = user_data['city']
        city_element.send_keys :enter
    end

    def submit_form
        submit
    end

    def save_screenshot(name)
        @browser.save_screenshot "C:/Users/Rashika/Desktop/fixture- Data magic/#{name}.png"
    end
end
