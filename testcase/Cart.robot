*** Settings ***
Library    SeleniumLibrary
Resource    ../resource/CA.resource
Suite Setup    Open Browser To Login Page
Suite Teardown    Close All Browsers

*** Test Cases ***
