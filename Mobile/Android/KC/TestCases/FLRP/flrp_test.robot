*** Settings ***
Library             AppiumLibrary
Library             Screenshot
Library             DocTest.VisualTest
Library             OperatingSystem
Resource            ../../Resources/Login/login_keywords.robot
Resource            ../../Resources/Notification/notification_keywords.robot
Resource            ../../Resources/Login/new_user_keywords.robot
Resource            ../../Resources/FLRP/flrp_keywords.robot
Resource            ../../Resources/CometChat/comet_chat_keywords.robot
Library             ../../../../../CommonBase/Utilities/user_keywords.py
Variables           ../../PageObjects/Login/login_locators.py
Variables           ../../PageObjects/FLRP/flrp_locators.py

Test Setup          Open KC App
Test Teardown       Close Application


*** Variables ***

${already_registered_user_td}       ${CURDIR}${/}..${/}..${/}TestData${/}already_registered_user_data.xlsx
${new_user_td}                      ${CURDIR}${/}..${/}..${/}TestData${/}new_user_data.xlsx
${referral_code_td}                 ${CURDIR}${/}..${/}..${/}TestData${/}referral_code_data.xlsx
${datetime}                         ${EMPTY}
${testdata}                         ${CURDIR}${/}..${/}..${/}TestData${/}comet_chat_data_new.xlsx


*** Test Cases ***
TC-45 Verify user do refer a friend receives 150 tokens
    &{new_user_login_data}    Fetch Data By Id    ${new_user_td}    1
    &{registered_user_login_data}    Fetch Data By Id    ${already_registered_user_td}    11
    Verify Login Screen
    Enter Mobile Number    ${new_user_login_data}
    Click On Request Otp Button
    Get Otp From Notification Panel
    Enter Profile Details    ${new_user_login_data}
    ${datetime1}    ${datetime2}    Enter Referral Code    ${registered_user_login_data}
    Click On Next Button And Complete Registeration
    Logout From App
    Verify Login Screen
    Enter Mobile Number    ${registered_user_login_data}
    Click On Request Otp Button
    Enter Otp In Otp Fields    ${registered_user_login_data}
    Check Complete Profile PopUP
    Click On Skip Button If Visible
    Go To My Ledger Page
    Verify Tokens Credited    ${datetime1}    ${datetime2}    Tokens credited to your account for referral code.    150

TC-46 Verify user do open notifications receives 10 tokens | upto 2 times
    Open Notification Panel
    Collapse Notification
    Click On Push Notification    ${news_notification_title}
    Go Back
    ${datetime1}    Get Current Date Time
    Wait For 5 Seconds
    ${datetime2}    Get Current Date Time
    Go To My Ledger Page
    Verify Tokens Credited    ${datetime1}  ${datetime2}   Tokens credited to your account for clicking on notification.    10

TC-47 Verify user do click on popups receives 50 tokens | upto 2 times
    Click On In App Notification    ${in_app_news_button}
    ${datetime1}    Get Current Date Time
    Wait For 5 Seconds
    ${datetime2}    Get Current Date Time
    Go Back
    Go To My Ledger Page
    Verify Tokens Credited    ${datetime1}  ${datetime2}   Tokens credited to your account for click on popups.    50

TC-48 Verify user do view content receives 10 tokens | upto 2 times
    [Tags]    flrp
    set library search order    AppiumLibrary    SeleniumLibrary
    &{login_data}    Fetch Data By Id    ${new_user_td}    1
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Get Otp From Notification Panel
    Check Complete Profile PopUP
    Click On Skip Button If Visible
    Go To News Article Page
    ${datetime1}    ${datetime2}    Click On First News Article
    Go To My Ledger Page
    Sleep    15
    Verify Tokens Credited    ${datetime1}    ${datetime2}    Tokens credited to your account for view content.    10

TC-49 Verify user do react/share receives 10 tokens | upto 2 times
    [Tags]    flrp
    &{login_data}    Fetch Data By Id    ${new_user_td}    1
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Get Otp From Notification Panel
    Check Complete Profile PopUP
    Click On Skip Button If Visible
    Go To News Article Page
    ${datetime1}    ${datetime2}    Tap On Heart Icon
    Go To My Ledger Page
    Sleep    20
    Verify Tokens Credited
    ...    ${datetime1}
    ...    ${datetime2}
    ...    Tokens credited to your account for react on content.
    ...    10

TC-50 Verify user do interaction with matchcenter receives 10 tokens | upto 2 times
    &{login_data}    Fetch Data By Id    ${new_user_td}    1
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Get Otp From Notification Panel
    Check Complete Profile PopUP
    Click On Skip Button If Visible
    ${datetime1}    ${datetime2}    Go To Fixtures Page And Click On Match Center
    Go To My Ledger Page
    Verify Tokens Credited
    ...    ${datetime1}
    ...    ${datetime2}
    ...    Tokens credited to your account for visit match center.
    ...    10

TC-51 Verify that when a user exchanges tokens for a coupon, the system deducts the appropriate number of tokens from their account in accordance with the specific amount of that coupon.
    &{registered_user_login_data}    Fetch Data By Id    ${already_registered_user_td}    10
    Verify Login Screen
    Enter Mobile Number    ${registered_user_login_data}
    Click On Request Otp Button
    Enter Otp In Otp Fields    ${registered_user_login_data}
    Check Complete Profile PopUP
    Go To My Profile Page And Click On Redeem Your Knight Tokens
    Redeem Available Token
    ${datetime1}    Get Current Date Time
    Wait for 5 seconds
    ${datetime2}    Get Current Date Time
    Go To My Ledger Page
    Verify Tokens Debited    ${datetime1}    Tokens debited from your account for Megastore.    10

TC-52 Confirm that users cannot redeem coupons with a value exceeding their available budget and also verify the alert message of "Insufficient Balance"
    [Tags]    flrp
    &{registered_user_login_data}    Fetch Data By Id    ${already_registered_user_td}    6
    Verify Login Screen
    Enter Mobile Number    ${registered_user_login_data}
    Click On Request Otp Button
    Enter Otp In Otp Fields    ${registered_user_login_data}
    Check Complete Profile PopUP
    Go To My Profile Page And Click On Redeem Your Knight Tokens
    Redeem Available Coupons With Maximum Amount
    Verify User Gets Insufficient Balance Message

TC-53 Verify the system accurately distributes coupons based on user activity and also distributes the corresponding coupon codes to those specific users.
    [Tags]    flrp
    &{registered_user_login_data}    Fetch Data By Id    ${already_registered_user_td}    9
    Verify Login Screen
    Enter Mobile Number    ${registered_user_login_data}
    Click On Request Otp Button
    Enter Otp In Otp Fields    ${registered_user_login_data}
    Check Complete Profile PopUP
    Go To My Profile Page And Click On Redeem Your Knight Tokens
    Redeem Available Coupons    ${redeem_coupon_button}
    Verify User Gets Coupon Code After Redeem

TC-54 Verify that users must check the checkbox indicating acceptance of the terms and conditions before being allowed to redeem coupons.
    [Tags]    flrp
    &{registered_user_login_data}    Fetch Data By Id    ${already_registered_user_td}    7
    Verify Login Screen
    Enter Mobile Number    ${registered_user_login_data}
    Click On Request Otp Button
    Enter Otp In Otp Fields    ${registered_user_login_data}
    Check Complete Profile PopUP
    Go To My Profile Page And Click On Redeem Your Knight Tokens
    Redeem Available Coupons Without Accepting Terms And Conditions

TC-56 Verify that users are prohibited from redeeming tokens for coupons when the status is either "Redeemed" or "Coming Soon".
    [Tags]    flrp
    &{registered_user_login_data}    Fetch Data By Id    ${already_registered_user_td}    8
    Verify Login Screen
    Enter Mobile Number    ${registered_user_login_data}
    Click On Request Otp Button
    Enter Otp In Otp Fields    ${registered_user_login_data}
    Check Complete Profile PopUP
    Go To My Profile Page And Click On Redeem Your Knight Tokens
    Try To Redeem The Available Coupon Having Coming Soon CTA
