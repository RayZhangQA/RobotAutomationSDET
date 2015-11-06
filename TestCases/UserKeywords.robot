*** Settings ***
Library    SeleniumLibrary 
Resource    ../resources/resources.robot

*** Variables ***
${Browser}    Chrome
${URL}   http://www.newtours.demoaut.com/ 


*** Test Cases ***
TC1
    ${PageTitle}    LaunchBrowser    ${URL}    ${Browser}
    Log to console     ${PageTitle}
    Input Text    name = userName    mercury    
    Input Text    name = password    mercury
    Click Element    name = login        

*** Keywords ***
