*** Settings ***
Library   AppiumLibrary
Resource    ../../Resources/FLRP/flrp_keywords.robot
Resource    ../../Resources/RedeemYourKnightToken/redeem_your_knight_token_keywords.robot

Test Setup    Open KC Application
Test Teardown    Close Application

*** Variables ***
${testdatasheet}    ${CURDIR}${/}..${/}..${/}TestData${/}redeem_your_knight_token_testdata.xlsx

*** Test Cases ***
102 Verify if user click on any enabled redeem button
    &{data}    fetch data by id    ${testdatasheet}      102
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_no}
    Click On Request Otp Button
    Enter Otp    ${data.otp}
    Accept Login Terms And Conditions And Click On Submit Button
    Click On Skip Instructions Button If Visible
    Wait And Click On Element    xpath=${menu_button}
    Wait And Click On Element    xpath=${redemption}
    Verify Element Is Visible    xpath=${redeem_your_knight_token_title}
    Wait And Click On Element    ${first_redeem_button}
    Verify Element Is Visible    ${terms_condition_warning}

103 Verify if user click on any enabled redeem button and T&C check box is checked but Tokens are not sufficient for redemtion
    &{data}    fetch data by id    ${testdatasheet}    103
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_no}
    Click On Request Otp Button
    Enter Otp    ${data.otp}
    Accept Login Terms And Conditions And Click On Submit Button
    Click On Skip Instructions Button If Visible
    Wait And Click On Element    xpath=${menu_button}
    Wait And Click On Element    xpath=${redemption}
    Verify Element Is Visible    xpath=${redeem_your_knight_token_title}
    Redeem Coupen By Its Value    ${data.coupen_title}    ${data.coupen_token}
    Verify The Alert Message Of Insufficient Balance

104 Verify if user click on any enabled redeem button and T&C check box is checked but Tokens are sufficient for redemtion
    &{data}    fetch data by id    ${testdatasheet}    104
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_no}
    Click On Request Otp Button
    Enter Otp    ${data.otp}
    Accept Login Terms And Conditions And Click On Submit Button
    Click On Skip Instructions Button If Visible
    Wait And Click On Element    xpath=${menu_button}
    Wait And Click On Element    xpath=${redemption}
    Verify Element Is Visible    xpath=${redeem_your_knight_token_title}
    Redeem Coupen By Its Value    ${data.coupen_title}    ${data.coupen_token}
    Verify Coupen Redeem Alert

105 Verify MyReward table if user has done the redemtion successfully
    &{data}    fetch data by id    ${testdatasheet}    105
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_no}
    Click On Request Otp Button
    Enter Otp    ${data.otp}
    Accept Login Terms And Conditions And Click On Submit Button
    Click On Skip Instructions Button If Visible
    Wait And Click On Element    xpath=${menu_button}
    Wait And Click On Element    xpath=${redemption}
    Verify Element Is Visible    xpath=${redeem_your_knight_token_title}
    Redeem Coupen By Its Value    ${data.coupen_title}    ${data.coupen_token}
    Verify Coupen Redeem Alert
    go back
    Wait And Click On Element    xpath=${my_rewards_button}
    ${redeemed_coupen_locator}    replace string      ${redeemed_coupen}    title      ${data.coupen_title}
    Swipe Up Until Element Is Visible    ${redeemed_coupen_locator}

106 Verify that token gets reduce if user has redeemed the reward
    &{data}    fetch data by id    ${testdatasheet}    106
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_no}
    Click On Request Otp Button
    Enter Otp    ${data.otp}
    Accept Login Terms And Conditions And Click On Submit Button
    Click On Skip Instructions Button If Visible
    Wait And Click On Element    xpath=${menu_button}
    Wait And Click On Element    xpath=${redemption}
    Verify Element Is Visible    xpath=${redeem_your_knight_token_title}
    ${tokens_before}    Get Remaining Tokens
    Redeem Coupen By Its Value    ${data.coupen_title}    ${data.coupen_token}
    Verify Coupen Redeem Alert
    Wait For 5 Seconds
    go back
    Verify Tokens Are Reduced     ${tokens_before}     ${data.coupen_token}

108 Verify T&C redirection link
    &{data}    fetch data by id    ${testdatasheet}    108
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_no}
    Click On Request Otp Button
    Enter Otp    ${data.otp}
    Accept Login Terms And Conditions And Click On Submit Button
    Click On Skip Instructions Button If Visible
    Wait And Click On Element    xpath=${menu_button}
    Wait And Click On Element    xpath=${redemption}
    Verify Element Is Visible    xpath=${redeem_your_knight_token_title}
    Wait And Click On Element    accessibility_id=${checkbox_unselected_id}
    Wait And Click On Element    ${redeem_terms_and_condition_button}
    Verify Element Is Visible    ${terms_and_condition_webview_header}
