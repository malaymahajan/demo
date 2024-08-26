*** Settings ***
Library    AppiumLibrary
Library    OperatingSystem
Resource    ../../Resources/HamburgerMenu/hamburger_menu_keywords.robot
Variables    ../../PageObjects/HallOfFans/hall_of_fans_locators.py

*** Keywords ***
Verify Check leaderboard Popup
    wait until page contains element    ${check_leaderboard_popup_logo}    timeout=10
    wait until page contains element    ${check_leaderboard_popup_title}    timeout=10
    wait until page contains element    ${check_leaderboard_popup_description}    timeout=10
    wait until page contains element    ${check_leaderboard_popup_ok_button}    timeout=10