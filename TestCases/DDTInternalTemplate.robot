*** Settings ***
Library    SeleniumLibrary 
Resource    ../resources/login_resources.robot

Suite Setup       Open my Browser
Suite Teardown    Close Browsers 
Test Template     Invalid Login 

*** Test Cases ***                userName                passWord
Valid User Empty Password        admin@yourstore.com      ${EMPTY}  
Valid User Invalid Password      admin@yourstore.com      xyz    
Invalid User Valid Password      adm@yourstore.com        admin   
Invalid User Empty Password      adm@yourstore.com        ${EMPTY}  
Invalid User Invalid Password    adm@yourstore.com        xyz

*** Keywords ***
Invalid Login
    [Arguments]       ${userName}    ${passWord}
    Input userName    ${userName}
    Input passWord    ${passWord}
    Click loginButton
    Error Message Should Be Visible