*** Settings ***
Library    SeleniumLibrary 
Resource   ../resources/login_resources.robot
Library    DataDriver    ../testData/LoginData.csv

Suite Setup       Open my Browser
Suite Teardown    Close Browsers 
Test Template     Invalid Login 

*** Test Cases ***    userName        passWord
LoginTestWithExcel    ${userName} and  ${passWord}

*** Keywords ***
Invalid Login
    [Arguments]    ${userName}    ${passWord}
    Input userName    ${userName}
    Input passWord    ${passWord}
    Click loginButton
    Error Message Should Be Visible