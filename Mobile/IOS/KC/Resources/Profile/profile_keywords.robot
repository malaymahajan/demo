*** Settings ***
Library    AppiumLibrary
Library         DateTime
Variables    ../../PageObjects/MyLedger/my_ledger_locators.py
Resource    ../../Resources/IncompleteProfile/incomplete_profile_keywords.robot

*** Variables ***
${date_format}                      %d %B %Y | %I:%M %p

*** Keywords ***
Click On My Profile Icon
    [Arguments]    ${username}
    ${initial}    get substring    ${username}    0   1
    ${initial}    convert to upper case   ${initial}
    ${profile_icon}    replace string    ${my_profile_icon}     replace_initial     ${initial}
    Wait And Click On Element    ${profile_icon}
    log to console    ${initial}

Verify Right And Left Swipe Functionality
    [Arguments]    ${first_article_id}
    wait until page contains element    accessibility_id=${first_article_id}
    Swipe    ${319}    ${596}    ${105}    ${597}
    Swipe    ${319}    ${596}    ${105}    ${597}
    Swipe    ${319}    ${596}    ${105}    ${597}
    page should not contain element    accessibility_id=${first_article_id}
    Swipe    ${91}    ${593}    ${342}    ${593}
    Swipe    ${91}    ${593}    ${342}    ${593}
    Swipe    ${91}    ${593}    ${342}    ${593}
    wait until page contains element    accessibility_id=${first_article_id}

Verify Favorite Player Can Be Changed
    [Arguments]    ${data}
    Verify Element Is Visible    xpath=${invite_a_friend_button}
    Swipe Up Until Element Is Visible    xpath=${edit_player_button}
    Wait And Click On Element    xpath=${edit_player_button}
    Swipe Up Until Element Is Visible    xpath=${related_photo_title}
    Swipe Down Until Element Is Visible    xpath=${save_player_button}
    Wait And Click On Element    xpath=${select_player_dropdown}
    Wait And Click On Element    accessibility_id=${data.favourite_player}
    Wait And Click On Element    xpath=${save_player_button}

Get Current Date Time
    ${current_datetime}=    Get Current Date    result_format=${date_format}
    ${current_datetime_lower}=    Replace AM PM    ${current_datetime}
    RETURN    ${current_datetime_lower}

Verify Tokens Credited
    [Arguments]    ${datetime1}   ${datetime2}    ${activity}    ${expected_tokens}
    ${xpath1}=    Set Variable
    ...    //XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[@name="${space}${space}${datetime1}${space}${space}"]//../XCUIElementTypeStaticText[@name="${activity}"]//../XCUIElementTypeStaticText[@name="${expected_tokens}"]
    log  Verifying XPath: ${xpath1}

    ${xpath2}=    Set Variable
    ...    //XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[@name="${space}${space}${datetime2}${space}${space}"]//../XCUIElementTypeStaticText[@name="${activity}"]//../XCUIElementTypeStaticText[@name="${expected_tokens}"]
    log  Verifying XPath: ${xpath2}

    ${status}   Run Keyword And Return Status    Wait Until Element Is Visible    xpath=${xpath1}     timeout=30
    IF    ${status}
        Log    token generated
    ELSE
        Wait Until Element Is Visible    xpath=${xpath2}  timeout=30
    END