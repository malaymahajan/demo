*** Settings ***
Library    AppiumLibrary
Resource    ../../Resources/Login/login_keywords.robot
Resource    ../../../../../CommonBase/Mobile/IOS/Resources/Base_keywords.robot
Variables   ../../PageObjects/Profile/profile_locators.py
Variables   ../../PageObjects/AccessibilityID/accessibility_id.py


*** Keywords ***
Click Element If Visible
    [Arguments]    ${element}
    ${status}   run keyword and return status    wait until page contains element    ${element}     timeout=10
    IF    ${status}
        click element    ${element}
    END

