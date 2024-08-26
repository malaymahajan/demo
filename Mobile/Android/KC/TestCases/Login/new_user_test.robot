*** Settings ***
Library             AppiumLibrary
Library             Screenshot
Library             DocTest.VisualTest
Library             OperatingSystem
Resource            ../../Resources/Login/new_user_keywords.robot
Resource            ../../Resources/Notification/notification_keywords.robot
Resource            ../../Resources/Login/login_keywords.robot
Library             ../../../../../CommonBase/Utilities/user_keywords.py

Test Setup          Open KC App
Test Teardown       Close Application


*** Variables ***
${screenshot_actual_dir}    ${CURDIR}${/}..${/}..${/}..${/}..${/}..${/}Runners/Reports/Screenshots/actual_screenshots
${new_user_td}              ${CURDIR}${/}..${/}..${/}TestData${/}new_user_data.xlsx


*** Test Cases ***
TC-13 Verify mandatory field
    &{login_data}    Fetch Data By Id    ${new_user_td}    1
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Get Otp From Notification Panel
    Verify Mandatory Fields In Profile Page    ${login_data}

TC-14 Verify upload of picture in dp
    &{login_data}    Fetch Data By Id    ${new_user_td}    2
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Get Otp From Notification Panel
    Verify If User Is Able To Upload Profile Picture

TC-15 Verify email address validation
    &{login_data}    Fetch Data By Id    ${new_user_td}    3
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Get Otp From Notification Panel
    Verify Validation For Email Address    ${login_data}

TC-16 Verify progress bar validation
    &{login_data}    Fetch Data By Id    ${new_user_td}    4
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Get Otp From Notification Panel
    Verify Progress Bar Validation In Profile Page

TC-17 Verify user goes to selected team
    &{login_data}    Fetch Data By Id    ${new_user_td}    5
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Get Otp From Notification Panel
    Verify User Goes to Selected Team    ${login_data}

TC-18 Verify user can copy and paste referral code
    &{login_data}    Fetch Data By Id    ${new_user_td}    5
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Get Otp From Notification Panel
    Check Complete Profile PopUP
    Sleep    3
    Copy The Friends Refferal Code
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Get Otp From Notification Panel
    Enter The Refferal Code

TC-20 Verify token reward after registration
    &{login_data}    Fetch Data By Id    ${new_user_td}    6
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Get Otp From Notification Panel
    Verify Token Reward After Registration    ${login_data}

TC-21 Verify the ui of the welcome screen
    &{login_data}    Fetch Data By Id    ${new_user_td}    7
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Get Otp From Notification Panel
    Verify UI Of Welcome Screen    ${login_data}
    Sleep    5
    AppiumLibrary.capture page screenshot    welcome_screen.png
    ${image_path}    Set Variable    ${screenshot_actual_dir}/welcome_screen.png
    ${cropped_image}    user_keywords.crop_image    ${image_path}    ${image_path}    770    1334
    Compare Images    Runners/Reports/Screenshots/reference_screenshots/welcome_screen_image.png    ${cropped_image}
    Sleep    15

TC-22 Verify ui of faq page
    &{login_data}    Fetch Data By Id    ${new_user_td}    8
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Get Otp From Notification Panel
    Verify UI Of FAQ Screen    ${login_data}
    Sleep    5
    AppiumLibrary.capture page screenshot    faq_screen.png
    ${image_path}    Set Variable    ${screenshot_actual_dir}/faq_screen.png
    ${cropped_image}    user_keywords.crop_image    ${image_path}    ${image_path}    750    1788
    Compare Images
    ...    Runners/Reports/Screenshots/reference_screenshots/FAQ_screen.png
    ...    ${cropped_image}
    ...    resize_candidate=true
    Sleep    15

TC-23 Verify ui of congratulations page
    &{login_data}    Fetch Data By Id    ${new_user_td}    9
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Get Otp From Notification Panel
    Verify UI Of Congratulations Screen    ${login_data}
    Sleep    5
    AppiumLibrary.capture page screenshot    congratulations_screen.png
    ${image_path}    Set Variable    ${screenshot_actual_dir}/congratulations_screen.png
    ${cropped_image}    user_keywords.crop_image    ${image_path}    ${image_path}    750    1334
    Compare Images    Runners/Reports/Screenshots/reference_screenshots/congratulations_screen.png    ${cropped_image}
    Sleep    15

TC-24 Verify if user is able to access bingo knights without registeration
    Verify If User Can Access Bingo Knights Without Registeration

TC-25 Verify if user able to redirect to bingo webview screen after login
    Verify If User Able To Redirect To Bingo Webview Screen

TC-26 Verify videos are auto play
    Verify Videos Are Auto Play Or Not

TC-27 Verify video playing functionality
    Verify Videos Are Auto Play Or Not

TC-28 Verify sharing functionality of video
    Verify Sharing Functionality Of Video

TC-29 Verify if user is able to filter the fixtures
    &{login_data}    Fetch Data By Id    ${new_user_td}    10
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Get Otp From Notification Panel
    Check Complete Profile PopUP
    Verify If User Is Able To Filter The Fixtures On Webview Screen

TC-30 Verify user can select status filter on webview screen
    &{login_data}    Fetch Data By Id    ${new_user_td}    10
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Get Otp From Notification Panel
    Check Complete Profile PopUP
    Verify If User Can Select Status Filter On Webview Screen
