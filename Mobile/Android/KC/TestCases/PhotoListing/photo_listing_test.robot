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
Resource            ../../Resources/LAKRNewsListing/lakr_news_listing_keywords.robot
Resource            ../../Resources/PhotoListing/photo_listing_keywords.robot
Library             ../../../../../CommonBase/Utilities/user_keywords.py
Variables           ../../PageObjects/Login/login_locators.py
Variables           ../../PageObjects/FLRP/flrp_locators.py
Variables           ../../PageObjects/LAKRHome/lakr_home_locators.py

Test Setup          Open KC App
Test Teardown       Close Application


*** Variables ***
${screenshot_actual_dir}    ${CURDIR}${/}..${/}..${/}TestData/Screenshots/actual_screenshots
${screenshot_actual_dir}            ${CURDIR}${/}..${/}..${/}TestData/Screenshots/actual_screenshots
${reference_image_dir}              ${CURDIR}${/}..${/}..${/}TestData/Screenshots/reference_screenshots/PhotoListing


*** Test Cases ***
TC-164 Verify showcase ui of photos listing
    Skip Login
    Click On Skip Button If Visible
    Go To LAKR Home Screen
    Go To Hamburger Menu
    Select Photos Option
    Verify Showcase UI Of Photos Listing Widget

TC-165 Verify infinite scrolling listing ui in photos listing
    [Tags]  photo_listing
    Skip Login
    Click On Skip Button If Visible
    Go To LAKR Home Screen
    Go To Hamburger Menu
    Select Photos Option
    Verify Infinite Scrolling Listing UI In Photos

