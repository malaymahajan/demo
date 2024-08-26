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
Resource        ../../Resources/LAKRHome/lakr_home_keywords.robot
Resource        ../CometChat/comet_chat_keywords.robot


*** Variables ***
${already_registered_user_td}       ${CURDIR}${/}..${/}..${/}TestData${/}already_registered_user_data.xlsx
${screenshot_actual_dir}            ${CURDIR}${/}..${/}..${/}TestData/Screenshots/actual_screenshots
${reference_image_dir}              ${CURDIR}${/}..${/}..${/}TestData/Screenshots/reference_screenshots/VideoListing


*** Keywords ***
Select Videos Option
    Wait Until Element Is Visible    ${videos_option}    timeout=30
    Click Element    ${videos_option}
    Wait Until Element Is Visible    ${videos_page}    timeout=30

Verify Showcase UI Of Videos
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Sleep    10
    ${image_name}    Set Variable    showcase_ui_videos.png
    AppiumLibrary.capture page screenshot    ${image_name}
    ${image_path}    Set Variable    ${screenshot_actual_dir}${/}${image_name}
    ${cropped_image}    user_keywords.Crop Image Header Footer    ${image_path}    ${image_path}    80    60
    ${reference_image_path}    Set Variable    ${reference_image_dir}${/}${image_name}
    Compare Images    ${reference_image_path}    ${cropped_image}   resize_candidate=true

Verify Behind The Scenes UI
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Wait For 2 Seconds
    Swipe    ${485}    ${779}    ${501}    ${507}
    Wait For 5 Seconds
    ${image_name}    Set Variable    behind_the_scenes_ui.png
    AppiumLibrary.capture page screenshot    ${image_name}
    ${image_path}    Set Variable    ${screenshot_actual_dir}${/}${image_name}
    ${cropped_image}    user_keywords.Crop Image Header Footer    ${image_path}    ${image_path}    80    60
    ${reference_image_path}    Set Variable    ${reference_image_dir}${/}${image_name}
    Compare Images    ${reference_image_path}    ${cropped_image}   resize_candidate=true

Verify LAKR Films Widget UI
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Wait For 2 Seconds
    Swipe Down Until Element Is Visible    ${highlights_all_button}
    Wait For 5 Seconds
    ${image_name}    Set Variable    films_ui.png
    AppiumLibrary.capture page screenshot    ${image_name}
    ${image_path}    Set Variable    ${screenshot_actual_dir}${/}${image_name}
    ${cropped_image}    user_keywords.Crop Image Header Footer    ${image_path}    ${image_path}    80    60
    ${reference_image_path}    Set Variable    ${reference_image_dir}${/}${image_name}
    Compare Images    ${cropped_image}  ${reference_image_path}   resize_candidate=true

Verify Highlights Widget UI
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Wait For 2 Seconds
    Swipe    ${253}    ${1368}    ${333}    ${223}
    Wait For 5 Seconds
    ${image_name}    Set Variable    highlights_widget_ui.png
    AppiumLibrary.capture page screenshot    ${image_name}
    ${image_path}    Set Variable    ${screenshot_actual_dir}${/}${image_name}
    ${cropped_image}    user_keywords.Crop Image Header Footer    ${image_path}    ${image_path}    80    60
    ${reference_image_path}    Set Variable    ${reference_image_dir}${/}${image_name}
    Compare Images    ${reference_image_path}    ${cropped_image}   resize_candidate=true

Go To Behind The Scenes Page
    Wait Until Element Is Visible    xpath=${behind_the_scenes_all_button}    timeout=30
    Click Element    xpath=${behind_the_scenes_all_button}
    Wait Until Element Is Visible    ${behind_the_scenes_page}    timeout=30

Verify Redirection Of Behind The Scenes Listing Widget UI
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Wait For 5 Seconds
    ${image_name}    Set Variable    behind_the_scenes_page_ui.png
    AppiumLibrary.capture page screenshot    ${image_name}
    ${image_path}    Set Variable    ${screenshot_actual_dir}${/}${image_name}
    ${cropped_image}    user_keywords.Crop Image Header Footer    ${image_path}    ${image_path}    80    60
    ${reference_image_path}    Set Variable    ${reference_image_dir}${/}${image_name}
    Compare Images    ${reference_image_path}    ${cropped_image}   resize_candidate=true

Go To Films Page
    Wait Until Element Is Visible    xpath=${films_all_button}    timeout=30
    Click Element    xpath=${films_all_button}
    Wait Until Element Is Visible    ${films_page}    timeout=30

Verify Redirection Of Films Listing Widget UI
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Wait For 5 Seconds
    ${image_name}    Set Variable    films_page_ui.png
    AppiumLibrary.capture page screenshot    ${image_name}
    ${image_path}    Set Variable    ${screenshot_actual_dir}${/}${image_name}
    ${cropped_image}    user_keywords.Crop Image Header Footer    ${image_path}    ${image_path}    80    60
    ${reference_image_path}    Set Variable    ${reference_image_dir}${/}${image_name}
    Compare Images    ${cropped_image}  ${reference_image_path}   resize_candidate=true


Go To Highlights Page
    Wait Until Element Is Visible    xpath=${highlights_all_button}    timeout=30
    Click Element    xpath=${highlights_all_button}
    Wait Until Element Is Visible    ${highlights_page}    timeout=30

Verify Redirection Of Highlights Listing Widget
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Wait For 5 Seconds
    ${image_name}    Set Variable    highlights_page.png
    AppiumLibrary.capture page screenshot    ${image_name}
    ${image_path}    Set Variable    ${screenshot_actual_dir}${/}${image_name}
    ${cropped_image}    user_keywords.Crop Image Header Footer    ${image_path}    ${image_path}    80    60
    ${reference_image_path}    Set Variable    ${reference_image_dir}${/}${image_name}
    Compare Images    ${reference_image_path}    ${cropped_image}   resize_candidate=true

