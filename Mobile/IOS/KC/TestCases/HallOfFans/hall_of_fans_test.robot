*** Settings ***
Library   AppiumLibrary
Resource    ../../Resources/HallOfFans/hall_of_fans_keywords.robot

Test Setup    Open KC Application
Test Teardown    Close Application

*** Variables ***
${testdatasheet}    ${CURDIR}${/}..${/}..${/}TestData${/}hall_of_fans_testdata.xlsx

*** Test Cases ***
95 Verify if Terms and Conditions checkbox is uncheck
    [Tags]    demo
    Click And Verify Skip Login Button
    Click On Skip Instructions Button If Visible
    Wait And Click On Element    xpath=${menu_button}
    Wait And Click On Element    xpath=${hall_of_fans}
    Verify Element Is Visible    xpath=${check_your_rankings_button}
    Verify Checkbox Is Unchecked    xpath=${hall_of_fans_checkbox}
    Verify Button Is Disabled    xpath=${check_your_rankings_button}

96 Verify if user check Terms and Conditions checkbox
    Click And Verify Skip Login Button
    Click On Skip Instructions Button If Visible
    Wait And Click On Element    xpath=${menu_button}
    Wait And Click On Element    xpath=${hall_of_fans}
    Wait And Click On Element    xpath=${hall_of_fans_checkbox}
    Verify Button Is Enabled     xpath=${check_your_rankings_button}

97 Verify if non-logged-in user check Terms &Conditions checkbox and click on below button
    &{data}    fetch data by id    ${testdatasheet}    97
    Click And Verify Skip Login Button
    Click On Skip Instructions Button If Visible
    Wait And Click On Element    xpath=${menu_button}
    Wait And Click On Element    xpath=${hall_of_fans}
    Wait And Click On Element    xpath=${hall_of_fans_checkbox}
    Wait And Click On Element    xpath=${check_your_rankings_button}
    ${title}     Evaluate    ', '.join(${data.popup_title})
    Verify Login Registration Popup    ${title}

99 Verify the if logged in user click on Check your Ranking button
    &{data}    fetch data by id    ${testdatasheet}    99
    Click And Verify Skip Login Button
    Click On Skip Instructions Button If Visible
    Wait And Click On Element    xpath=${menu_button}
    Wait And Click On Element    xpath=${hall_of_fans}
    Wait And Click On Element    xpath=${hall_of_fans_checkbox}
    Wait And Click On Element    xpath=${check_your_rankings_button}
    ${title}     Evaluate    ', '.join(${data.popup_title})
    Verify Login Registration Popup    ${title}
    Wait And Click On Element    xpath=${register_popup_ok_button}
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_no}
    Click On Request Otp Button
    Enter Otp    ${data.otp}
    Accept Login Terms And Conditions And Click On Submit Button
    Wait And Click On Element    xpath=${hall_of_fans_checkbox}
    Wait And Click On Element    xpath=${check_your_rankings_button}
    Verify Check leaderboard Popup

100 Verify the Redirection of logged in user on click on Check leaderboard button
    &{data}    fetch data by id    ${testdatasheet}    100
    Click And Verify Skip Login Button
    Click On Skip Instructions Button If Visible
    Wait And Click On Element    xpath=${menu_button}
    Wait And Click On Element    xpath=${hall_of_fans}
    Wait And Click On Element    xpath=${hall_of_fans_checkbox}
    Wait And Click On Element    xpath=${check_your_rankings_button}
    ${title}     Evaluate    ', '.join(${data.popup_title})
    Verify Login Registration Popup    ${title}
    Wait And Click On Element    xpath=${register_popup_ok_button}
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_no}
    Click On Request Otp Button
    Enter Otp    ${data.otp}
    Accept Login Terms And Conditions And Click On Submit Button
    Wait And Click On Element    xpath=${hall_of_fans_checkbox}
    Wait And Click On Element    xpath=${check_your_rankings_button}
    Verify Check leaderboard Popup
    Wait And Click On Element    xpath=${check_leaderboard_popup_ok_button}
    Verify Element Is Visible    xpath=${leaderboard_screen_title}
    Verify Element Is Visible    xpath=${top_fans_background}