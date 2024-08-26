*** Settings ***
Library  SeleniumLibrary
Library  Pdf2TextLibrary
Library  ../../../../CommonBase/Utilities/user_keywords.py
Variables  ../../PageObjects/Membership/post_payment_locators.py
Resource   ../../Resources/Membership/membership_page_navigation.robot

*** Variables ***
${DOWNLOADS_DIR}        C:\\Users\\Samraddhi\\Desktop\\IQA-63\\wm-si-qa-automation\\Downloads\\Files
${screenshot_path}      C:\\Users\\Samraddhi\\Desktop\\IQA-63\\log
${testdata}             ${CURDIR}${/}..${/}..${/}TestData${/}NewUserMultiple_membership_testdata.xlsx

*** Keywords ***
Homescreen Is Dispalyed
    [Documentation]     User should redirect to Homescreen.
    Wait Until Page Contains Element    ${RR_logo}     30s
    Page Should Contain Element    ${RR_logo}

Verify Text In Latest PDF
    [Documentation]    Verify that specific text exists in the latest PDF file downloaded in the default directory
    [Arguments]     ${text}     ${texttwo}
    Sleep    10
    ${latest_pdf}=    Get Latest Pdf    ${DOWNLOADS_DIR}
    ${pdf_text}=    Convert Pdf To Txt    ${latest_pdf}
    Log    ${pdf_text}
    Should Contain    ${pdf_text}    ${text}    ${texttwo}

Verify Invoice Creation Of Payment Page
    [Documentation]         Verify Invoice Creation Of Payment Page
    Mouse Over    ${make_payment}
    Click Element    ${make_payment}
    Wait Until Page Contains Element    ${send_response}    timeout=20s
    Click Element    ${send_response}

Verify Text In Latest Image
    [Documentation]    Verify that specific text exists in the latest PDF file downloaded in the default directory
    [Arguments]     ${text}
    Wait For Five Seconds
    Capture Page Screenshot
    ${latest_image}=    Get Latest Image    ${screenshot_path}
    Wait For Five Seconds
    ${img_text}=    Get Text From Image     ${latest_image}
    Log    ${img_text}
    ${textofimage}      Convert To String    ${img_text}
    Should Contain  ${textofimage}   ${text}

Verify And Click On Download Receipt Button
    [Documentation]     Download latest pdf file
    Sleep    10
    Wait Until Element Is Visible    ${download_recipt}     timeout=30
    Click Element    ${download_recipt}
    Sleep    5
    Wait Until Element Is Visible    ${download_recipt}     timeout=30
    Press Keys  ${download_recipt}      ENTER
    Click Element    ${download_recipt}



