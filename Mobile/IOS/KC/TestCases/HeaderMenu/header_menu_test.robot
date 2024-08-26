*** Settings ***
Library   AppiumLibrary
Resource    ../../Resources/HeaderMenu/header_menu_keywords.robot

Test Setup    Open KC Application
Test Teardown    Close Application

*** Variables ***
${testdatasheet}    ${CURDIR}${/}..${/}..${/}TestData${/}header_menu_testdata.xlsx

*** Test Cases ***
83 Verify if user is not logged in and tap on Loyalty menu
    &{data}    fetch data by id    ${testdatasheet}    83
    Click And Verify Skip Login Button
    Click On Skip Instructions Button If Visible
    Wait And Click On Element    xpath=${loyalty_button}
    ${title}     Evaluate    ', '.join(${data.popup_title})
    Verify Login Registration Popup    ${title}

84 Verify if user is not logged in and tap on ok button from loyality menu option
    &{data}    fetch data by id    ${testdatasheet}    84
    Click And Verify Skip Login Button
    Click On Skip Instructions Button If Visible
    Wait And Click On Element    xpath=${loyalty_button}
    ${title}     Evaluate    ', '.join(${data.popup_title})
    Verify Login Registration Popup    ${title}
    Wait And Click On Element    xpath=${register_popup_ok_button}
    Verify Login Screen

85 Verify if user is not logged in and tap on Video menu
    &{data}    fetch data by id    ${testdatasheet}    85
    Click And Verify Skip Login Button
    Click On Skip Instructions Button If Visible
    Wait And Click On Element    xpath=${video_button}
    Wait And Click On Element    xpath=${video_play}
    ${title}     Evaluate    ', '.join(${data.popup_title})
    Verify Login Registration Popup    ${title}

86 Verify if user is not logged in and tap on Fanchat menu
    &{data}    fetch data by id    ${testdatasheet}    86
    Click And Verify Skip Login Button
    Click On Skip Instructions Button If Visible
    Wait And Click On Element    xpath=${fan_chat}
    ${title}     Evaluate    ', '.join(${data.popup_title})
    Verify Login Registration Popup    ${title}

