*** Settings ***
Library    SeleniumLibrary
Resource          ../resource/SearchPD.resource
Suite Setup    Open Browser To Homepage
Suite Teardown    Close All Browsers

*** Test Cases ***
Valid Keywordss
    [Documentation]    Test searching for a product by keyword 
    Search For Product    iphone
    Search Button
    Wait Until Page Contains    iphone
    Sleep    5s

Invalid Keywordss
    [Documentation]    Test searching for a product by invalid keyword
    Search For Product    123
    Search Button
    Wait For Error Message    ${NO_RESULTS}    Không tìm thấy sản phẩm phù hợp!
    Sleep    5s

Emptyy Keywordss
    [Documentation]    Test searching for a product by empty keyword
    Search For Product    ${EMPTY_STRING}
    Search Button
    Wait For Error Message    ${NO_RESULTS}    Vui lòng nhập từ khóa tìm kiếm.
    Sleep    5s

Special Keywordss
    [Documentation]    Test searching for a product by special keyword
    Search For Product    @#$
    Search Button
    Wait For Error Message    ${NO_RESULTS}    Từ khóa không hợp lệ!
    Sleep    5s


Category Searchh
    [Documentation]     Test search for a product by category 
    Search For Product    iphone
    Category
    Search Button
    Wait Until Page Contains    iphone
    Sleep    5s
