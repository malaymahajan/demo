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
Library             ../../../../../CommonBase/Utilities/user_keywords.py
Variables           ../../PageObjects/Login/login_locators.py
Variables           ../../PageObjects/FLRP/flrp_locators.py
Variables           ../../PageObjects/LAKRHome/lakr_home_locators.py

Test Setup          Open KC App
Test Teardown       Close Application


*** Variables ***
${screenshot_actual_dir}    ${CURDIR}${/}..${/}..${/}TestData/Screenshots/actual_screenshots
${reference_image_dir}      ${CURDIR}${/}..${/}..${/}TestData/Screenshots/reference_screenshots/VideoListing


*** Test Cases ***
TC-167 Verify showcase ui of videos listing
    Skip Login
    Click On Skip Button If Visible
    Go To LAKR Home Screen
    Go To Hamburger Menu
    Select Videos Option
    Verify Showcase UI Of Videos

TC-168 Verify behind the scenes widget ui of videos listing
    Skip Login
    Click On Skip Button If Visible
    Go To LAKR Home Screen
    Go To Hamburger Menu
    Select Videos Option
    Verify Behind The Scenes UI

TC-169 Verify lakr films widget ui of videos listing
    [Tags]  video_listing
    Skip Login
    Click On Skip Button If Visible
    Go To LAKR Home Screen
    Go To Hamburger Menu
    Select Videos Option
    Verify LAKR Films Widget UI

TC-170 Verify highlights widget ui of videos listing
    Skip Login
    Click On Skip Button If Visible
    Go To LAKR Home Screen
    Go To Hamburger Menu
    Select Videos Option
    Verify Highlights Widget UI

TC-171 Verify redirection of behind the scenes listing widget ui of videos listing
    Skip Login
    Click On Skip Button If Visible
    Go To LAKR Home Screen
    Go To Hamburger Menu
    Select Videos Option
    Go To Behind The Scenes Page
    Verify Redirection Of Behind The Scenes Listing Widget UI


TC-172 Verify redirection of lakr films listing widget ui of videos listing
    [Tags]  video_listing
    Skip Login
    Click On Skip Button If Visible
    Go To LAKR Home Screen
    Go To Hamburger Menu
    Select Videos Option
    Go To Films Page
    Verify Redirection Of Films Listing Widget UI

TC-173 Verify redirection of highlights listing widget ui of videos listing
    Skip Login
    Click On Skip Button If Visible
    Go To LAKR Home Screen
    Go To Hamburger Menu
    Select Videos Option
    Go To Highlights Page
    Verify Redirection Of Highlights Listing Widget

