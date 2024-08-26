*** Settings ***
Library         AppiumLibrary
Library         XML
Library         DateTime
Variables       ../../PageObjects/Login/login_locators.py
Variables       ../../PageObjects/HomePage/homepage_locators.py
Library         ../../../../../CommonBase/Utilities/user_keywords.py
Resource        ../Notification/notification_keywords.robot
Resource        ../../Resources/Login/login_keywords.robot
Resource        ../../Resources/Login/new_user_keywords.robot
Resource        ../CometChat/comet_chat_keywords.robot
Variables       ../../PageObjects/FLRP/flrp_locators.py


*** Variables ***
${already_registered_user_td}       ${CURDIR}${/}..${/}..${/}TestData${/}already_registered_user_data.xlsx
${date_format}                      %d %B %Y | %I:%M %p


*** Keywords ***
Get Current Date Time
    ${current_datetime}=    Get Current Date    result_format=${date_format}
    ${current_datetime_lower}=    Replace AM PM    ${current_datetime}
    RETURN    ${current_datetime_lower}

Enter Referral Code
    [Arguments]    ${referral_code_data}
    Input Text    ${referral_code_field}    ${referral_code_data.refferal_code}
    Click Element    ${redeem_button}
    wait until page contains element    ${referral_code_success_toast}    timeout=10
    ${datetime1}=    Get Current Date Time
    Wait for 5 seconds
    ${datetime2}=    Get Current Date Time
    RETURN    ${datetime1}    ${datetime2}

Click On Next Button And Complete Registeration
    Swipe Down Until Element Is Visible    ${Next_button}
    Wait Until Element Is Visible    ${Next_button}    timeout=30
    Click Element    ${Next_button}
    Wait Until Element Is Visible    ${welcome_screen}    timeout=30
    Click Element    ${welcome_screen_ok_button}
    Wait Until Element Is Visible    ${faq_Page}    timeout=30
    Click Element    ${faq_Page_next_button}
    Wait Until Element Is Visible    ${congratulations_screen}    timeout=30
    Click Element    ${congratulations_screen_thnks_btn}
    Wait Until Element Is Visible    ${complete_profile_popup}    timeout=30
    Click Element    ${complete_profile_popup_okbtn}

Go To My Ledger Page
    Wait Until Element Is Visible    ${user_name}    timeout=30
    Click Element    ${user_name}
    Wait Until Element Is Visible    ${my_ledger_button}    timeout=30
    Click Element    ${my_ledger_button}
    Wait Until Element Is Visible    ${my_ledger_page_heading}    timeout=15

Verify Tokens Credited
    [Arguments]    ${datetime1}    ${datetime2}    ${activity}    ${expected_tokens}
    ${xpath1}=    Set Variable
    ...    (//android.widget.LinearLayout[@resource-id="com.knightclub.app:id/layoutActivity"])[2]//android.widget.TextView[@text="${datetime1}"]//..//android.widget.TextView[@text="${activity}"]//..//../android.view.ViewGroup[1]//android.widget.TextView[@text="${expected_tokens}"]
    log    Verifying XPath: ${xpath1}

    ${xpath2}=    Set Variable
    ...    (//android.widget.LinearLayout[@resource-id="com.knightclub.app:id/layoutActivity"])[2]//android.widget.TextView[@text="${datetime2}"]//..//android.widget.TextView[@text="${activity}"]//..//../android.view.ViewGroup[1]//android.widget.TextView[@text="${expected_tokens}"]
    log    Verifying XPath: ${xpath2}

    ${status}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=${xpath1}    timeout=30
    IF    ${status}
        Log    token generated
    ELSE
        Wait Until Element Is Visible    xpath=${xpath2}    timeout=30
    END

Verify Tokens Debited
    [Arguments]    ${datetime}    ${activity}    ${expected_tokens}
    ${xpath}=    Set Variable
    ...    (//android.widget.LinearLayout[@resource-id="com.knightclub.app:id/layoutActivity"])[2]//android.widget.TextView[@resource-id="com.knightclub.app:id/tvTimeStamp" and @text="${datetime}"]//..//..//android.widget.TextView[@resource-id="com.knightclub.app:id/tvDebt" and @text="${expected_tokens}"]
    log to console    Verifying XPath: ${xpath}
    Sleep    5
    wait until page contains element    xpath=${xpath}    timeout=60

Go To News Article Page
#    Wait Until Element Is Visible    ${menu}    timeout=15
#    Click Element    ${menu}
#    Wait Until Element Is Visible    ${menu_page}    timeout=30
    Swipe Down Until Element Is Visible    ${news_tab}
    Click Element    ${news_tab}
    Wait Until Element Is Visible    ${news_article_page}    timeout=30

Click On First News Article
    Wait Until Element Is Visible    xpath=${first_news_article}    timeout=30
    Click Element    xpath=${first_news_article}
    Wait Until Element Is Visible    xpath=${first_news_article_title}    timeout=30
    ${datetime1}=    Get Current Date Time
    Wait for 5 seconds
    ${datetime2}=    Get Current Date Time
    Click Element    ${back_button}
    Wait Until Element Is Visible    ${back_button}    timeout=30
    Click Element    ${back_button}
    Sleep    2
    RETURN    ${datetime1}    ${datetime2}

Tap On Heart Icon
    Wait Until Element Is Visible    xpath=${heart_icon}    timeout=30
    Click Element    xpath=${heart_icon}
    ${datetime1}=    Get Current Date Time
    Wait for 5 seconds
    ${datetime2}=    Get Current Date Time
    Wait Until Element Is Visible    ${back_button}    timeout=15
    Click Element    ${back_button}
    RETURN    ${datetime1}    ${datetime2}

Go To My Profile Page And Click On Redeem Your Knight Tokens
    Wait Until Element Is Visible    ${user_name}    timeout=30
    Click Element    ${user_name}
    Wait Until Element Is Visible    ${redeem_your_knight_tokens_button}    timeout=30
    Click Element    ${redeem_your_knight_tokens_button}
    Sleep    2
    Page Should Contain Element    ${terms_and_conditions_checkbox}

Redeem Available Token
    Click Element    ${terms_and_conditions_checkbox}
    Swipe    ${430}    ${1504}    ${455}    ${310}
    swipe down until element is visible  ${redeem_button1}
    Click Element    ${redeem_button1}
    Wait Until Element Is Visible    ${redeem_success_tab}    timeout=30
    Sleep    2
    Page Should Contain Element    ${Redemption_success_toast}    timeout=30
    Go Back
    Go Back

Go To Fixtures Page And Click On Match Center
    Wait Until Element Is Visible    ${fixtures_link}    timeout=30
    Click Element    ${fixtures_link}
    Wait Until Element Is Visible    ${fixtures_title}    timeout=30
    Sleep    5
    Wait Until Element Is Visible    ${matchcentre_btn}    timeout=30
    Click Element    ${matchcentre_btn}
    Wait Until Element Is Visible    ${matchcenter_title}    timeout=30
    ${datetime1}=    Get Current Date Time
    Wait for 5 seconds
    ${datetime2}=    Get Current Date Time
    Wait Until Element Is Visible    ${back_button}    timeout=30
    Click Element    ${back_button}
    Go Back
    RETURN    ${datetime1}    ${datetime2}

Redeem Available Coupons
    [Arguments]    ${redeem_coupon_button}
    Page Should Contain Element    ${terms_and_conditions_checkbox}
    Click Element    ${terms_and_conditions_checkbox}
    Swipe Down Until Element Is Visible    ${redeem_coupon_button}
    Click Element    ${redeem_coupon_button}
    Wait Until Element Is Visible    ${redeem_success_tab}    timeout=30
    Sleep    2
    Page Should Contain Element    ${Redemption_success_toast}    timeout=30

Verify User Gets Coupon Code After Redeem
    ${coupen_code}=    get text    ${coupon_code_text}
    should not be empty    ${coupen_code}

Redeem Available Coupons With Maximum Amount
    Click Element    ${terms_and_conditions_checkbox}
    Swipe Down Until Element Is Visible    ${max_amount_coupon_code}
    Click Element    ${max_amount_coupon_code}

Verify User Gets Insufficient Balance Message
    Page Should Contain Element    ${insufficient_balance_toast}

Redeem Available Coupons Without Accepting Terms And Conditions
    Wait Until Element Is Visible    ${terms_and_conditions_checkbox}    timeout=30
    Swipe Down Until Element Is Visible    ${redeem_button}
    Click Element    ${redeem_button}
    Page Should Contain Element    ${check_terms_and_conditions_toast}
    Click Element    ${terms_and_conditions_checkbox}
    Swipe Down Until Element Is Visible    ${redeem_coupon_button}
    Click Element    ${redeem_coupon_button}
    Wait Until Element Is Visible    ${redeem_success_tab}    timeout=30
    Sleep    2
    Page Should Contain Element    ${Redemption_success_toast}

Try To Redeem The Available Coupon Having Coming Soon CTA
    Wait Until Element Is Visible    ${terms_and_conditions_checkbox}    timeout=30
    Click Element    ${terms_and_conditions_checkbox}
    Swipe Down Until Element Is Visible    ${coming_soon_button}
    Element Should Be Disabled    ${coming_soon_button}
