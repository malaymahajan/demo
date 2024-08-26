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
Resource        ../../Resources/LAKRHome/lakr_home_keywords.robot


*** Variables ***
${already_registered_user_td}       ${CURDIR}${/}..${/}..${/}TestData${/}already_registered_user_data.xlsx
${screenshot_actual_dir}            ${CURDIR}${/}..${/}..${/}TestData/Screenshots/actual_screenshots
${reference_image_dir}              ${CURDIR}${/}..${/}..${/}TestData/Screenshots/reference_screenshots/LAKRNewsListing


*** Keywords ***
Go To Hamburger Menu
    Wait Until Element Is Visible    ${menu}    timeout=15
    Click Element    ${menu}
    Wait Until Element Is Visible    ${menu_page}    timeout=30

Select News Option
    Swipe Down Until Element Is Visible    ${news_tab}
    Click Element    ${news_tab}
    Wait Until Element Is Visible    ${news_article_page}    timeout=30

Go To Featured Article
    Swipe Down Until Element Is Visible    xpath=${featured_article}
    Sleep    3

Go To Latest Article Page
    Wait Until Element Is Visible    xpath=${latest_news_view_more_button}    timeout=30
    Click Element    xpath=${latest_news_view_more_button}
    Wait Until Element Is Visible    ${latest_news_page}    timeout=30

Go To Featured Article Page
    Wait Until Element Is Visible    xpath=${featured_article_view_more_button}    timeout=30
    Click Element    xpath=${featured_article_view_more_button}
    Wait Until Element Is Visible    ${featured_article_page}

Verify Showcase UI Of News Listing
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Sleep    10
    ${image_name}    Set Variable    showcase_ui.png
    AppiumLibrary.capture page screenshot    ${image_name}
    ${image_path}    Set Variable    ${screenshot_actual_dir}${/}${image_name}
    ${cropped_image}    user_keywords.Crop Image Header Footer    ${image_path}    ${image_path}    80    60
    ${reference_image_path}    Set Variable    ${reference_image_dir}${/}${image_name}
    Compare Images    ${reference_image_path}    ${cropped_image}   resize_candidate=true

Verify Latest Articles Widget UI
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Sleep    10
    ${image_name}    Set Variable    latest_article_ui.png
    AppiumLibrary.capture page screenshot    ${image_name}
    ${image_path}    Set Variable    ${screenshot_actual_dir}${/}${image_name}
    ${cropped_image}    user_keywords.Crop Image Header Footer    ${image_path}    ${image_path}    80    60
    ${reference_image_path}    Set Variable    ${reference_image_dir}${/}${image_name}
    Compare Images    ${reference_image_path}    ${cropped_image}   resize_candidate=true

Verify Featured Articles Widget UI
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Sleep    10
    ${image_name}    Set Variable    featured_articles.png
    AppiumLibrary.capture page screenshot    ${image_name}
    ${image_path}    Set Variable    ${screenshot_actual_dir}${/}${image_name}
    ${cropped_image}    user_keywords.Crop Image Header Footer    ${image_path}    ${image_path}    80    60
    ${reference_image_path}    Set Variable    ${reference_image_dir}${/}${image_name}
    Compare Images    ${reference_image_path}    ${cropped_image}   resize_candidate=true

Verify Redirection Of Featured Articles
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Sleep    10
    ${image_name}    Set Variable    featured_article_redirection_ui.png
    AppiumLibrary.capture page screenshot    ${image_name}
    ${image_path}    Set Variable    ${screenshot_actual_dir}${/}${image_name}
    ${cropped_image}    user_keywords.Crop Image Header Footer    ${image_path}    ${image_path}    80    60
    ${reference_image_path}    Set Variable    ${reference_image_dir}${/}${image_name}
    Compare Images    ${reference_image_path}    ${cropped_image}   resize_candidate=true

Verify Redirection Of Latest Articles
    screenshot.set screenshot directory    ${screenshot_actual_dir}
    Set Library Search Order    AppiumLibrary    SeleniumLibrary
    Sleep    10
    ${image_name}    Set Variable    latest_article_redirection_ui.png
    AppiumLibrary.capture page screenshot    ${image_name}
    ${image_path}    Set Variable    ${screenshot_actual_dir}${/}${image_name}
    ${cropped_image}    user_keywords.Crop Image Header Footer    ${image_path}    ${image_path}    80    60
    ${reference_image_path}    Set Variable    ${reference_image_dir}${/}${image_name}
    Compare Images    ${reference_image_path}    ${cropped_image}   resize_candidate=true
