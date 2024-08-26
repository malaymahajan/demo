*** Settings ***
Library      SeleniumLibrary
Library    OperatingSystem
Resource    ../../Resources/Login/login_keywords.robot
Resource    ../../../../CommonBase/Web/Resources/Web_Common_Keywords.robot
Library    ../../../../CommonBase/Utilities/user_keywords.py
Variables   ../../PageObjects/Menu/Menu_locators.py
Variables   ../../PageObjects/Royals Rajasthan Foundation/Royals_rajasthan_foundation_locators.py

*** Variables ***
${custom_amount}    700
${pan_number}   ABCTY1234D
${address}      baner,pune
*** Keywords ***
Verify Fields Are Autofilled
    Verify Fields Are Autofields In Donation Form    ${firstname_donation}
    Verify Fields Are Autofields In Donation Form    ${lastname_doantion}
    Verify Fields Are Autofields In Donation Form    ${email_donation}
    Verify Fields Are Autofields In Donation Form    ${mobile_number_donation}
    Verify Fields Are Autofields In Donation Form    ${dateofbirth_donation}
    Verify Fields Are Autofields In Donation Form    ${country_donation}
    Verify Fields Are Autofields In Donation Form    ${city_donation}

Verify Fields Are Autofields In Donation Form
    [Arguments]     ${input_fields_xpath}
    Wait Until Element Is Visible    ${input_fields_xpath}  timeout=20s
    ${value}    Get Value    ${input_fields_xpath}
    IF    '${value}' != ''
         Log    Field is autofilled
    END

Verify Mandatory Fields For Donation Form
    Wait Until Element Is Visible    ${foundation_error}    timeout=10s
    Wait Until Element Is Visible    ${pan_number_error}    timeout=10
    Wait Until Element Is Visible    ${address_error}   timeout=10

Enter Mandatory Field In Donation Form
    Wait Until Element Is Visible    ${state_donation}  timeout=10s
    Select From List By Label   ${state_donation}  Maharashtra
    Select From List By Label    ${foundation}      General
     Sleep    5s
    Wait Until Element Is Visible    ${pan_donation}    timeout=20s
    Element Should Be Enabled    ${pan_donation}
    Click Element    ${pan_donation}
    Sleep    2s
    Input Text    ${pan_donation}    ${pan_number}
#    Run Keyword And Ignore Error  Execute JavaScript  document.querySelector('input[id="panNumber"]').value = 'ABCTY1234D'
    Sleep    5s
    Wait Until Element Is Visible    ${address_donation}    timeout=20
    Element Should Be Enabled    ${address_donation}
    Click Element    ${address_donation}
    Sleep    2s
    Input Text    ${address_donation}    ${address}
#    Run Keyword And Ignore Error  Execute JavaScript  document.querySelector('textarea[name="address"]').value = 'baner'

Verify Redirection to Donation Payment Page
    Scroll Element Into View    ${donate_now_button}
    Sleep    2s
    Click Element    ${donate_now_button}
    Wait Until Element Is Visible    ${doante_payment_page}  timeout=20s
    Page Should Contain Element    ${doante_payment_page}

Enter Manual Amount
    Scroll Element Into View    ${custom_amount_donation}
   Wait Until Element Is Visible    ${custom_amount_donation}   timeout=20s
   Input Text    ${custom_amount_donation}    ${custom_amount}

Check Total Amount On Payment Screen
    Wait Until Element Is Visible    ${total_amount}    timeout=20s
    ${value}    Get Text    ${total_amount}
    ${value1}   Split String    ${value}     ${SPACE}
    ${float_value}  Evaluate   ${value1}[1]
    ${value2}   Convert To Integer    ${float_value}
    Should Be Equal As Strings  ${custom_amount}    ${value2}

Verify Order Amount Is Equal To Enter Amount On Donation Form
    Wait Until Element Is Visible    ${order_amount}   timeout=20s
    ${value}    Get Text    ${order_amount}
    ${float_value}  Evaluate   ${value}
    ${value2}   Convert To Integer    ${float_value}
    Should Be Equal As Strings  ${custom_amount}    ${value2}


Make Donation payment
    Wait Until Element Is Visible    ${bank_loc}    timeout=20s
    Mouse Over    ${bank_loc}
    Click Element    ${bank_loc}
    Mouse Over    ${net_bank_dropdown}
    Click Element    ${net_bank_dropdown}
    Click Element    ${bank_name}

Verify Sucessful Payment For Donation
    Wait Until Element Is Visible    ${make_payment}    timeout=20s
    Click Element    ${make_payment}
    Wait Until Element Is Visible    ${send_response}   timeout=20s
    Sleep    2s
    Click Element    ${send_response}
    Wait Until Element Is Visible    ${success_message}     timeout=20s

Verify pdf Is Downloaded
    [Arguments]     ${pdf_field}
    ${now}  Get Time  epoch
    Sleep    2
    ${res}  Check Download And Return Filepath   ${now}
    Log    ${res}
    Should Contain    ${res}    .pdf
    File Should Exist    ${res}
    ${details}=    Extract PDF Details    ${res}
    Log    ${details['text']}
#     Extract Field    ${details['text']}    ${pdf_field}
    ${pdf_field_value}=    Verify Fields In PDF    ${details['text']}    ${pdf_field}
    Log    ${pdf_field_value}
z

Verify Fields In PDF
     [Arguments]  ${text}   ${pdf_field}
    ${field_value}=    Evaluate    extract_field(text, field_name)    text=${text}    field_name=${pdf_field}
    [Return]    ${field_value}
