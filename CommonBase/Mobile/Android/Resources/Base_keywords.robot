*** Settings ***
Library    AppiumLibrary
Library    OperatingSystem
Library    Collections
Library    String
Library    ../../../../CommonBase/Utilities/user_keywords.py


*** Variables ***
${LAMBDATEST_USERNAME}      suraj.warade
${LAMBDATEST_ACCESSKEY}     c5gyNDEr11w2acPLuruyQ9Su3DUz5yYeqvWs6Pq8qAK6EaZtMF
${LT_REMOTE_URL}            https://${LAMBDATEST_USERNAME}:${LAMBDATEST_ACCESSKEY}@mobile-hub.lambdatest.com/wd/hub
${PLATFORM_NAME}            android
${APP_PACKAGE}              android-lambdatest
${APP_ACTIVITY}             your.app.activity
${deviceName}               Galaxy S22 5G
${platformVersion}          14.0
${app}                      lt://APP1016061291724326875162787



*** Keywords ***
Open Application On Real Device
    [Arguments]    ${env_data}
    open application      ${env_data.host}    platformName=${env_data.platformName}   deviceName=${env_data.deviceName}   app=${env_data.application_sdk}      autoGrantPermissions=true    automationName=${env_data.automationName}    noReset=false

Open New Application On Real Device
    [Arguments]    ${env_data}
    open application      ${env_data.host}    platformName=${env_data.platformName}   deviceName=${env_data.deviceName}   app=${env_data.application_sdk}    autoGrantPermissions=true    automationName=${env_data.automationName}    noReset=false        platformVersion=${env_data.platformVersion}

Open Application On Lamda Test
    open application
        ...    ${LT_REMOTE_URL}
        ...    deviceName=${deviceName}
        ...    platformVersion=${platformVersion}
        ...    platformName=${PLATFORM_NAME}
        ...    isRealMobile=true
        ...    app=${app}
        ...    build=Android_Build_1
        ...    name=LT_Demo
        ...    automationName=UiAutomator2


Open Application On Browserstack
    [Arguments]    ${env_data}
    open application
        ...    ${env_data.browserstack_host}
        ...    deviceName=Samsung Galaxy S22 Ultra
        ...    platformVersion=${env_data.platformVersion}
        ...    platformName=${env_data.platformName}
        ...    isRealMobile=true
        ...    app=${env_data.browserstack_app_url}
        ...    name=Android
        ...    automationName=${env_data.automationName}



Wait For 2 Seconds
    sleep    2s


Wait And Click On Element
    [Arguments]    ${element}
    wait until page contains element    ${element}    timeout=10
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


Swipe Down Until Element Is Visible
    [Arguments]    ${element}
    FOR    ${count}    IN RANGE    0    20
        Swipe    ${438}    ${999}    ${438}    ${444}
        ${status}    run keyword and return status    element should be visible    ${element}
        IF    ${status}    BREAK
    END

Swipe Up Until Element Is Visible
    [Arguments]    ${element}
    FOR    ${count}    IN RANGE    0    10
        Swipe    ${718}    ${207}    ${658}    ${1507}
        ${status}    run keyword and return status    element should be visible    ${element}
        IF    ${status}    BREAK
    END

Swipe Down Until Text Is InVisible
    [Arguments]    ${element}
    FOR    ${count}    IN RANGE    0    10
        Swipe    ${438}    ${999}    ${438}    ${444}
        ${status}    run keyword and return status    Page Should Not Contain Text  ${element}
        IF    ${status}    BREAK
    END
