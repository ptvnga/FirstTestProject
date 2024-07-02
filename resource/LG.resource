*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://mobileworld.phanminhhung.id.vn/
${BROWSER}    Chrome
${USERNAME}    vietnga4702@gmail.com
${PASSWORD}    123456789
${INVALID_EMAIL}    vietnga4702@gmail
${WRONG_PASSWORD}    1234567890
${EMPTY_STRING}
${LOGIN_BUTTON}    //*[@id="main"]/div/div[2]/div/div/div/div/form/button[1]
${LOGOUT_BUTTON}    //*[@id="header"]/div/div/div[1]/div/div[2]/ul/li[2]/ul/li[3]
${ERROR_MESSAGE_LOCATOR_USERNAME}    //*[@id="main"]/div/div[2]/div/div/div/div/form/fieldset[2]/span
${ERROR_MESSAGE_LOCATOR_PASSWORD}    //*[@id="main"]/div/div[2]/div/div/div/div/form/fieldset[3]/span
${EMPTY_USERNAME_ERROR_MESSAGE}    Vui lòng nhập địa chỉ email.
${EMPTY_PASSWORD_ERROR_MESSAGE}    Vui lòng nhập mật khẩu.
${INVALID_EMAIL_ERROR_MESSAGE}     Địa chỉ email không hợp lệ.
${INCORRECT_PASSWORD_ERROR_MESSAGE}    Tên đăng nhập hoặc mật khẩu không đúng.

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    //*[@id="header"]/div/div/div[1]/div/div[2]/ul/li[2]
    Wait Until Element Is Visible    //*[@id="frm-login-uname"]    timeout=10s


Test Set Up Serialize
    Input Text   //*[@id="frm-login-uname"]     ${USERNAME}
    Input Text    //*[@id="frm-login-pass"]    ${PASSWORD}    
    Log    Setting up login test case

Input Username And Password
    [Arguments]    ${username}    ${password}
    
    Input Text    //*[@id="frm-login-uname"]    ${username}
    Input Text    //*[@id="frm-login-pass"]    ${password}

Submit Login
    Click Button    ${LOGIN_BUTTON}

Submit Logout
    Mouse Over    //*[@id="header"]/div/div/div[1]/div/div[2]/ul/li[2]
    Element Should Be Visible    //*[@id="header"]/div/div/div[1]/div/div[2]/ul/li[2]/ul
    Click Element    ${LOGOUT_BUTTON}
    Sleep    2s

Wait For Error Message
    [Arguments]    ${locator}    ${expected_message}
    Wait Until Element Is Visible    ${locator}    timeout=10s
    ${actual_message}=    Get Text    ${locator}
    Should Be Equal As Strings    ${actual_message}    ${expected_message}