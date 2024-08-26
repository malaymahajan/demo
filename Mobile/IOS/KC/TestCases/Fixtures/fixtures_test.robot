*** Settings ***
Library   AppiumLibrary
Library    OperatingSystem
Resource    ../../Resources/Login/login_keywords.robot
Resource    ../../Resources/FLRP/flrp_keywords.robot
Resource    ../../Resources/Fixtures/fixtures_keywords.robot

Test Setup        Open KC Application
Test Teardown     Close All Applications

*** Variables ***
${testdata}    ${CURDIR}${/}..${/}..${/}TestData${/}fixtures_testdata.xlsx

*** Test Cases ***
Verify the functionality if add to calender button on homecsreen fixtures widget
    &{data}    fetch data by id    ${testdata}    1
    Verify Login Screen
    Enter Mobile Number    ${data.mobile_number}
    Click On Request Otp Button
    Enter Otp    ${data.otp}
    Accept Login Terms And Conditions And Click On Submit Button
    Click On Skip Instructions Button If Visible
    Click On Add To Calender On Home Screen
    Verify Add To Calender Functionality    ${data.email}    ${data.password}

Verify the functionality of sync calender functuionality on webview screen
    &{data}    fetch data by id    ${testdata}    2
    Verify Login Screen
    Enter Mobile Number   ${data.mobile_number}
    Click On Request Otp Button
    Enter Otp    ${data.otp}
    Accept Login Terms And Conditions And Click On Submit Button
    Click On Skip Instructions Button If Visible
    Click On Fixtures Button
    Click On Add To Calender On Fixtures Screen
    Verify Add To Calender Functionality    ${data.email}    ${data.password}

42 Verify the functionality Apple login if add to calender button on homecsreen fixtures widget
    [Tags]    sprint-6      test:retry(2)
    &{data}    fetch data by id    ${testdata}    1
    Click And Verify Skip Login Button
    Click On Skip Instructions Button If Visible
    Click On Add To Calender On Home Screen
    Verify Add To Calender Functionality Using Apple ID    ${data.email}

43 Verify the functionality of sync calender functuionality on webview screen
    [Tags]    sprint-6      test:retry(2)
    &{data}    fetch data by id    ${testdata}    1
    Click And Verify Skip Login Button
    Click On Skip Instructions Button If Visible
    Click On Fixtures Button
    Click On Add To Calender On Fixtures Screen
    Verify Add To Calender Functionality Using Apple ID    ${data.email}