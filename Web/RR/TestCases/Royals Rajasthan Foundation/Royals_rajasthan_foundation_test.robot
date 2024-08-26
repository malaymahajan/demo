*** Settings ***
Library      SeleniumLibrary
Library    OperatingSystem
Resource    ../../Resources/Login/login_keywords.robot
Resource    ../../../../CommonBase/Web/Resources/Web_Common_Keywords.robot
Library    ../../../../CommonBase/Utilities/user_keywords.py
Variables   ../../PageObjects/Menu/Menu_locators.py
Resource  ../../Resources/Profile/profile_keywords.robot
Resource  ../../../../CommonBase/Cms/Resources/otp_keywords.robot
Variables   ../../PageObjects/Royals Rajasthan Foundation/Royals_rajasthan_foundation_locators.py
Resource    ../../Resources/Royals Rajasthan Foundation/Royals_rajasthan_foundation_keywords.robot
#Library    ../../../../CommonBase/Utilities/user_keywords.py    pdf_utils.extract_pdf_details

Test Setup  Launch Application
Test Teardown   Close Browser

*** Variables ***
${url_filepath}    ${CURDIR}${/}..${/}..${/}TestData${/}URL_RR.xlsx
${royal_foundation_testdata}    ${CURDIR}${/}..${/}..${/}TestData${/}RoyalFoundation.xlsx
${recipt_date}      Receipt Date

*** Test Cases ***
TC166 Verify the redirection of Royals Rajasthan Foundation
    ${data}    fetch user data by id  ${url_filepath}   Royals_rajasthan_foundation
    ${user_data}    create dictionary    &{data}
    Navigation Keyword    ${royal_rajasthan_foundation}    ${royal_rajasthan_foundation_page}
    Verify Navigation link    ${user_data['url']}

TC167 Verify the redirection of donation menu
    ${data}    fetch user data by id  ${url_filepath}   donation
    ${user_data}    create dictionary    &{data}
    Navigation Keyword    ${royal_rajasthan_foundation}    ${royal_rajasthan_foundation_page}
    Navigation Keyword    ${donation_nav}    ${donation_page}
    Verify Navigation link    ${user_data['url']}

TC168 Verify Autofilled data on donation form
    &{data}    fetch data by id    ${royal_foundation_testdata}    1
    Check Visibility And Click On Element    ${login_button}
    Enter Mobile Number     ${data.mobile_number}
    Check Visibility And Click On Element    ${whatsapp_no_button}
    Check Visibility And Click On Element    ${send_sms_button}
    ${otp}  Login Into CMS And Get OTP    ${data.mobile_number}
    Enter OTP  ${otp}
    Sleep    2s
    Navigation Keyword    ${royal_rajasthan_foundation}    ${royal_rajasthan_foundation_page}
    Navigation Keyword    ${donation_nav}    ${donation_page}
    Sleep    10s
    Verify Fields Are Autofilled

TC169 Verify Mandatory fields on donation form
    &{data}    fetch data by id    ${royal_foundation_testdata}    2
    Check Visibility And Click On Element    ${login_button}
    Enter Mobile Number     ${data.mobile_number}
    Check Visibility And Click On Element    ${whatsapp_no_button}
    Check Visibility And Click On Element    ${send_sms_button}
    ${otp}  Login Into CMS And Get OTP    ${data.mobile_number}
    Enter OTP  ${otp}
    Fill All Fields In Profile Fields For Registration    ${data.email}
    Click And Verify Submit Button
    Sleep    2s
    Navigation Keyword    ${royal_rajasthan_foundation}    ${royal_rajasthan_foundation_page}
    Navigation Keyword    ${donation_nav}    ${donation_page}
    Sleep    2s
    Check Visibility And Click On Element    ${donate_now_button}
    Verify Mandatory Fields For Donation Form

TC170 Verify Donate form Submission
    &{data}    fetch data by id    ${royal_foundation_testdata}    3
    Login To CMS And Delete User From CMS   ${data.mobile_number}
    Check Visibility And Click On Element    ${login_button}
    Enter Mobile Number     ${data.mobile_number}
    Check Visibility And Click On Element    ${whatsapp_no_button}
    Check Visibility And Click On Element    ${send_sms_button}
    ${otp}  Login Into CMS And Get OTP    ${data.mobile_number}
    Enter OTP  ${otp}
    Fill All Fields In Profile Fields For Registration    ${data.email}
    Click And Verify Submit Button
    Sleep    2s
    Navigation Keyword    ${royal_rajasthan_foundation}    ${royal_rajasthan_foundation_page}
    Navigation Keyword    ${donation_nav}    ${donation_page}
    Sleep    2s
    Enter Mandatory Field In Donation Form
    Verify Redirection to Donation Payment Page

TC171 Verify Manual amount entered in Any other amount field on payment gateway screen
    &{data}    fetch data by id    ${royal_foundation_testdata}    4
    Login To CMS And Delete User From CMS   ${data.mobile_number}
    Check Visibility And Click On Element    ${login_button}
    Enter Mobile Number     ${data.mobile_number}
    Check Visibility And Click On Element    ${whatsapp_no_button}
    Check Visibility And Click On Element    ${send_sms_button}
    ${otp}  Login Into CMS And Get OTP    ${data.mobile_number}
    Enter OTP  ${otp}
    Fill All Fields In Profile Fields For Registration    ${data.email}
    Click And Verify Submit Button
    Sleep    2s
    Navigation Keyword    ${royal_rajasthan_foundation}    ${royal_rajasthan_foundation_page}
    Navigation Keyword    ${donation_nav}    ${donation_page}
    Sleep    2s
    Enter Mandatory Field In Donation Form
    Enter Manual Amount
    Verify Redirection to Donation Payment Page
    Check Total Amount On Payment Screen

TC172 Verify Data on Payment gateway screen
    &{data}    fetch data by id    ${royal_foundation_testdata}    5
    Check Visibility And Click On Element    ${login_button}
    Enter Mobile Number     ${data.mobile_number}
    Check Visibility And Click On Element    ${whatsapp_no_button}
    Check Visibility And Click On Element    ${send_sms_button}
    ${otp}  Login Into CMS And Get OTP    ${data.mobile_number}
    Enter OTP  ${otp}
    Sleep    2s
    Navigation Keyword    ${royal_rajasthan_foundation}    ${royal_rajasthan_foundation_page}
    Navigation Keyword    ${donation_nav}    ${donation_page}
    Sleep    2s
    Enter Mandatory Field In Donation Form
    Enter Manual Amount
    Verify Redirection to Donation Payment Page
    Check Total Amount On Payment Screen
    Verify Order Amount Is Equal To Enter Amount On Donation Form

TC173 Verify sucessfully payment process
    &{data}    fetch data by id    ${royal_foundation_testdata}    6
    Check Visibility And Click On Element    ${login_button}
    Enter Mobile Number     ${data.mobile_number}
    Check Visibility And Click On Element    ${whatsapp_no_button}
    Check Visibility And Click On Element    ${send_sms_button}
    ${otp}  Login Into CMS And Get OTP    ${data.mobile_number}
    Enter OTP  ${otp}
        Fill All Fields In Profile Fields For Registration    ${data.email}
    Click And Verify Submit Button
    Sleep    2s
    Navigation Keyword    ${royal_rajasthan_foundation}    ${royal_rajasthan_foundation_page}
    Navigation Keyword    ${donation_nav}    ${donation_page}
    Sleep    2s
    Enter Mandatory Field In Donation Form
    Enter Manual Amount
    Verify Redirection to Donation Payment Page
    Make Donation payment
    Verify Sucessful Payment For Donation
    ${url_data}     Fetch Data By Id    ${url_filepath}    successful_donation
    Verify Navigation Link     ${url_data['url']}

TC175 Verify Receipt date in downloaded PDF
    &{data}    fetch data by id    ${royal_foundation_testdata}    9
    Check Visibility And Click On Element    ${login_button}
    Enter Mobile Number     ${data.mobile_number}
    Check Visibility And Click On Element    ${whatsapp_no_button}
    Check Visibility And Click On Element    ${send_sms_button}
    ${otp}  Login Into CMS And Get OTP    ${data.mobile_number}
    Enter OTP  ${otp}
    Sleep    2s
    Navigation Keyword    ${royal_rajasthan_foundation}    ${royal_rajasthan_foundation_page}
    Navigation Keyword    ${donation_nav}    ${donation_page}
    Sleep    2s
    Enter Mandatory Field In Donation Form
    Enter Manual Amount
    Verify Redirection to Donation Payment Page
    Make Donation payment
    Verify Sucessful Payment For Donation
    Sleep    10s
    Check Visibility And Click On Element    ${download_recipt}
    Verify pdf Is Downloaded    ${recipt_date}