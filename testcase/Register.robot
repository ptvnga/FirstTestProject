*** Settings ***
Library    SeleniumLibrary
Resource          ../resource/RG.resource
Suite Setup    Open Browser To Registration Page
Test Setup    Test Set Up Serialize
Test Teardown    Sleep    3s
Suite Teardown    Close All Browsers

*** Test Cases ***
Valid Registration
    [Documentation]    Test valid registration
    Input Registration Details    ${USERNAME}    ${EMAIL_USER}    ${PASSWORD}    ${CONFIRM_PASSWORD}
    Submit Register
    Sleep    2s

Empty Username
    [Documentation]    Test registration with empty username
    Input Registration Details    ${EMPTY_STRING}    ${EMAIL_USER}    ${PASSWORD}    ${CONFIRM_PASSWORD}
    Submit Register
    Wait For Error Message    ${ERROR_MESSAGE_LOCATOR_USERNAME}    ${EMPTY_USERNAME_ERROR_MESSAGE}
    Sleep    2s

Empty Email
    [Documentation]    Test registration with empty email
    Input Registration Details    ${USERNAME}    ${EMPTY_STRING}    ${PASSWORD}    ${CONFIRM_PASSWORD}
    Submit Register
    Wait For Error Message    ${ERROR_MESSAGE_LOCATOR_EMAIL}    ${EMPTY_EMAIL_ERROR_MESSAGE}
    Sleep    2s

Empty Password
    [Documentation]    Test registration with empty password
    Input Registration Details    ${USERNAME}    ${EMAIL_USER}    ${EMPTY_STRING}    ${CONFIRM_PASSWORD}
    Submit Register
    Wait For Error Message    ${ERROR_MESSAGE_LOCATOR_PASSWORD}    ${EMPTY_PASSWORD_ERROR_MESSAGE}
    Sleep    2s


Empty Confirm Password
    [Documentation]    Test registration with empty confirm password
    Input Registration Details    ${USERNAME}    ${EMAIL_USER}    ${PASSWORD}    ${EMPTY_STRING}
    Submit Register
    Wait For Error Message    ${ERROR_MESSAGE_LOCATOR_CFR_PASSWORD}    ${EMPTY_CFR_PASSWORD_ERROR_MESSAGE}
    Sleep    2s

Password Missmatch
    [Documentation]    Test registration fails when the password and password confirm do not match
    Input Registration Details    ${USERNAME}    ${EMAIL_USER}    ${PASSWORD}    ${PASSWORD_MISMATCH}
    Submit Register
    Wait For Error Message    ${ERROR_MESSAGE_LOCATOR_MISMATCH_PASSWORD}    ${INVALID_PASSWORD_MISSMATCH}
    Sleep    2s

Password Weak
    [Documentation]    Test registration fails when the password is not strong enough
    Input Registration Details    ${USERNAME}    ${EMAIL_USER}    ${WEAK_PASSWOORD}    ${WEAK_CFR_PASSWORD}
    Submit Register
    Wait For Error Message    ${ERROR_MESSAGE_LOCATOR_WEAK_PASSWORD}    ${INVALID_WEAK_PASSWORD}
    Sleep    2s