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


*** Variables ***
${already_registered_user_td}       ${CURDIR}${/}..${/}..${/}TestData${/}already_registered_user_data.xlsx
${screenshot_actual_dir}            ${CURDIR}${/}..${/}..${/}TestData/Screenshots/actual_screenshots
${reference_image_dir}              ${CURDIR}${/}..${/}..${/}TestData/Screenshots/reference_screenshots/LAKRHome


*** Keywords ***
Skip Login
    Wait Until Element Is Visible    ${login_skip_button}    timeout=30
    Click Element    ${login_skip_button}

Go To LAKR Home Screen
    Wait Until Element Is Visible    ${kkr_logo}    timeout=30
    Click Element    ${kkr_logo}
    Wait Until Element Is Visible    ${lakr_team}    timeout=30
    Click Element    ${lakr_team}
    Wait Until Element Is Visible    ${lakr_logo}    timeout=30

Check Banner Is Present
    Swipe Down Until Element Is Visible    ${news}
    Wait For 2 Seconds
    Wait Until Element Is Visible    ${banner}    timeout=30
    Element Should Be Visible    ${banner}

Verify Home Press Release UI
    Wait Until Element Is Visible    ${banner}    timeout=30

Verify Header UI
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Sleep    10
    ${image_name}    Set Variable    lakr_header_ui.png
    AppiumLibrary.capture page screenshot    ${image_name}
    ${image_path}    Set Variable    ${screenshot_actual_dir}${/}${image_name}
    ${cropped_image}    user_keywords.Crop Image Header Footer    ${image_path}    ${image_path}    80    60
    ${reference_image_path}    Set Variable    ${reference_image_dir}${/}${image_name}
    Compare Images    ${reference_image_path}    ${cropped_image}   resize_candidate=true

Verify Showcase UI
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Sleep    10
    ${image_name}    Set Variable    schowcase.png
    AppiumLibrary.capture page screenshot    ${image_name}
    ${image_path}    Set Variable    ${screenshot_actual_dir}${/}${image_name}
    ${cropped_image}    user_keywords.Crop Image Header Footer    ${image_path}    ${image_path}    80    60
    ${reference_image_path}    Set Variable    ${reference_image_dir}${/}${image_name}
    Compare Images    ${reference_image_path}    ${cropped_image}   resize_candidate=true

Verify Home Fixtures UI
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Swipe Down Until Element Is Visible    ${fixtures_matchcentre_button}
    Sleep    10
    ${image_name}    Set Variable    fixtures.png
    AppiumLibrary.capture page screenshot    ${image_name}
    ${image_path}    Set Variable    ${screenshot_actual_dir}${/}${image_name}
    ${cropped_image}    user_keywords.Crop Image Header Footer    ${image_path}    ${image_path}    90    100
    ${reference_image_path}    Set Variable    ${reference_image_dir}${/}${image_name}
#    ${text_mask} =  Create Dictionary    page=all    type=pattern    pattern=.*[a-zA-Z0-9].*
#    ${masks} =   Create List    ${text_mask}
    Compare Images    ${image_path}     ${reference_imagepath}   resize_candidate=true

Verify News UI
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Swipe Down Until Element Is Visible    xpath=${news_ui}
    Sleep    10
    ${image_name}    Set Variable    news.png
    AppiumLibrary.capture page screenshot    ${image_name}
    ${image_path}    Set Variable    ${screenshot_actual_dir}${/}${image_name}
    ${cropped_image}    user_keywords.Crop Image Header Footer    ${image_path}    ${image_path}    80    60
    ${reference_image_path}    Set Variable    ${reference_image_dir}${/}${image_name}
    Compare Images    ${reference_image_path}    ${cropped_image}   resize_candidate=true

Verify Gaming Hub UI
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Swipe Down Until Element Is Visible    ${videos}
    Sleep    10
    ${image_name}    Set Variable    GamingHub.png
    AppiumLibrary.capture page screenshot    ${image_name}
    ${image_path}    Set Variable    ${screenshot_actual_dir}${/}${image_name}
    ${cropped_image}    user_keywords.Crop Image Header Footer    ${image_path}    ${image_path}    80    60
    ${reference_image_path}    Set Variable    ${reference_image_dir}${/}${image_name}
    Compare Images    ${reference_image_path}    ${cropped_image}   resize_candidate=true

Verify Home Photos UI
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Swipe Down Until Element Is Visible    ${shop}
    Sleep    10
    ${image_name}    Set Variable    photos_ui.png
    AppiumLibrary.capture page screenshot    ${image_name}
    ${image_path}    Set Variable    ${screenshot_actual_dir}${/}${image_name}
    ${cropped_image}    user_keywords.Crop Image Header Footer    ${image_path}    ${image_path}    80    60
    ${reference_image_path}    Set Variable    ${reference_image_dir}${/}${image_name}
    Compare Images    ${reference_image_path}    ${cropped_image}   resize_candidate=true

Verify Home Standings UI
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Swipe Down Until Element Is Visible    ${standings}
    Sleep    10
    ${image_name}    Set Variable    Standings.png
    AppiumLibrary.capture page screenshot    ${image_name}
    ${image_path}    Set Variable    ${screenshot_actual_dir}${/}${image_name}
    ${cropped_image}    user_keywords.Crop Image Header Footer    ${image_path}    ${image_path}    80    60
    ${reference_image_path}    Set Variable    ${reference_image_dir}${/}${image_name}
    Compare Images    ${reference_image_path}    ${cropped_image}   resize_candidate=true

Verify Home Squad UI
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Swipe Down Until Element Is Visible    ${player}
    Sleep    10
    ${image_name}    Set Variable    Squad.png
    AppiumLibrary.capture page screenshot    ${image_name}
    ${image_path}    Set Variable    ${screenshot_actual_dir}${/}${image_name}
    ${cropped_image}    user_keywords.Crop Image Header Footer    ${image_path}    ${image_path}    80    60
    ${reference_image_path}    Set Variable    ${reference_image_dir}${/}${image_name}
    Compare Images    ${reference_image_path}    ${cropped_image}   resize_candidate=true

Verify Home Fan Polls UI
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Swipe Down Until Element Is Visible    ${fanpoll_widget}
    Sleep    10
    ${image_name}    Set Variable    fanpoll.png
    AppiumLibrary.capture page screenshot    ${image_name}
    ${image_path}    Set Variable    ${screenshot_actual_dir}${/}${image_name}
    ${cropped_image}    user_keywords.Crop Image Header Footer    ${image_path}    ${image_path}    80    60
    ${reference_image_path}    Set Variable    ${reference_image_dir}${/}${image_name}
    Compare Images    ${reference_image_path}    ${cropped_image}   resize_candidate=true

Verify Home Videos UI
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Swipe Down Until Element Is Visible    ${videos}
    Sleep    10
    ${image_name}    Set Variable    videos.png
    AppiumLibrary.capture page screenshot    ${image_name}
    ${image_path}    Set Variable    ${screenshot_actual_dir}${/}${image_name}
    ${cropped_image}    user_keywords.Crop Image Header Footer    ${image_path}    ${image_path}    80    60
    ${reference_image_path}    Set Variable    ${reference_image_dir}${/}${image_name}
    Compare Images    ${reference_image_path}    ${cropped_image}   resize_candidate=true

Verify Home Bottom Now Playing UI
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Swipe Down Until Element Is Visible    ${now_playing}
    Sleep    10
    ${image_name}    Set Variable    now_playing.png
    AppiumLibrary.capture page screenshot    ${image_name}
    ${image_path}    Set Variable    ${screenshot_actual_dir}${/}${image_name}
    ${cropped_image}    user_keywords.Crop Image Header Footer    ${image_path}    ${image_path}    80    60
    ${reference_image_path}    Set Variable    ${reference_image_dir}${/}${image_name}
    Compare Images    ${reference_image_path}    ${cropped_image}   resize_candidate=true

