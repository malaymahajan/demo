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
Resource            ../../Resources/VideoListing/video_listing_keywords.robot
Resource            ../../Resources/NewsDetailing/news_detailing_keywords.robot
Library             ../../../../../CommonBase/Utilities/user_keywords.py
Variables           ../../PageObjects/Login/login_locators.py
Variables           ../../PageObjects/FLRP/flrp_locators.py
Variables           ../../PageObjects/LAKRHome/lakr_home_locators.py

Test Setup          Open KC App
Test Teardown       Close Application


*** Variables ***
${screenshot_actual_dir}    ${CURDIR}${/}..${/}..${/}TestData/Screenshots/actual_screenshots
${reference_image_dir}      ${CURDIR}${/}..${/}..${/}TestData/Screenshots/reference_screenshots/NewsDetailing


*** Test Cases ***
TC-174 Verify the header and content ui of news detailing
    [Tags]  news_detailing
    Skip Login
    Click On Skip Button If Visible
    Go To LAKR Home Screen
    Go To Hamburger Menu
    Go To News Article Page
    Click On First News
    Verify The Header And Content UI

TC-175 Verify the related news ui of news detailing
    Skip Login
    Click On Skip Button If Visible
    Go To LAKR Home Screen
    Go To Hamburger Menu
    Go To News Article Page
    Click On First News
    Go To Related News UI
    Verify The Related News UI
