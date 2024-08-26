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
Variables       ../../PageObjects/VideoListing/video_listing_locators.py
Variables       ../../PageObjects/NewsDetailing/news_detailing_locators.py
Variables       ../../PageObjects/VideoDetailing/video_detailing_locators.py
Variables       ../../PageObjects/PhotoDetailing/photo_detailing_locators.py
Resource        ../../Resources/LAKRHome/lakr_home_keywords.robot
Resource        ../CometChat/comet_chat_keywords.robot


*** Variables ***
${already_registered_user_td}       ${CURDIR}${/}..${/}..${/}TestData${/}already_registered_user_data.xlsx
${screenshot_actual_dir}            ${CURDIR}${/}..${/}..${/}TestData/Screenshots/actual_screenshots
${reference_image_dir}              ${CURDIR}${/}..${/}..${/}TestData/Screenshots/reference_screenshots/PhotoDetailing


*** Keywords ***
Click On First Photo
    Wait Until Element Is Visible    xpath=${first_photo}    timeout=30
    Click Element    xpath=${first_photo}
    Wait Until Element Is Visible    ${registration_cancle_button}    timeout=30
    Click Element    ${registration_cancle_button}
    Wait For 5 Seconds

Verify The Header And Content UI Of Photos
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Wait For 5 Seconds
    ${image_name}    Set Variable    photo_details.png
    AppiumLibrary.capture page screenshot    ${image_name}
    ${image_path}    Set Variable    ${screenshot_actual_dir}${/}${image_name}
    ${cropped_image}    user_keywords.Crop Image Header Footer    ${image_path}    ${image_path}    80    60
    ${reference_image_path}    Set Variable    ${reference_image_dir}${/}${image_name}
    Compare Images    ${reference_image_path}    ${cropped_image}   resize_candidate=true

Go To Related Photos UI
    Swipe Down Until Element Is Visible    ${related_photo_ui}

Verify The Related Photos UI
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Wait For 5 Seconds
    ${image_name}    Set Variable    related_photo_ui.png
    AppiumLibrary.capture page screenshot    ${image_name}
    ${image_path}    Set Variable    ${screenshot_actual_dir}${/}${image_name}
    ${cropped_image}    user_keywords.Crop Image Header Footer    ${image_path}    ${image_path}    80    60
    ${reference_image_path}    Set Variable    ${reference_image_dir}${/}${image_name}
    Compare Images    ${reference_image_path}    ${cropped_image}   resize_candidate=true

Click On Any Photo And Enlarge It
    Wait Until Element Is Visible    ${first_photo_option}  timeout=30
    Click Element    ${first_photo_option}
    Wait Until Element Is Visible    ${download_button}     timeout=30

Verify The Enlarging Photos UI
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Wait For 5 Seconds
    ${image_name}    Set Variable    enlarging_photos_ui.png
    AppiumLibrary.capture page screenshot    ${image_name}
    ${image_path}    Set Variable    ${screenshot_actual_dir}${/}${image_name}
    ${cropped_image}    user_keywords.Crop Image Header Footer    ${image_path}    ${image_path}    80    60
    ${reference_image_path}    Set Variable    ${reference_image_dir}${/}${image_name}
    Compare Images    ${cropped_image}  ${reference_image_path}   resize_candidate=true
