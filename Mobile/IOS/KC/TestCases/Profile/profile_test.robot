*** Settings ***
Library   AppiumLibrary
Library      Screenshot
Library      DocTest.VisualTest
Resource    ../../Resources/Profile/profile_keywords.robot

Test Setup    Open KC Application
Test Teardown    Close Application

*** Variables ***
${testdatasheet}    ${CURDIR}${/}..${/}..${/}TestData${/}profile_testdata.xlsx
${screenshot_actual_dir}    ./Mobile/IOS/KC/TestData/ActualScreenshot

*** Test Cases ***
27 Verify post registration, user shall receive 150 tokens for signup
    [Tags]    sprint-6
    &{data}    fetch data by id    ${testdatasheet}      27
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_no}
    Click On Request Otp Button
    Enter Otp From Suggestions
    Create New Profile    ${data}
    Wait And Click On Element    ${lakr_primary_team_logo}
    Wait And Click On Element    ${registration_next_button}
    Wait And Click On Element    ${registration_ok_button}
    Wait And Click On Element    ${lets_get_started_button}
    Wait And Click On Element    ${wohoo_thankyou_button}
    Click Element If Visible    xpath=${coupon_earned_popup_ok_button}
    Click On Skip Instructions Button If Visible
    Verify Element Is Visible    accessibility_id=${lakr_logo_main}
    Click On My Profile Icon   ${data.username}
    Wait And Click On Element   ${my_ledger_button}
    Verify Element Is Visible   ${ledger_registration_token}

28 Verify referral code points are credited to account
    [Tags]    sprint-6
    &{data}    fetch data by id    ${testdatasheet}      28
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_no}
    Click On Request Otp Button
    Enter Otp From Suggestions
    Create New Profile    ${data}
    Wait And Click On Element    ${lakr_primary_team_logo}
    Redeem Referral code    ${data.referral_code}
    ${datetime1}    Get Current Date Time
    Wait for 5 seconds
    ${datetime2}    Get Current Date Time
    Click Next And Finish Registration
    Wait And Click On Element    ${coupon_earned_popup_ok_button}
    Click On Skip Instructions Button If Visible
    Click On My Profile Icon   ${data.username}
    Logout From App
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_no2}
    Click On Request Otp Button
    Enter Otp    ${data.otp}
    Accept Login Terms And Conditions And Click On Submit Button
    Click On Skip Instructions Button If Visible
    Click On My Profile Icon   ${data.username}
    Wait And Click On Element   ${my_ledger_button}
    Verify Tokens Credited    ${datetime1}   ${datetime2}    ${data.activity}    ${data.expected_tokens}


112 Verify the redirection of Invite Friend in User Profile
    [Tags]    sprint-6      test:retry(2)
    &{data}    fetch data by id    ${testdatasheet}      112
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_no}
    Click On Request Otp Button
    Enter Otp    ${data.otp}
    Accept Login Terms And Conditions And Click On Submit Button
    Click On Skip Instructions Button If Visible
    Click On My Profile Icon   ${data.username}
    Wait And Click On Element    ${invite_a_friend_button}
    Verify Element Is Visible    ${referral_popup_title}
    Verify Element Is Visible    ${share_via_button}

117 Verify the UI of Jersey with Name and Number
    [Tags]    sprint-6
    &{data}    fetch data by id    ${testdatasheet}      117
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_no}
    Click On Request Otp Button
    Enter Otp    ${data.otp}
    Accept Login Terms And Conditions And Click On Submit Button
    Click On Skip Instructions Button If Visible
    Click On My Profile Icon   ${data.username}
    Wait for 5 seconds
    capture page screenshot    jursey_ui_screenshot.png
    ${image_path}=    Set Variable    ${screenshot_actual_dir}/jursey_ui_screenshot.png
    Wait for 5 seconds
    ${cropped_image}=    crop image header footer       ${image_path}        ${image_path}      80      30
    Compare Images     ./Mobile/IOS/KC/TestData/reference_screenshots/jersey_ui_screen.png      ${cropped_image}    resize_candidate=true

118 Verify Favorite player can be changed in User Profile
    [Tags]    sprint-6      test:retry(2)
    &{data}    fetch data by id    ${testdatasheet}      118
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_no}
    Click On Request Otp Button
    Enter Otp    ${data.otp}
    Accept Login Terms And Conditions And Click On Submit Button
    Click On Skip Instructions Button If Visible
    Click On My Profile Icon   ${data.username}
    Verify Favorite Player Can Be Changed    ${data}

119 Verify like functionality is working for articles widget (Photos, News, Videos) in User profile
    [Tags]    sprint-6      test:retry(2)
    &{data}    fetch data by id    ${testdatasheet}      119
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_no}
    Click On Request Otp Button
    Enter Otp    ${data.otp}
    Accept Login Terms And Conditions And Click On Submit Button
    Click On Skip Instructions Button If Visible
    Click On My Profile Icon   ${data.username}
    Verify Element Is Visible    xpath=${invite_a_friend_button}
    Swipe Up Until Element Is Visible    xpath=${related_photo_title}
    Wait And Click On Element    xpath=${related_video_first_like_button}
    Verify Element Is Visible    xpath=${related_video_first_liked_button}


120 Verify share functionality is working for articles widget (Photos, News, Videos) in User profile
    [Tags]    sprint-6      test:retry(2)
    &{data}    fetch data by id    ${testdatasheet}      120
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_no}
    Click On Request Otp Button
    Enter Otp    ${data.otp}
    Accept Login Terms And Conditions And Click On Submit Button
    Click On Skip Instructions Button If Visible
    Click On My Profile Icon   ${data.username}
    Verify Element Is Visible    xpath=${invite_a_friend_button}
    Swipe Up Until Element Is Visible    xpath=${related_photo_title}
    Wait And Click On Element    xpath=${related_video_first_share_button}
    Verify Element Is Visible    xpath=${share_popup_knight_club_link}
    Verify Element Is Visible    xpath=${share_popup_close_button}

121 Verify left and right swiper functionality is working for articles widget (Photos, News, Videos) in User profile
    [Tags]    sprint-6      test:retry(2)
    &{data}    fetch data by id    ${testdatasheet}      121
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_no}
    Click On Request Otp Button
    Enter Otp    ${data.otp}
    Accept Login Terms And Conditions And Click On Submit Button
    Click On Skip Instructions Button If Visible
    Click On My Profile Icon   ${data.username}
    Verify Element Is Visible    xpath=${invite_a_friend_button}
    Swipe Up Until Element Is Visible    xpath=${related_photo_title}
    Verify Right And Left Swipe Functionality    ${data.article_title}
