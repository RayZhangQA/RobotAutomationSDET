*** Settings ***
Library      SeleniumLibrary
Resource    ../PageObjects/Locators.robot

*** Keywords ***
Open My Browser
    [Arguments]     ${SiteUrl}    ${Browser}
    Open Browser    ${SiteUrl}    ${Browser}
    Maximize Browser Window
    
Enter UserName
    [Arguments]    ${userName}
    Input Text     ${txt_loginUserName}    ${userName}
    
Enter PassWord
    [Arguments]    ${passWord}
    Input Text     ${txt_loginPassWord}    ${passWord}
    
Click SignIn
    Click Button    ${btn_signIn}
    
Verify Successful Login
    Title Should Be    Find a Flight: Mercury Tours:
    