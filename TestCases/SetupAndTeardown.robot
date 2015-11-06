*** Settings ***

Suite Setup    Log To Console    Opening Browser
Suite Teardown    Log To Console    Closing Browser

Test Setup    Log To Console    Login to Application
Test Teardown    Log To Console    Logout From Application

*** Test Cases ***
TC1 Prepaid Recharge
    Log To Console    This is Prepaid Recharge testcase
    
TC2 Postpait Recharge
    Log To Console    This is Postpaid Recharge testcase
    
TC3 Search
    Log To Console    This is Search testcase
    
TC4 Advanced Search
    Log To Console    This is Advanced Search testcase