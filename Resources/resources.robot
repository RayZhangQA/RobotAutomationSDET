*** Settings ***
Library    SeleniumLibrary    

*** Keywords ***
LaunchBrowser
    [Arguments]     ${appUrl}    ${appBrowser}
    Open Browser    ${appUrl}    ${appBrowser}
    Maximize Browser Window
    Set Selenium Implicit Wait    5  

    ${Title}    Get Title
    [Return]    ${Title}
    
ExitAllBrowsers
    Sleep    5
    Close All Browsers