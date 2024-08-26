*** Settings ***
Library         AppiumLibrary
Library         XML
Library         DateTime
Library         Screenshot
Library         DocTest.VisualTest
Variables       ../../PageObjects/Login/login_locators.py
Variables       ../../PageObjects/HomePage/homepage_locators.py
Library         ../../../../../CommonBase/Utilities/user_keywords.py
Resource        ../Notification/notification_keywords.robot
Resource        ../../Resources/Login/login_keywords.robot
Resource        ../../Resources/Login/new_user_keywords.robot
Variables       ../../PageObjects/FLRP/flrp_locators.py
Variables       ../../PageObjects/LAKRHome/lakr_home_locators.py
Variables       ../../PageObjects/LAKRNewsListing/lakr_news_listing_locators.py
Variables       ../../PageObjects/PhotoListing/photo_listing_locators.py
Resource        ../../Resources/LAKRHome/lakr_home_keywords.robot


*** Variables ***
${already_registered_user_td}       ${CURDIR}${/}..${/}..${/}TestData${/}already_registered_user_data.xlsx
${screenshot_actual_dir}            ${CURDIR}${/}..${/}..${/}TestData/Screenshots/actual_screenshots
${reference_image_dir}              ${CURDIR}${/}..${/}..${/}TestData/Screenshots/reference_screenshots/PhotoListing
${MAX_SCROLL_ATTEMPTS}     10
${EXPECTED_TOTAL_COUNT}    20
*** Keywords ***
Select Photos Option
    Wait Until Element Is Visible    ${photos_option}    timeout=30
    Click Element    ${photos_option}
    Wait Until Element Is Visible    ${photos_page}    timeout=30

Verify Showcase UI Of Photos Listing Widget
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Sleep    10
    ${image_name}    Set Variable    showcase_ui_photos.png
    AppiumLibrary.capture page screenshot    ${image_name}
    ${image_path}    Set Variable    ${screenshot_actual_dir}${/}${image_name}
    ${cropped_image}    user_keywords.Crop Image Header Footer    ${image_path}    ${image_path}    80    60
    ${reference_image_path}    Set Variable    ${reference_image_dir}${/}${image_name}
    Compare Images    ${reference_image_path}    ${cropped_image}   resize_candidate=true

Verify Infinite Scrolling Listing UI In Photos
        Wait Until Element Is Visible    ${photos_list}     timeout=30
        Swipe Down Until Element Is Visible    ${last_photo}





