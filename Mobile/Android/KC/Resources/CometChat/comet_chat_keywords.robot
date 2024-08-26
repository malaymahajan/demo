*** Settings ***
Library         AppiumLibrary
Library         XML
Library         DateTime
Library         Process
Library         OperatingSystem
Library         ../../../../../CommonBase/Utilities/user_keywords.py
Resource        ../Notification/notification_keywords.robot
Resource        ../../Resources/Login/login_keywords.robot
Resource        ../../Resources/Login/new_user_keywords.robot
Variables       ../../PageObjects/FLRP/flrp_locators.py
Variables       ../../PageObjects/CometChat/comet_chat_locators.py


*** Variables ***
${already_registered_user_td}       ${CURDIR}${/}..${/}..${/}TestData${/}already_registered_user_data.xlsx
${time_format}                      %I:%M %p


*** Keywords ***
Single Finger Tap
    [Arguments]    ${locator}
    ${rect}    Get Element Rect    ${locator}
    ${centre_x}    Evaluate    ${rect}[x] + (${rect}[width] / 2)
    ${centre_y}    Evaluate    ${rect}[y] + (${rect}[height] / 2)
    @{firstFinger}    create list    ${centre_x}    ${centre_y}
    @{fingerPositions}    create list    ${firstFinger}
    Tap with Positions    ${1000}    @{fingerPositions}

Get Current Time
    ${current_time}    Get Current Date    result_format=${time_format}
    ${current_time_lower}    Replace AM PM    ${current_time}
    RETURN    ${current_time_lower}

Click On Fan Chat Button
    wait until page contains element    ${fan_chat}    timeout=30
    click element    ${fan_chat}

Wait For 5 Seconds
    Sleep    5

Join N Fan Chat Groups
    [Arguments]    ${group_count}
    FOR    ${count}    IN RANGE    1    ${group_count}+1
        ${index}    Convert To String    ${count}
        ${join_button1}     Replace String    ${join_button}    replace_group    ${index}
        Log    ${join_button1}
        swipe up until element is visible    xpath=${join_button1}
        click element    xpath=${join_button1}
        Wait Until Page Contains Element    ${join_success_toast}   timeout=10
        Click Element    xpath=${join_button1}
        wait until element is visible    ${write_msg_text}    timeout=30
        wait until element is visible    ${send_button}
        click element    ${group_back_button}
        ${count}    Evaluate    ${count}+1
    END

Click On Skip Button If Visible
    ${status}    run keyword and return status    wait until element is visible    ${skip_button}
    IF    ${status}    click element    ${skip_button}

Click On Joined Button
    Wait Until Element Is Visible    ${joined_button}    timeout=30
    Click Element    ${joined_button}

Verify Admin | Moderator Can Send Photo | Video In Group
    Wait Until Element Is Visible    ${add_club_button}    timeout=30
    Click Element    ${add_club_button}
    Wait Until Element Is Visible    ${take_photo}    timeout=30
    Click Element    ${take_photo}
    Wait Until Element Is Visible    ${take_picture_button}    timeout=30
    Click Element    ${take_picture_button}
    Wait Until Element Is Visible    ${camera_ok_button}    timeout=30
    Click Element    ${camera_ok_button}
    ${latest_time1}    Get Current Time
    ${latest_msg_time}    Replace String    ${latest_message_time}    latest_time    ${latest_time1}
    Wait Until Element Is Visible    ${latest_msg_time}    timeout=30

Verify Admin | Moderator Can Create Poll In Group
    [Arguments]    ${data}
    wait until page contains element    ${add_club_button}    timeout=30
    Click Element    ${add_club_button}
    wait until page contains element    ${create_poll_button}    timeout=30
    Click Element    ${create_poll_button}
    wait until page contains element    ${enter_question_field}    timeout=30
    Input Text    ${enter_question_field}    ${data.question}
    Input Text    xpath=${enter_option1}    ${data.option1}
    Input Text    xpath=${enter_option2}    ${data.option2}
    Click Element    ${create_poll}
    wait until element is visible    ${poll_question}    timeout=30

Verify Admin | Moderator Can Pin Message
    [Arguments]    ${count}
    ${last_message}    Replace String    ${latest_message_xpath}    latest_message    ${count}
    Wait Until Element Is Visible    xpath=${last_message}    timeout=30
    Single Finger Tap    xpath=${last_message}
    Wait Until Element Is Visible    ${pin_message}    timeout=15
    Click Element    ${pin_message}
    sleep    1
    Page Should Contain Element    ${pin_message_toast}

Join A Group If Not Joined Any And Open Chat
    ${status}    run keyword and return status    wait until element is visible    ${joined_button}    timeout=30
    IF    ${status}
        log to console    Already Joined One
        click element    ${joined_button}
    ELSE
        wait until element is visible    xpath=${first_join_button}    timeout=30
        click element    xpath=${first_join_button}
        Wait Until Element Is Visible    ${joined_button}    timeout=30
        Click Element    ${joined_button}
    END
    wait until element is visible    xpath=${gify_icon}    timeout=30

Send GIF In Group Chat
    Wait Until Element Is Visible    ${gify_icon}    timeout=30
    Click Element    ${gify_icon}
    Wait Until Element Is Visible    xpath=${first_gif}    timeout=30
    Click Element    xpath=${first_gif}
    ${latest_time}    Get Current Time
    ${latest_time_xpath}    Replace String    ${latest_message_time}    latest_time    ${latest_time}
    Wait Until Element Is Visible    ${latest_time_xpath}    timeout=30

Leave Fan Chat Group
    Wait Until Element Is Visible    ${group_icon}    timeout=30
    Click Element    ${group_icon}
    Wait Until Element Is Visible    ${group_username}    timeout=30
    Swipe Down Until Element Is Visible    ${files_tab}
    Click Element    ${files_tab}
    Swipe Down Until Element Is Visible    ${leave_group_button}
    Click Element    ${leave_group_button}
    Wait Until Element Is Visible    ${leave_group_confirm_message}    timeout=30
    Click Element    ${leave_group_confirm_message}
    Wait Until Element Is Visible    xpath=${first_join_button}    timeout=30

Verify Admin Can Promote Participant
    Wait Until Element Is Visible    ${group_icon}    timeout=30
    Click Element    ${group_icon}
    Wait Until Element Is Visible    ${administrators_button}    timeout=30
    Click Element    ${administrators_button}
    Wait Until Element Is Visible    ${Assign_group_admin_option}    timeout=30
    Click Element    ${Assign_group_admin_option}
    Wait Until Element Is Visible    ${group_username1}    timeout=30
    Click Element    ${group_username1}
    Wait Until Element Is Visible    ${yes_button}
    Click Element    ${yes_button}
    Wait Until Element Is Visible    ${group_username1}    timeout=30
    Wait Until Element Is Visible    ${navigate_back}    timeout=30
    Click Element    ${navigate_back}
    Wait Until Element Is Visible    ${navigate_back}    timeout=30
    Click Element    ${navigate_back}

Verify Admin Can Demote Participant
    Wait Until Element Is Visible    ${moderator_button}    timeout=30
    Click Element    ${moderator_button}
    sleep    3
    Wait Until Element Is Visible    ${group_username1}    timeout=30
    Click Element    ${group_username1}
    Wait Until Element Is Visible    ${yes_button}    timeout=30
    Click Element    ${yes_button}
    Page Should Not Contain Element    ${group_member}

Search Group Name
    [Arguments]    ${name}
    wait until element is visible    ${search_button_field}    timeout=30
    input text    ${search_button_field}    ${name}
    wait until element is visible    ${fan_chat_search_button}    timeout=30
    click element    ${fan_chat_search_button}

Verify Search Functionality Of Comet Chat
    [Arguments]    ${name}
    ${element_count}    get matching xpath count    ${group_list_section}
    IF    ${element_count}==0
        log to console    NO Club Found
        Log    No Club Found
    ELSE
        sleep    5
        FOR    ${i}    IN RANGE    1    ${element_count}+1
            ${index}    Convert To String    ${i}
            ${group_name_xpath}    Replace String    ${group_name}    replace_index    ${index}
            Log    ${group_name_xpath}
            ${group_name_text}    get text    xpath=${group_name_xpath}
            should contain    ${group_name_text}    ${name}
        END
    END

Verify User Can React On The Last Message
    [Arguments]    ${count}
    ${last_msg}    Replace String    ${latest_sent_message}    index    ${count}
    wait until element is visible    xpath=${last_msg}    timeout=30
    Single Finger Tap    xpath=${last_msg}
    wait until element is visible    ${laughing_emoji}
    click element    ${laughing_emoji}
    Wait Until Element Is Visible    ${message_react_button}    timeout=30

Verify User Can Reply Last Message With Comment
    [Arguments]    ${count}    ${comment}
    ${last_msg}    Replace String    ${latest_sent_message}    index    ${count}
    wait until element is visible    xpath=${last_msg}    timeout=30
    Single Finger Tap    xpath=${last_msg}
    wait until element is visible    ${reply_message_id}    timeout=30
    click element    ${reply_message_id}
    wait until element is visible    ${write_msg_text}    timeout=30
    input text    ${write_msg_text}    ${comment}
    click element    ${send_button}
    ${latest_time}    Get Current Time
    ${latest_time_xpath}    Replace String    ${latest_message_time}    latest_time    ${latest_time}
    Wait Until Element Is Visible    ${latest_time_xpath}    timeout=30

Verify Sent Message
    [Arguments]    ${expected_message}
    wait until element is visible    ${message_sent}    timeout=30
    ${actual_message}    get text    xpath=${message_sent}
    Should Contain    ${actual_message}    ${expected_message}
