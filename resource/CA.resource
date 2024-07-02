*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${URL}    https://mobileworld.phanminhhung.id.vn/
${BROWSER}    Chrome
${USERNAME}    vietnga4702@gmail.com
${PASSWORD}    123456789
${LOGIN_BUTTON}    //*[@id="main"]/div/div[2]/div/div/div/div/form/button[1]
${LOGOUT_BUTTON}    //*[@id="header"]/div/div/div[1]/div/div[2]/ul/li[2]/ul/li[3]
${ADD_BUTTON}    //*[@id="main"]/div/div[3]/div[1]/div/div[2]/div[7]/button

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


Login To Website
    Input Text    //*[@id="frm-login-uname"]    ${USERNAME}
    Input Text    //*[@id="frm-login-pass"]    ${PASSWORD}
    Click Button    ${LOGIN_BUTTON}

Log Out To Website
    Mouse Over    //*[@id="header"]/div/div/div[1]/div/div[2]/ul/li[2]
    Element Should Be Visible    //*[@id="header"]/div/div/div[1]/div/div[2]/ul/li[2]/ul
    Click Element    ${LOGOUT_BUTTON}
    Sleep    2s


Add Product To Cart 
    Click Button    ${ADD_BUTTON}
    Wait Until Element Is Visible    //*[@id="main"]/div/div[2]/div[1]



    