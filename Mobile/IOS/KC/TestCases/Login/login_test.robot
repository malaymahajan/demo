*** Settings ***
Library   AppiumLibrary
Library      Screenshot
Library      DocTest.VisualTest
Resource    ../../Resources/Login/login_keywords.robot

Test Setup    Open KC Application
Test Teardown    Close Application

*** Variables ***
${testdatasheet}    ${CURDIR}${/}..${/}..${/}TestData${/}login_testdata.xlsx
${screenshot_actual_dir}    ./Mobile/IOS/KC/TestData/ActualScreenshot

*** Test Cases ***
8 Verify user can skip login before and after otp is requested
    [Tags]    sprint-6      test:retry(2)
    &{data}    fetch data by id    ${testdatasheet}      8
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_no}
    Click On Request Otp Button
    Enter Otp    ${data.otp}
    Click And Verify Skip Login Button

9 Verify the UI of the layout of OTP screen
    [Tags]    sprint-6
    &{data}    fetch data by id    ${testdatasheet}      9
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_no}
    Click On Request Otp Button
    Wait for 5 seconds
    capture page screenshot    otp_page_screenshot.png
    ${image_path}=    Set Variable    ${screenshot_actual_dir}/otp_page_screenshot.png
    Wait for 5 seconds
    ${cropped_image}=    user_keywords.crop image header footer    ${image_path}    ${image_path}    80      30
    Compare Images     ./Mobile/IOS/KC/TestData/reference_screenshots/otp_page_screenshot.png    ${cropped_image}    resize_candidate=true

10 Verify the text/data of OTP Screen
    [Tags]    sprint-6
    &{data}    fetch data by id    ${testdatasheet}      10
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_no}
    Click On Request Otp Button
    Wait for 5 seconds
    capture page screenshot    otp_page_screenshot.png
    ${image_path}=    Set Variable    ${screenshot_actual_dir}/otp_page_screenshot.png
    Wait for 5 seconds
    ${cropped_image}=    user_keywords.crop image header footer    ${image_path}    ${image_path}    80      30
    Compare Images     ./Mobile/IOS/KC/TestData/reference_screenshots/otp_page_screenshot.png    ${cropped_image}    resize_candidate=true

11 Verify in-app webview redirection of Privacy Policy
    [Tags]    sprint-6      test:retry(2)
    &{data}    fetch data by id    ${testdatasheet}      11
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_no}
    Click On Request Otp Button
    Wait And Click On Element    ${privacy_policy_link}
    Verify Element Is Visible    ${privacy_policy_nav_bar}
    Verify Element Is Visible    ${webview_main}

12 Verify in-app webview redirection of Terms & Condition
    [Tags]    sprint-6      test:retry(2)
    &{data}    fetch data by id    ${testdatasheet}      12
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_no}
    Click On Request Otp Button
    Wait And Click On Element    ${terms_and_conditions_link}
    Verify Element Is Visible    ${terms_and_conditions_nav_bar}
    Verify Element Is Visible    ${webview_article}

16 Verify mandatory field choose your primary team before proceedings to next screen.
    [Tags]    sprint-6      test:retry(2)
    &{data}    fetch data by id    ${testdatasheet}      16
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_no}
    Click On Request Otp Button
    Enter Otp From Suggestions
    Verify Element Is Visible    xpath=${circle_check_icon}