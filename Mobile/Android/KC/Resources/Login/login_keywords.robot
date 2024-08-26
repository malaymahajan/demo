*** Settings ***
Variables       ../../PageObjects/Login/login_locators.py
Variables       ../../PageObjects/HomePage/homepage_locators.py
Library         ../../../../../CommonBase/Utilities/user_keywords.py
Library         AppiumLibrary
Library         XML
Resource        ../Notification/notification_keywords.robot
Resource        ../../../../../CommonBase/Mobile/Android/Resources/Base_keywords.robot


*** Variables ***
${android_environment}                  ${CURDIR}${/}..${/}..${/}..${/}..${/}..${/}Runners${/}Environment${/}android_environment.json
${android_td}                           ${CURDIR}${/}..${/}..${/}TestData${/}already_registered_user_data.xlsx

${match_element}                        ${matchcentre_btn}
${expected_match_count}                 126
${copied_text}                          ${None}
${Expected_resend_otp_limit_count}      4
${actual_resend_otp_limit_count}        0


*** Keywords ***
Open KC App
    &{env_data} =    Get Environment Data    ${android_environment}
    Open Application On Real Device    ${env_data}
#    Open New Application On Real Device    ${env_data}
#    Open Application On Lamda Test    ${env_data}
#    Open Application On Browserstack    ${env_data}

Verify Login Screen
    AppiumLibrary.Wait Until Element Is Visible    ${login_view}    timeout=120

Enter Mobile Number
    [Arguments]    ${user_data}
    Log    ${user_data}
    Input Text    ${mobile_field}    ${user_data.mob_number}

Click On Request Otp Button
    Wait Until Element Is Visible    ${request_otp_btn}
    Click Element    ${request_otp_btn}

Check Otp Screen
    Wait Until Element Is Visible    ${otp_screen}    timeout=30
    Element Should Be Visible    ${otp_screen}

Enter Otp In Otp Fields
    [Arguments]    ${otp_data}
    Wait Until Element Is Visible    ${otp_screen}    timeout=30
    ${enter_otp_field} =    Set Variable    ${otp_fields}
    Input Text    ${enter_otp_field}    ${otp_data.otp}
    Wait Until Element Is Visible    ${disclaimer_checkbox}     timeout=30
    Click Element    ${disclaimer_checkbox}
    Wait Until Element Is Visible    ${privacy_policy_checkbox}     timeout=30
    Click Element    ${privacy_policy_checkbox}
    Wait Until Element Is Visible    ${submit_button}   timeout=30
    Click Element    ${submit_button}

Verify Otp Functionality
    ${actual_resend_otp_limit_count} =    Set Variable    0
    Wait Until Element Is Visible    ${otp_screen}    timeout=30
    Wait Until Element Is Visible    ${resend_otp_button}    timeout=30
    Sleep    130
    Click Element    ${resend_otp_button}
    Wait Until Page Contains Element    ${success_toast}    timeout=10
    ${actual_resend_otp_limit_count} =    Evaluate    int(${actual_resend_otp_limit_count}) + 1
    Sleep    130
    Click Element    ${resend_otp_button}
    Wait Until Page Contains Element    ${success_toast}    timeout=10
    ${actual_resend_otp_limit_count} =    Evaluate    int(${actual_resend_otp_limit_count}) + 1
    Sleep    130
    Click Element    ${resend_otp_button}
    Wait Until Page Contains Element    ${success_toast}    timeout=10
    ${actual_resend_otp_limit_count} =    Evaluate    int(${actual_resend_otp_limit_count}) + 1
    Sleep    130
    Click Element    ${resend_otp_button}
    Wait Until Page Contains Element    ${success_toast}    timeout=10
    ${actual_resend_otp_limit_count} =    Evaluate    int(${actual_resend_otp_limit_count}) + 1
    Sleep    130
    Click Element    ${resend_otp_button}
    Wait Until Element Is Visible    ${blocked_number_toast}    timeout=30
    Element Should Be Visible    ${blocked_number_toast}
    Check Otp Limit

Check Otp Limit
    Should Be Equal As Integers    ${Expected_resend_otp_limit_count}    ${actual_resend_otp_limit_count}

Verify Invalid Otp
    Wait Until Element Is Visible    ${otp_screen}    timeout=30
    ${enter_otp_field_1} =    Set Variable    ${otp_fields}
    Input Text    ${enter_otp_field_1}    123451
    Click Element    ${disclaimer_checkbox}
    Click Element    ${privacy_policy_checkbox}
    Click Element    ${submit_button}
    Sleep    5
    Wait Until Element Is Visible    ${otp_fields}    timeout=30
    Clear Text    ${otp_fields}
    ${enter_otp_field_2} =    Set Variable    ${otp_fields}
    Input Text    ${enter_otp_field_2}    123452
    Click Element    ${submit_button}
    Sleep    5
    Wait Until Element Is Visible    ${otp_fields}    timeout=30
    Clear Text    ${otp_fields}
    ${enter_otp_field_3} =    Set Variable    ${otp_fields}
    Input Text    ${enter_otp_field_3}    123453
    Click Element    ${submit_button}
    Sleep    5
    Wait Until Element Is Visible    ${otp_fields}    timeout=30
    Clear Text    ${otp_fields}
    ${enter_otp_field_4} =    Set Variable    ${otp_fields}
    Input Text    ${enter_otp_field_4}    123454
    Click Element    ${submit_button}
    Wait Until Element Is Visible    ${blocked_number_toast}    timeout=30
    Element Should Be Visible    ${blocked_number_toast}
    Go Back

Click And Verify Submit Button Is Disabled Without Accepting Terms & Conditions
    [Arguments]    ${otp_data}
    Wait Until Element Is Visible    ${otp_screen}    timeout=30
    ${enter_otp_field} =    Set Variable    ${otp_fields}
    Input Text    ${enter_otp_field}    ${otp_data.otp}
    Click Element    ${submit_button}
    ${status} =    Run Keyword And Return Status    Wait Until Element Is Visible    ${home_link}    timeout=15
    Should Be Equal    ${status}    ${False}
    Go Back

Click And Verify Skip Button Before And After Otp Is Requested
    &{login_data} =    Fetch Data By Id    ${android_td}    4
    Wait Until Element Is Visible    ${login_skip_button}    timeout=30
    Click Element    ${login_skip_button}
    Wait Until Page Contains Element    ${homepage_title}    timeout=30
    Element Should Be Visible    ${homepage_title}
    Click Element    ${profile_logo_button}
    Verify Login Screen
    Enter Mobile Number    ${login_data}
    Click On Request Otp Button
    Wait Until Element Is Visible    ${otp_screen}    timeout=30
    Wait Until Element Is Visible    ${login_skip_button}
    Click Element    ${login_skip_button}
    Wait Until Page Contains Element    ${homepage_title}    timeout=30
    Element Should Be Visible    ${homepage_title}
    Click Element    ${profile_logo_button}

Verify Redirection of Terms And Conditions Using Co-ordinates
    @{finger} =    Create List    ${311}    ${1151}
    Tap With Positions    ${100}    ${finger}
    Wait Until Page Contains Element    ${privacy_policy_page_title}    timeout=30
    Page Should Contain Element    ${privacy_policy_page_title}
    Click Element    ${back_button}
    Wait Until Page Contains Element    ${otp_screen}    timeout=30
    @{finger1} =    Create List    ${560}    ${1218}
    Tap With Positions    ${100}    ${finger1}
    Wait Until Page Contains Element    ${terms_and_conditions_page_title}    timeout=30
    Page Should Contain Element    ${terms_and_conditions_page_title}
    Click Element    ${back_button}
    Wait Until Page Contains Element    ${otp_screen}    timeout=30
    Go Back
