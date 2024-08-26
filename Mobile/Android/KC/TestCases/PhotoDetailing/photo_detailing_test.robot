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
Resource            ../../Resources/VideoDetailing/video_detailing_keywords.robot
Resource            ../../Resources/PhotoDetailing/photo_detailing_keywords.robot
Library             ../../../../../CommonBase/Utilities/user_keywords.py
Variables           ../../PageObjects/Login/login_locators.py
Variables           ../../PageObjects/FLRP/flrp_locators.py
Variables           ../../PageObjects/LAKRHome/lakr_home_locators.py

Test Setup          Open KC App
Test Teardown       Close Application


*** Variables ***
${screenshot_actual_dir}    ${CURDIR}${/}..${/}..${/}TestData/Screenshots/actual_screenshots
${reference_image_dir}      ${CURDIR}${/}..${/}..${/}TestData/Screenshots/reference_screenshots/PhotoDetailing


*** Test Cases ***
TC-178 Verify the header and content ui of photo detailing
    Skip Login
    Click On Skip Button If Visible
    Go To LAKR Home Screen
    Go To Hamburger Menu
    Select Photos Option
    Click On First Photo
    Verify The Header And Content UI Of Photos

TC-179 Verify the related photos ui of photo detailing
    [Tags]  photo_detailing
    Skip Login
    Click On Skip Button If Visible
    Go To LAKR Home Screen
    Go To Hamburger Menu
    Select Photos Option
    Click On First Photo
    Go To Related Photos UI
    Verify The Related Photos UI

TC-180 Verify the enlarging photos ui in photos detailing
    [Tags]  photo_detailing
    Skip Login
    Click On Skip Button If Visible
    Go To LAKR Home Screen
    Go To Hamburger Menu
    Select Photos Option
    Click On First Photo
    Click On Any Photo And Enlarge It
    Verify The Enlarging Photos UI
