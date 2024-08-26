*** Settings ***
Library      SeleniumLibrary
Resource    ../../Resources/Login/login_keywords.robot
Resource    ../../Resources/Hindi_homescreen/hindi_homescreen_keywords.robot
Resource    ../../../../CommonBase/Web/Resources/Web_Common_Keywords.robot
Resource    ../../Resources/Royals School of Business/Royals_School_of_Business_keywords.robot
Variables   ../../PageObjects/Menu/Menu_locators.py

Test Setup  Launch Application
Test Teardown  Close Browser

*** Variables ***
${url_filepath}    ${CURDIR}${/}..${/}..${/}TestData${/}URL_RR.xlsx

*** Test Cases ***
TC165 Verify the redirection of royal School Business
    ${data}    fetch user data by id  ${url_filepath}   royals_school_of_buisness
    ${user_data}    create dictionary    &{data}
    Verify Navigation Of Royals School Of Buisness
    Verify Navigation link    ${user_data['url']}
