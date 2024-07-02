*** Settings ***
Library    SeleniumLibrary
Resource          ../resource/LG.resource
Suite Setup    Open Browser To Login Page
Test Setup    Test Set Up Serialize 
Test Teardown    Sleep    3s
Suite Teardown    Close All Browsers


*** Test Cases ***
Valid Login
    [Documentation]    Test valid login
    Input Username And Password    ${USERNAME}    ${PASSWORD}
    Submit Login
    Sleep    5s
    Submit Logout


Empty Username 
    [Documentation]    Test empty username
    Input Username And Password    ${EMPTY_STRING}    ${PASSWORD}
    Submit Login
    Wait For Error Message    ${ERROR_MESSAGE_LOCATOR_USERNAME}    ${EMPTY_USERNAME_ERROR_MESSAGE}
    Sleep    5s

Empty Password  
    [Documentation]    Test empty password
    Input Username And Password    ${USERNAME}    ${EMPTY_STRING}
    Submit Login
    Wait For Error Message    ${ERROR_MESSAGE_LOCATOR_PASSWORD}    ${EMPTY_PASSWORD_ERROR_MESSAGE}
    Sleep    5s

Invalid Email Format
    [Documentation]    Test invalid email Format
    Input Username And Password    ${INVALID_EMAIL}    ${PASSWORD}
    Submit Login
    Wait For Error Message    ${ERROR_MESSAGE_LOCATOR_USERNAME}    ${INVALID_EMAIL_ERROR_MESSAGE}
    Sleep    5s
    
Incorrect Password
    [Documentation]    Test login with incorrect password
    Input Username And Password    ${USERNAME}    ${WRONG_PASSWORD}
    Submit Login
    Wait For Error Message    ${ERROR_MESSAGE_LOCATOR_PASSWORD}    ${INCORRECT_PASSWORD_ERROR_MESSAGE}
    Sleep    5s

