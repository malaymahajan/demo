*** Settings ***
Library    AppiumLibrary
Library    OperatingSystem
Library    Collections
Library    String
Library    ../../../../CommonBase/Utilities/user_keywords.py

*** Variables ***
${deviceName}    devicename
${platformVersion}    platformversion
${app}    app
${username}    username
${accesskey}    accesskey
${appium_server}    ${EMPTY}

*** Keywords ***
Open Application On Real Device
    [Arguments]    ${env_data}
    open application      ${env_data.host}    platformName=${env_data.platformName}   deviceName=${env_data.deviceName}   bundleId=${env_data.bundleId}    autoGrantPermissions=true    automationName=${env_data.automationName}    noReset=false     udid=${env_data.udid}    platformVersion=${env_data.platformVersion}    autoAcceptAlerts=true

Open New Application On Real Device
    [Arguments]    ${env_data}
    open application      ${env_data.host}    platformName=${env_data.platformName}   deviceName=${env_data.deviceName}   app=${env_data.ipa_file}    autoGrantPermissions=true    automationName=${env_data.automationName}    noReset=false     udid=${env_data.udid}    platformVersion=${env_data.platformVersion}    autoAcceptAlerts=true

Open Application On Lamda Test
    open application
        ...    ${appium_server}
        ...    deviceName=${deviceName}
        ...    platformVersion=${platformVersion}
        ...    platformName= iOS
        ...    isRealMobile=true
        ...    app=${app}
        ...    name=IOS
        ...    automationName= XCUITest
        ...    appProfiling=true
        ...    network=true

Accept All App Permissions
    FOR    ${i}    IN RANGE    1    5
        ${status}  Run Keyword And Return Status  Wait Until Page Contains Element    accessibility_id=Allow    timeout=10
        IF    ${status}
             Click Element    accessibility_id=Allow
        ELSE
            exit for loop
        END
    END


Wait for 5 seconds
    sleep    5s

Open IOS Notifications
    sleep    1
    Swipe    ${35}    ${0}    ${28}    ${650}
    sleep    1

Wait And Click On Element
    [Arguments]    ${element}
    wait until page contains element    ${element}    timeout=30
    click element    ${element}

Verify Element Is Visible
    [Arguments]    ${element}
    wait until page contains element    ${element}     timeout=30

Verify Checkbox Is Unchecked
    [Arguments]    ${checkbox}
    wait until page contains element    ${checkbox}
    ${value}    get element attribute    ${checkbox}    value
    should be equal    ${value}     ${None}

Verify Button Is Disabled
    [Arguments]    ${button}
    wait until page contains element    ${button}
    ${enabled}    get element attribute     ${button}    enabled
    log to console    ${enabled}
    should be equal    ${enabled}    false

Verify Button Is Enabled
    [Arguments]    ${button}
    wait until page contains element    ${button}
    ${enabled}    get element attribute     ${button}    enabled
    log to console    ${enabled}
    should be equal    ${enabled}    true


Swipe Up Until Element Is Visible
    [Arguments]    ${element}
    FOR  ${count}  IN RANGE    0    15
        ${status}    run keyword and return status    wait until element is visible   ${element}
        IF    ${status}
            exit for loop
        END
        Swipe    ${191}    ${665}    ${194}    ${277}
    END

Swipe down Until Element Is Visible
    [Arguments]    ${element}
    FOR  ${count}  IN RANGE    0    15
        ${status}    run keyword and return status    wait until element is visible   ${element}
        IF    ${status}
            exit for loop
        END
        Swipe    ${191}    ${185}    ${186}    ${716}
    END

