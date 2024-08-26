*** Settings ***
Library   AppiumLibrary
Resource    ../../Resources/FooterMenu/footer_menu_keywords.robot
Variables    ../../PageObjects/FooterMenu/footer_menu_locators.py

Test Setup    Open KC Application
Test Teardown    Close Application

*** Variables ***


*** Test Cases ***
80 Verify if user Tap on Lakr logo
    Click And Verify Skip Login Button
    Click On Skip Instructions Button If Visible
    Wait And Click On Element    accessibility_id=${logo_main_id}
    Wait And Click On Element    xpath=${lakr_logo}
    Verify Element Is Visible    accessibility_id=${lakr_logo_main}

81 Verify if user Tap on Tkr logo
    Click And Verify Skip Login Button
    Click On Skip Instructions Button If Visible
    Wait And Click On Element    accessibility_id=${logo_main_id}
    Wait And Click On Element    xpath=${tkr_logo}
    Verify Element Is Visible    accessibility_id=${tkr_logo_main}

82 Verify if user Tap on Adkr logo
    Click And Verify Skip Login Button
    Click On Skip Instructions Button If Visible
    Wait And Click On Element    accessibility_id=${logo_main_id}
    Wait And Click On Element    xpath=${adkr_logo}
    Verify Element Is Visible    accessibility_id=${adkr_main_logo}
