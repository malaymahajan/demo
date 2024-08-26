*** Settings ***
Library   AppiumLibrary
Library      Screenshot
Library      DocTest.VisualTest
Resource    ../../Resources/HamburgerMenu/hamburger_menu_keywords.robot

Test Setup    Open KC Application
Test Teardown    Close Application

*** Variables ***
${screenshot_actual_dir}    ./Mobile/IOS/KC/TestData/ActualScreenshot
${testdatasheet}    ${CURDIR}${/}..${/}..${/}TestData${/}hamburger_menu_testdata.xlsx

*** Test Cases ***
89 Verify the redirection of Fan Loyalty Program menu if user is not logged in
    Click And Verify Skip Login Button
    Click On Skip Instructions Button If Visible
    Wait And Click On Element    xpath=${menu_button}
    Wait And Click On Element    xpath=${fan_loyalty_program_menu}
    Verify Element Is Visible    xpath=${faq_button}

90 Verify the UI of Fan Loyalty Program menu if user is not logged in
    Click And Verify Skip Login Button
    Click On Skip Instructions Button If Visible
    Wait And Click On Element    xpath=${menu_button}
    Wait And Click On Element    xpath=${fan_loyalty_program_menu}
    Verify Element Is Visible    xpath=${faq_button}
    Wait And Click On Element    xpath=${faq_first_closing_up_arrow}
    Wait for 5 seconds
    capture page screenshot    faq_page_screenshot.png
    ${image_path}=    Set Variable    ${screenshot_actual_dir}/faq_page_screenshot.png
    Wait for 5 seconds
    ${cropped_image}=    user_keywords.crop image header footer    ${image_path}    ${image_path}    80      30
    Compare Images     ./Mobile/IOS/KC/TestData/reference_screenshots/FAQ_screen.png    ${cropped_image}    resize_candidate=true

91 Verify the redirection of FAQs Button
    Click And Verify Skip Login Button
    Click On Skip Instructions Button If Visible
    Wait And Click On Element    xpath=${menu_button}
    Wait And Click On Element    xpath=${fan_loyalty_program_menu}
    Wait And Click On Element    xpath=${faq_button}
    Verify Element Is Visible    xpath=${faq_title}
    Verify Element Is Visible    xpath=${faq_question}

92 Verify the UI of FAQs screen
    Click And Verify Skip Login Button
    Click On Skip Instructions Button If Visible
    Wait And Click On Element    xpath=${menu_button}
    Wait And Click On Element    xpath=${fan_loyalty_program_menu}
    Wait And Click On Element    xpath=${faq_button}
    Wait for 5 seconds
    capture page screenshot    faq_page2_screenshot.png
    ${image_path}=    Set Variable    ${screenshot_actual_dir}/faq_page2_screenshot.png
    Wait for 5 seconds
    ${cropped_image}=    user_keywords.crop image header footer    ${image_path}    ${image_path}        80      30
    Compare Images     ./Mobile/IOS/KC/TestData/reference_screenshots/FAQ_screen2.png     ${image_path}     resize_candidate=true


93 Verify the redirection of Hall of fans menu if user is not logged in
    Click And Verify Skip Login Button
    Click On Skip Instructions Button If Visible
    Wait And Click On Element    xpath=${menu_button}
    Wait And Click On Element    xpath=${hall_of_fans}
    Verify Element Is Visible    xpath=${hall_of_fans}
    Verify Element Is Visible    xpath=${check_your_rankings_button}

94 Verify the UI of Hall of fans screen
    Click And Verify Skip Login Button
    Click On Skip Instructions Button If Visible
    Wait And Click On Element    xpath=${menu_button}
    Wait And Click On Element    xpath=${hall_of_fans}
    Wait for 5 seconds
    capture page screenshot    hall_of_fans_screenshot.png
    ${image_path}=    Set Variable    ${screenshot_actual_dir}/hall_of_fans_screenshot.png
    Wait for 5 seconds
    ${cropped_image}=    crop image header footer       ${image_path}        ${image_path}      80      30
    Compare Images     ./Mobile/IOS/KC/TestData/reference_screenshots/Hall_OF_FANS.png      ${cropped_image}    resize_candidate=true


101 Verify the Redirection of logged in user on click Redemption menu
    &{data}    fetch data by id    ${testdatasheet}    101
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_no}
    Click On Request Otp Button
    Enter Otp    ${data.otp}
    Accept Login Terms And Conditions And Click On Submit Button
    Click On Skip Instructions Button If Visible
    Wait And Click On Element    xpath=${menu_button}
    Wait And Click On Element    xpath=${redemption}
    Verify Element Is Visible    xpath=${redeem_your_knight_token_title}

109 Verify the Redirection of non -logged in user on click Redemption menu
    &{data}    fetch data by id    ${testdatasheet}    109
    Click And Verify Skip Login Button
    Click On Skip Instructions Button If Visible
    Wait And Click On Element    xpath=${menu_button}
    Wait And Click On Element    xpath=${redemption}
    ${title}        Evaluate    ', '.join(${data.popup_title})
    Verify Login Registration Popup    ${title}
    Wait And Click On Element    ${register_popup_ok_button}
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_no}
    Click On Request Otp Button
    Enter Otp    ${data.otp}
    Accept Login Terms And Conditions And Click On Submit Button
    Click On Skip Instructions Button If Visible
    Wait And Click On Element    xpath=${menu_button}
    Wait And Click On Element    xpath=${redemption}
    Verify Element Is Visible    xpath=${redeem_your_knight_token_title}
