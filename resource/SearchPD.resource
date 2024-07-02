*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${URL}    https://mobileworld.phanminhhung.id.vn/
${BROWSER}    Chrome
${SEARCH_BOX}    //*[@id="form-search-top"]/input
${SEARCH_BTN}    //*[@id="form-search-top"]/button
${NO_RESULTS}    //*[@id="main"]/div/div[2]/div[1]/div[2]/div/ul/li/div/div[2]
${EMPTY_STRING}

*** Keywords ***
Open Browser To Homepage
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${SEARCH_BOX}
    Sleep    10s
     
Search For Product
    [Arguments]  ${keyword}
    Input Text  ${SEARCH_BOX}  ${keyword}

Search Button
    Click Button  ${SEARCH_BTN}
    Wait Until Page Contains Element  ${SEARCH_BOX}

Category  
    Click Element    //*[@id="form-search-top"]/div[2]
    Element Should Be Visible    //*[@id="form-search-top"]/div[2]/ul
    Click Element    //*[@id="form-search-top"]/div[2]/ul/li[1]

Wait For Error Message
    [Arguments]    ${locator}    ${expected_message}
    Wait Until Element Is Visible    ${locator}    timeout=10s
    ${actual_message}=    Get Text    ${locator}
    Should Be Equal As Strings    ${actual_message}    ${expected_message}

