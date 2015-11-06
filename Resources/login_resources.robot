*** Settings ***
Library    SeleniumLibrary    

*** Variables ***
${LoginUrl}    https://admin-demo.nopcommerce.com
${Browser}    Chrome

*** Keywords ***
Open my Browser
    Open Browser    ${LoginUrl}    ${Browser}
    Maximize Browser Window
    
Close Browsers
    Close All Browsers
    
Open Login Page
    Go To    ${LoginUrl}
    
Input userName
    [Arguments]    ${userName}
    Input Text    id=Email    ${userName} 
    
Input passWord
    [Arguments]    ${passWord}
    Input Text    id=Password    ${passWord}
    
Click loginButton
    Click Element    //input[@type='submit']   
    
Click logoutLink
    Click Link    Logout
    
Error Message Should Be Visible
    Page Should Contain    Login was unsuccessful
    
Dashboard Should Be Visible
    Page Should Contain    Dashboard