*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${URL}    https://mobileworld.phanminhhung.id.vn/
${BROWSER}    Chrome
${USERNAME}    Nga
${EMAIL_USER}    nga_2051220091@dau.edu.vn
${PASSWORD}    123456789
${CONFIRM_PASSWORD}    123456789
${PASSWORD_MISMATCH}    1234567890
${WEAK_PASSWOORD}    12345
${WEAK_CFR_PASSWORD}    12345
${REGISTER_BUTTON}    //*[@id="main"]/div/div[2]/div/div/div/div/form
${EMPTY_STRING}
${ERROR_MESSAGE_LOCATOR_USERNAME}    //*[@id="main"]/div/div[2]/div/div/div/div/form/fieldset[2]/span
${ERROR_MESSAGE_LOCATOR_EMAIL}    //*[@id="main"]/div/div[2]/div/div/div/div/form/fieldset[3]/span
${ERROR_MESSAGE_LOCATOR_PASSWORD}    //*[@id="main"]/div/div[2]/div/div/div/div/form/fieldset[4]/span
${ERROR_MESSAGE_LOCATOR_CFR_PASSWORD}    //*[@id="main"]/div/div[2]/div/div/div/div/form/fieldset[5]/span
${ERROR_MESSAGE_LOCATOR_MISMATCH_PASSWORD}    //*[@id="main"]/div/div[2]/div/div/div/div/form/fieldset[5]/span
${ERROR_MESSAGE_LOCATOR_WEAK_PASSWORD}    //*[@id="main"]/div/div[2]/div/div/div/div/form/fieldset[4]/span
${EMPTY_USERNAME_ERROR_MESSAGE}    Vui lòng nhập họ tên.
${EMPTY_EMAIL_ERROR_MESSAGE}    Vui lòng nhập địa chỉ email.
${EMPTY_PASSWORD_ERROR_MESSAGE}    Vui lòng nhập mật khẩu.
${EMPTY_CFR_PASSWORD_ERROR_MESSAGE}    Vui lòng nhập mật khẩu xác nhận.
${INVALID_PASSWORD_MISSMATCH}    Mật khẩu xác nhận không khớp.
${INVALID_WEAK_PASSWORD}    Mật khẩu phải chứa ít nhất 8 ký tự.  



*** Keywords ***
Open Browser To Registration Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    //*[@id="header"]/div/div/div[1]/div/div[2]/ul/li[3]/a
    Wait Until Element Is Visible    //*[@id="frm-reg-lname"]    timeout=10s

Test Set Up Serialize
    Input Text    //*[@id="frm-reg-lname"]    ${USERNAME}
    Input Text    //*[@id="frm-reg-email"]    ${EMAIL_USER}
    Input Text    //*[@id="frm-reg-pass"]    ${PASSWORD}
    Input Text    //*[@id="frm-reg-cfpass"]    ${CONFIRM_PASSWORD}
    Log    Setting up test case
    
Input Registration Details
    [Arguments]    ${username}    ${email}    ${password}    ${confirms_password}
    Input Text    //*[@id="frm-reg-lname"]    ${username}
    Input Text    //*[@id="frm-reg-email"]    ${email}
    Input Text    //*[@id="frm-reg-pass"]    ${password}
    Input Text    //*[@id="frm-reg-cfpass"]    ${confirms_password}

Wait For Error Message
    [Arguments]    ${locator}    ${expected_message}
    Wait Until Element Is Visible    ${locator}    timeout=10s
    ${actual_message}=    Get Text    ${locator}
    Should Be Equal As Strings    ${actual_message}    ${expected_message}

Submit Register
    Submit Form    ${REGISTER_BUTTON}


