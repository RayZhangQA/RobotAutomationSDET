*** Settings ***
Documentation
...    This is the Youtube Robot Framework Tutorial 
...    Practice Programming Codes Which is tought by SDET
Library    SeleniumLibrary   
Resource    ../resources/resources.robot 

*** Variables ***
${Browser}    Chrome
${URL}     https://demo.nopcommerce.com/
${URL1}    http://www.practiceselenium.com/practice-form.html
${URL2}    http://demowebshop.tricentis.com/register
${URL4}    https://testautomationpractice.blogspot.com/
${URL5}    https://seleniumhq.github.io/selenium/docs/api/java/index
${URL6}    http://demo.automationtesting.in/Windows.html
${"email_txt"}    id = Email


*** Test Cases ***
TestingInputBox
    LaunchBrowser    ${URL}    ${Browser}  
    #Maximize Browser Window
    Title Should Be    nopCommerce demo store     
    Click Element      xpath = //a[text()='Log in']   

    Wait Until Page Contains   Returning Customer    
    Element Should Be Visible    ${"email_txt"}
    Element Should Be Enabled    ${"email_txt"}
    
    Input Text    ${"email_txt"}    JohnDavid@gmail.com    
    Sleep    5
    Clear Element Text    ${"email_txt"}

    ExitAllBrowsers     

TestingRadioButtons
    LaunchBrowser    ${URL1}    ${Browser}

    #Selecting Radio Buttons
    Select Radio Button    sex    Female
    Select Radio Button    exp    5
    
    #Select Checkbox
    Select Checkbox      BlackTea
    Select Checkbox      RedTea
    Unselect Checkbox    BlackTea
    
    ExitAllBrowsers
    
TestingDropdown
    LaunchBrowser    ${URL1}    ${Browser}
    
    Select From List By Label    continents    Australia
    Select From List By Index    continents    6
    
    Select From List By label    selenium_commands    Switch Commands    
    Select From List By label    selenium_commands    WebElement Commands 
    #Select From List By Value    locator    
    
    Unselect From List By Label    selenium_commands    Switch Commands  
           
    ExitAllBrowsers 
    
TestingRegister
    Set Screenshot Directory    ../screenshots/

    LaunchBrowser    ${URL2}    ${Browser}
    Set Selenium Implicit Wait    10
    ${implicitTime}    Get Selenium Implicit Wait
    Log    The Default Implicit Wait time is ${implicitTime}   

    Set Selenium Speed    1        #Each step wait 5 seconds - causing performance issue
    ${Speed}    Get Selenium Speed
    Log To Console    ${Speed}     
  
    ${time}    Get Selenium Timeout
    Log To Console   The default Timeout is ${time}
    Set Selenium Timeout    10     #Wait 10 Seconds to Fail the test  
    Wait Until Page Contains    Register    
    
    Select Radio Button    Gender    M
    Input Text      name = FirstName          David
    Input Text      name = LastName           John    
    Input Text      name = Email              anhc@gmail.com     
    Input Text      name = Password           davidjohn
    Input Text      name = ConfirmPassword    davidjohn       
    Click Button    name = register-button    

    ExitAllBrowsers
    
OpenMultipleBrowsers
    LaunchBrowser    ${URL}     ${Browser}
    
    LaunchBrowser    ${URL1}    ${Browser}
    
    #Close Browser
    Close All Browsers
    
HandlingAlerts
    LaunchBrowser    ${URL4}    ${Browser}
    #Click Element    xpath = //*[@id="HTML9"]/div[1]/button 
    Click Button    Click Me    #Open Alert
    Sleep    3
    Alert Should Be Present    Press a button!  
    #Alert Should Not Be Present    Press a button!  
    
    Handle Alert    ACCEPT   
    #Handle Alert    Dismiss   
    #Handle Alert    Leave
    
    ExitAllBrowsers
    
HandlingFrames
    LaunchBrowser    ${URL5}    ${Browser}
    
    Select Frame    packageListFrame    #locator can be id, name or xpath
    Click Link      org.openqa.selenium
    Unselect Frame
    Sleep    3    

    Select Frame     packageFrame
    Click Link       WebDriver
    Unselect Frame
    Sleep    3
    
    Select Frame    classFrame
    Click Link      Help
    Unselect Frame
    Sleep    3
    
    ExitAllBrowsers
    
SwitchingTabbedWindows
    LaunchBrowser    ${URL6}    ${Browser}
    Click Button        click    
    Select Window       title = Sakinalium | Home
    Sleep    2
    Click Element    xpath = //body/div/header/div/div/div/ul/li[4]/a    
    
    Sleep    5
    ExitAllBrowsers
    
SwitchingMultipleBrowsers
    Open Browser    https://www.google.com    ${Browser}
    Maximize Browser Window
    Sleep    3
    
    Go to    https://www.bing.com
    Maximize Browser Window
    Sleep    3
    
    Switch Browser    1
    ${Title1}    Get Title
    Log    The first Browser is ${Title1}
    Sleep    3
    
    Switch Browser    2
    ${Title2}    Get Title
    Log    The second Browser is ${Title2}
    Sleep    3
    
    ExitAllBrowsers
    
NavigationalKeywords
    Open Browser    https://www.google.com    ${Browser}
    ${loc}    Get Location
    Log To Console    ${loc}  
    
    Go to    https://www.bing.com
    ${loc}    Get Location
    Log To Console    ${loc}  
    
    Go Back
    ${loc}    Get Location
    Log To Console    ${loc}  

     
  
    


