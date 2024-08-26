*** Settings ***
Library             AppiumLibrary
Library             Screenshot
Library             DocTest.VisualTest
Library             OperatingSystem
Resource            ../../Resources/Login/login_keywords.robot
Resource            ../../Resources/Notification/notification_keywords.robot
Resource            ../../Resources/Login/new_user_keywords.robot
Resource            ../../Resources/FLRP/flrp_keywords.robot
Resource            ../../Resources/LAKRHome/lakr_home_keywords.robot
Resource            ../../Resources/CometChat/comet_chat_keywords.robot
Library             ../../../../../CommonBase/Utilities/user_keywords.py
Variables           ../../PageObjects/Login/login_locators.py
Variables           ../../PageObjects/FLRP/flrp_locators.py
Variables           ../../PageObjects/LAKRHome/lakr_home_locators.py

Test Setup          Open KC App
Test Teardown       Close Application


*** Variables ***
${screenshot_actual_dir}    ${CURDIR}${/}..${/}..${/}TestData/Screenshots/actual_screenshots
${reference_image_dir}      ${CURDIR}${/}..${/}..${/}TestData/Screenshots/reference_screenshots/LAKRHome


*** Test Cases ***
TC-145 Verify header ui on lakr home screen
    Skip Login
    Click On Skip Button If Visible
    Go To LAKR Home Screen
    Wait For 5 Seconds
    Verify Header UI

TC-146 Verify showcase ui on lakr home screen
    Skip Login
    Click On Skip Button If Visible
    Go To LAKR Home Screen
    Verify Showcase UI



TC-147 Verify home fixtures ui on lakr home screen
    [Tags]  demo
    Skip Login
    Click On Skip Button If Visible
    Go To LAKR Home Screen
    Verify Home Fixtures UI

TC-148 Verify news ui on lakr home screen
    Skip Login
    Click On Skip Button If Visible
    Go To LAKR Home Screen
    Verify News UI

TC-149 Verify gaming hub ui on lakr home screen
    Skip Login
    Click On Skip Button If Visible
    Go To LAKR Home Screen
    Verify Gaming Hub UI

TC-150 Verify home photos ui on lakr home screen
    Skip Login
    Click On Skip Button If Visible
    Go To LAKR Home Screen
    Verify Home Photos UI

TC-151 Verify home standings ui on lakr home screen
    Skip Login
    Click On Skip Button If Visible
    Go To LAKR Home Screen
    Verify Home Standings UI

TC-152 Verify home squad ui on lakr home screen
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Skip Login
    Click On Skip Button If Visible
    Go To LAKR Home Screen
    Verify Home Squad UI

TC-153 Verify home fan polls ui on lakr home screen
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Skip Login
    Click On Skip Button If Visible
    Go To LAKR Home Screen
    Verify Home Fan Polls UI

TC-154 Verify home videos ui on lakr home screen
    Skip Login
    Click On Skip Button If Visible
    Go To LAKR Home Screen
    Verify Home Videos UI

## press Release UI is not visible
 TC-155 Verify home press release ui on lakr home screen
    [Tags]  lakr_home
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Skip Login
    Click On Skip Button If Visible
    Go To LAKR Home Screen
    Verify Home Press Release UI


TC-156 Verify home banner ui on lakr home screen
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Skip Login
    Click On Skip Button If Visible
    Go To LAKR Home Screen
    Check Banner Is Present

TC-157 Verify home bottom now playing ui in lakr home screen
    Skip Login
    Click On Skip Button If Visible
    Go To LAKR Home Screen
    Verify Home Bottom Now Playing UI

Verify Images
     [Tags]  IC
     ${text_mask} =  Create Dictionary    page=all    type=pattern    xoffset=5     yoffset=5   pattern=.*[0-9]{2}-[a-zA-Z]{3}-[0-9]{4}.*
#     ${text_mask1} =  Create Dictionary    page=all    type=pattern    xoffset=5     yoffset=5   pattern=.*[0-9A-Z]{9}.*
     ${masks} =   Create List    ${text_mask}
     Compare Images    Mobile/Android/KC/TestData/Screenshots/actual_screenshots/Beach_date.png    Mobile/Android/KC/TestData/Screenshots/reference_screenshots/Beach_left.png    mask=${masks}
