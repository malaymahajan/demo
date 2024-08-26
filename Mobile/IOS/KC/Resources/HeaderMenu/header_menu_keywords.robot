*** Settings ***
Library    AppiumLibrary
Library    OperatingSystem
Resource    ../../Resources/Login/login_keywords.robot
Resource    ../../Resources/FooterMenu/footer_menu_keywords.robot
Variables    ../../PageObjects/AccessibilityId/accessibility_id.py
Variables    ../../PageObjects/HeaderMenu/header_menu_locators.py
Variables    ../../PageObjects/HomeScreen/home_screen_locators.py

*** Keywords ***
Verify Login Registration Popup
    [Arguments]    ${title}
    Verify Element Is Visible    xpath=${hall_of_fans_icon}
    Verify Element Is Visible    xpath=//XCUIElementTypeStaticText[@name="${title}"]
    Verify Element Is Visible    xpath=${register_popup_cancel_button}
    Verify Element Is Visible    xpath=${register_popup_ok_button}
