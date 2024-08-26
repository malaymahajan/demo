*** Settings ***
Library    AppiumLibrary
Library    OperatingSystem
Resource    ../../Resources/HamburgerMenu/hamburger_menu_keywords.robot
Variables    ../../PageObjects/RedeemYourKnightToken/redeem_your_knight_token_locators.py

*** Keywords ***
Redeem Coupen By Its Value
    [Arguments]    ${coupen_title}    ${coupen_token}
    wait until page contains element    accessibility_id=${checkbox_unselected_id}
    Click Element     accessibility_id=${checkbox_unselected_id}
    swipe up until element is visible    //XCUIElementTypeStaticText[@name="${coupen_title}"]//../XCUIElementTypeStaticText[@name="${coupen_token}"]/following-sibling::XCUIElementTypeButton[@name="REDEEM"]
    Click Element     //XCUIElementTypeStaticText[@name="${coupen_title}"]//../XCUIElementTypeStaticText[@name="${coupen_token}"]/following-sibling::XCUIElementTypeButton[@name="REDEEM"]

Get Remaining Tokens
    wait until page contains element    xpath=${tokens_left_redeem_screen}
    ${tokens}    get element attribute    xpath=${tokens_left_redeem_screen}    value
    RETURN    ${tokens}

Verify Tokens Are Reduced
    [Arguments]    ${tokens_before_redeem}    ${coupen_value}
    ${tokens_after_redeem}    Get Remaining Tokens
    ${expected_tokens_left}    evaluate    ${tokens_before_redeem}-${coupen_value}
    should be equal as numbers    ${tokens_after_redeem}    ${expected_tokens_left}