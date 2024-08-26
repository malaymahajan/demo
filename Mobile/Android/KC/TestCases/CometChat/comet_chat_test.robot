*** Settings ***
Library             AppiumLibrary
Resource            ../../Resources/Login/login_keywords.robot
Resource            ../../Resources/CometChat/comet_chat_keywords.robot
Variables           ../../PageObjects/Login/login_locators.py

Test Setup          Open Kc App
Test Teardown       Close Application


*** Variables ***
${screenshot_actual_dir}    ${CURDIR}${/}..${/}..${/}..${/}..${/}..${/}Runners/Reports/Screenshots/actual_screenshots
${registered_user_data}     ${CURDIR}${/}..${/}..${/}TestData${/}already_registered_user_data.xlsx
${new_user_td}              ${CURDIR}${/}..${/}..${/}TestData${/}new_user_data.xlsx
${testdata}                 ${CURDIR}${/}..${/}..${/}TestData${/}comet_chat_data_new.xlsx
${group_count}      3

*** Test Cases ***
TC-58 Verify registered user can join N number of clubs in the given club list
    set library search order    AppiumLibrary    SeleniumLibrary
    &{data}    fetch data by id    ${registered_user_data}    1
    Verify Login Screen
    Enter Mobile Number    ${data}
    Click On Request Otp Button
    Enter Otp In Otp Fields    ${data}
    Check Complete Profile PopUP
    Click On Skip Button If Visible
    Click On Fan Chat Button
    Join N Fan Chat Groups    ${group_count}

TC-59 Verify only moderator, admin can send the photos/videos, create the poll, pin the message
    set library search order    AppiumLibrary    SeleniumLibrary
    &{data}    fetch data by id    ${testdata}    2
    Verify Login Screen
    Enter Mobile Number    ${data}
    Click On Request Otp Button
    Enter Otp In Otp Fields    ${data}
    Check Complete Profile PopUP
    Click On Skip Button If Visible
    Click On Fan Chat Button
    Click On Joined Button
    Verify Admin | Moderator Can Send Photo | Video In Group
    ${count}    get matching xpath count    ${message_list}
    Verify Admin | Moderator Can Create Poll In Group    ${data}
    Verify Admin | Moderator Can Pin Message    ${count}

TC-60 Verify any members can send gif file
    [Tags]    cometchat
    set library search order    AppiumLibrary    SeleniumLibrary
    &{data}    fetch data by id    ${testdata}    1
    Verify Login Screen
    Enter Mobile Number    ${data}
    Click On Request Otp Button
    Enter Otp In Otp Fields    ${data}
    Check Complete Profile PopUP
    Click On Skip Button If Visible
    Click On Fan Chat Button
    Join A Group If Not Joined Any And Open Chat
    Send GIF In Group Chat

TC-62 Verify any member can leave the group
    [Tags]    cometchat
    set library search order    AppiumLibrary    SeleniumLibrary
    &{data}    fetch data by id    ${testdata}    6
    Verify Login Screen
    Enter Mobile Number    ${data}
    Click On Request Otp Button
    Enter Otp In Otp Fields    ${data}
    Check Complete Profile PopUP
    Click On Skip Button If Visible
    Click On Fan Chat Button
    Join A Group If Not Joined Any And Open Chat
    Leave Fan Chat Group

TC-64 Verify only admin can promote demote participant, moderator and admin
    set library search order    AppiumLibrary    SeleniumLibrary
    &{data}    fetch data by id    ${testdata}    2
    Verify Login Screen
    Enter Mobile Number    ${data}
    Click On Request Otp Button
    Enter Otp In Otp Fields    ${data}
    Check Complete Profile PopUP
    Click On Skip Button If Visible
    Click On Fan Chat Button
    Click On Joined Button
    Verify Admin Can Promote Participant
    Verify Admin Can Demote Participant

TC_65 Verify club search functionality
    [Tags]    cometchat
    set library search order    AppiumLibrary    SeleniumLibrary
    &{data}    fetch data by id    ${testdata}    5
    Verify Login Screen
    Enter Mobile Number    ${data}
    Click On Request Otp Button
    Enter Otp In Otp Fields    ${data}
    Check Complete Profile PopUP
    Click On Skip Button If Visible
    Click On Fan Chat Button
    Search Group Name    ${data.search_group_correct}
    sleep    2
    Verify Search Functionality Of Comet Chat    ${data.search_group_correct}
    Search Group Name    ${data.search_group_incorrect}
    sleep    2
    Verify Search Functionality Of Comet Chat    ${data.search_group_incorrect}

TC-66 Verify any member can react, in-reply message and see message information
    [Tags]    cometchat
    set library search order    AppiumLibrary    SeleniumLibrary
    &{data}    fetch data by id    ${testdata}    1
    Verify Login Screen
    Enter Mobile Number    ${data}
    Click On Request Otp Button
    Enter Otp In Otp Fields    ${data}
    Check Complete Profile PopUP
    Click On Skip Button If Visible
    Click On Fan Chat Button
    Join A Group If Not Joined Any And Open Chat
    sleep    5
    ${count}    get matching xpath count    ${sent_message}
    Verify User Can React On The Last Message    ${count}
    sleep    2
    ${count}    get matching xpath count    ${sent_message}
    Verify User Can Reply Last Message With Comment    ${count}    nice
    sleep    2
    Verify Sent Message    nice
