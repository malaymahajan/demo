*** Settings ***
Library   AppiumLibrary
Library      Screenshot
Library      DocTest.VisualTest
Resource    ../../Resources/IncompleteProfile/incomplete_profile_keywords.robot

Test Setup    Open KC Application
Test Teardown    Close Application

*** Variables ***
${testdatasheet}    ${CURDIR}${/}..${/}..${/}TestData${/}incomplete_profile_testdata.xlsx
${screenshot_actual_dir}    ./Mobile/IOS/KC/TestData/ActualScreenshot

*** Test Cases ***
17 Verify upload of picture in DP using images in mobile folder or using camera
    [Tags]    sprint-6      test:retry(2)
    &{data}    fetch data by id    ${testdatasheet}      17
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_no}
    Click On Request Otp Button
    Enter Otp From Suggestions
    Wait And Click On Element    accessibility_id=${camera_id}
    Wait And Click On Element    accessibility_id=${take_photo}
    Wait for 5 seconds
    Wait And Click On Element    accessibility_id=${capture_photo}
    Wait And Click On Element    accessibility_id=${done_id}
    Verify Element Is Visible    xpath=${profile_image}


20 Verify the screen Welcome to Knight Club UI text after submission of Register Screen
    [Tags]    sprint-6
    &{data}    fetch data by id    ${testdatasheet}      20
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_no}
    Click On Request Otp Button
    Enter Otp From Suggestions
    Create New Profile    ${data}
    Wait And Click On Element    ${lakr_primary_team_logo}
    Wait And Click On Element    ${registration_next_button}
    Wait for 5 seconds
    capture page screenshot    welcome_screen_screenshot.png
    ${image_path}=    Set Variable    ${screenshot_actual_dir}/welcome_screen_screenshot.png
    Wait for 5 seconds
    ${cropped_image}=    user_keywords.crop image header footer    ${image_path}    ${image_path}    80      30
    Compare Images     ./Mobile/IOS/KC/TestData/reference_screenshots/welcome_screen_image.png    ${cropped_image}    resize_candidate=true

22 Verify the screens Fan Loyalty Progamme and FAQ UI text after submission of Register Screen
    [Tags]    sprint-6
    &{data}    fetch data by id    ${testdatasheet}      22
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_no}
    Click On Request Otp Button
    Enter Otp From Suggestions
    Create New Profile    ${data}
    Wait And Click On Element    ${lakr_primary_team_logo}
    Wait And Click On Element    ${registration_next_button}
    Wait And Click On Element    ${registration_ok_button}
    Wait for 5 seconds
    capture page screenshot    fan_loyalty_screenshot.png
    ${image_path}=    Set Variable    ${screenshot_actual_dir}/fan_loyalty_screenshot.png
    Wait for 5 seconds
    ${cropped_image}=    user_keywords.crop image header footer    ${image_path}    ${image_path}    80      30
    Compare Images     ./Mobile/IOS/KC/TestData/reference_screenshots/FAQ_screen.png    ${cropped_image}    resize_candidate=true

24 Verify the screen Congratulations UI text after submission of Register Screen
    [Tags]    sprint-6
    &{data}    fetch data by id    ${testdatasheet}      24
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_no}
    Click On Request Otp Button
    Enter Otp From Suggestions
    Create New Profile    ${data}
    Wait And Click On Element    ${lakr_primary_team_logo}
    Wait And Click On Element    ${registration_next_button}
    Wait And Click On Element    ${registration_ok_button}
    Wait And Click On Element    ${lets_get_started_button}
    Wait for 5 seconds
    capture page screenshot    congratulations_screenshot.png
    ${image_path}=    Set Variable    ${screenshot_actual_dir}/congratulations_screenshot.png
    Wait for 5 seconds
    ${cropped_image}=    user_keywords.crop image header footer    ${image_path}    ${image_path}    80      30
    Compare Images     ./Mobile/IOS/KC/TestData/reference_screenshots/congratulations_screen.png    ${cropped_image}    resize_candidate=true

26 Verify Click on Tank you button before user goes to the team, which is selected in choose your primary team.
    [Tags]    sprint-6      test:retry(2)
    &{data}    fetch data by id    ${testdatasheet}      26
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
    Click Element If Visible    ${coupon_earned_popup_ok_button}
    Click On Skip Instructions Button If Visible
    Verify Element Is Visible    accessibility_id=${lakr_logo_main}
