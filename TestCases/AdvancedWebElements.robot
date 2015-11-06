*** Settings ***
Library    SeleniumLibrary 
Library    Collections

*** Variables ***
${Browser}    Chrome
${URL}        https://demo.nopcommerce.com/ 
${urlNewtours}    http://www.newtours.demoaut.com/


*** Test Cases ***
NavigationalKeywords
    Open Browser    https://www.google.com/    Chrome
    ${Location}     Get Location
    Log             The 1st Open Browser is ${Location} 
    Sleep           3
    
    Go To           https://www.bing.com/
    ${Location}     Get Location
    Log             Go To the 2nd Browser: ${Location}   
    Sleep           3 

    Go Back
    ${Location}     Get Location
    Log             Go Back to 1st Browser: ${Location}   
    Sleep           3 
    
    Close All Browsers
    
CaptureElementScreenshot
    Open Browser    https://opensource-demo.orangehrmlive.com/    Chrome
    Input Text      id = txtUsername    Admin
    Input Text      id = txtPassword     admin123
    
    Capture Element Screenshot
    ...    xpath = //div[@id='divLogo']/img    ./Screenshots/Logo.png
#    ...    C:/Users/Administrator/eclipse-workspace/RobotAutomantionSDET/screenshots/Logo.png
    Capture Page Screenshot    ./Screenshots/LoginTC.png
#    ...    C:/Users/Administrator/eclipse-workspace/RobotAutomantionSDET/screenshots/LoninTC.png
    
MouseActions
    # Right Click -- Open Context Menu
    Open Browser             http://swisnl.github.io/jQuery-contextMenu/demo.html    Chrome
    Maximize Browser Window  

    Open Context Menu        xpath = //span[text()='right click me']
    sleep                    3
    
    #Double click Action
    Go To                    https://testautomationpractice.blogspot.com/
    Maximize Browser Window
    Sleep                    2
    Double Click Element     xpath = //button[text()='Copy Text']
    Sleep                    3
    
    Go to                    http://www.dhtmlgoodies.com/scripts/drag-drop-custom/demo-drag-drop-3.html
    Maximize Browser Window
    Drag And Drop            id = box6    id = box106
    Sleep                    3

    Close All Browsers
    
UserKeywordsWithArgumentsAndReturn
    ${pageTitle}    LaunchBrowser    ${urlNewtours}    ${Browser}
    Log    The Page Title is ${pageTitle}
    Input Text    name=userName    mercury   
    Input Password    name=password    mercury  
    
ScrollingPageTest
    Open Browser    https://www.countries-ofthe-world.com/flags-of-the-world.html    Chrome
    #Maximize Browser Window
    Execute Javascript        window.scrollTo(0,2500)
    Sleep     3
    Scroll Element Into View  xpath=//td[contains(text(),'India')]
    Sleep     3
    Execute Javascript        window.scrollTo(0,document.body.scrollHeight)
    Sleep     3
    Execute Javascript        window.scrollTo(0,-document.body.scrollHeight)
    
ForLoopDemo1
    FOR    ${i}    IN RANGE    1    10
        Log    For Loop Demo1 - Print 1 to 9 in console - ${i}
    END

ForLoopDemo2
    FOR    ${i}    IN    1  2  3  4  5  4  6  8  9
        Log    For Loop Demo2 - Print the numberList in console - ${i}
    END 

ForLoopDemo3
    @{items}    Create List    1  2  3  4  7  9
    FOR    ${i}    IN    @{items}
        Log    For Loop Demo3 - Print the itemsList in console - ${i}
    END  
    
ForLoopDemo4
    FOR    ${i}    IN    john  david  smith  scott
        Log    For Loop Demo4 - Print the stringList in console - ${i}
    END
    
ForLoopDemo5
    @{namesList}    Create List    john  david  smith  scott
    FOR    ${i}    IN    @{namesList}
        Log    For Loop Demo5 - Print the variableList in console - ${i}
    END
 
ForLoopDemo6
    @{items}    Create List    1  2  3  4  5
    FOR    ${i}    IN    @{items}
        Log    For Loop Demo6 - Print the itemList in console - ${i}
        Exit For Loop If    ${i}==3
    END   

GetAllLinksTest
    Open Browser     ${urlNewtours}    ${Browser}
    ${AllLinksCount}    Get Element Count    xpath=//a
    Log    The Links in the Page are ${AllLinksCount}
    
    FOR    ${i}    IN RANGE  1    ${AllLinksCount}+1
        ${linkText}    Get Text    xpath=(//a)[${i}]
        Log To Console   ${linkText}
    END
    
TableValidationTest
    Open Browser    https://testautomationpractice.blogspot.com/    Chrome
    Maximize Browser Window 
    
    ${rows}    Get Element Count    //table[@name='BookTable']/tbody/tr
    ${cols}    Get Element Count    //table[@name='BookTable']/tbody/tr[1]/th
    Log    The Table has ${rows} rows.
    Log    The Table has ${cols} columns.
    
    ${cellData}    Get Text    //table[@name='BookTable']/tbody/tr[5]/td[1]
    Log    The text of 5th row and 1st column is "${cellData}".
    
    
    Table Should Contain           //table[@name='BookTable']    JAVA
    Table Header Should Contain    //table[@name='BookTable']    BookName    
    Table Column Should Contain    //table[@name='BookTable']    2         Author
    Table Row Should Contain       //table[@name='BookTable']    6         Master In Java
    Table Cell Should Contain      //table[@name='BookTable']    2    3    Selenium 
    
    Close Browser   
    
    

*** Keywords ***
LaunchBrowser
    [Arguments]    ${appUrl}    ${appBrowser}
    Open Browser    ${appUrl}    ${appBrowser}
    Maximize Browser Window
    ${Title}    Get Title
    [Return]    ${Title}


