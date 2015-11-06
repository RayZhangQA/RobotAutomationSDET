*** Settings ***
Library    DatabaseLibrary
Library    OperatingSystem

Suite Setup       Connect To Database  pymysql  ${DBName}  ${DBUser}  ${DBPass}  ${DBHost}  ${DBPort}  
Suite Teardown    Disconnect From Database

*** Variables ***
${DBName}    company
${DBUser}    root
${DBPass}    root
${DBHost}    localhost
${DBPort}    3306

*** Test Cases ***
Create Person Table
    ${output}    Execute SQL String    CREATE TABLE person(id integer,first_name varchar(20),last_name varchar(20));
    Log To Console     ${output}
    Should Be Equal As Strings    ${output}    None
    
Inserting Data in Person Table
    #Single Record Insertion
    #${output}    Execute SQL String    INSERT INTO person VALUE (101, "John", "Canady")
    
    #Multiple Records Insertion
    ${output}    Execute SQL Script    ./testData/company_person_insertData.sql
    Log To Console     ${output}
    Should Be Equal As Strings    ${output}    None
    
Check Record Present in DB
    Check If Exists In Database    SELECT id FROM company.person WHERE first_name="David";    
    
Check Record Not Present in DB
    Check If Not Exists In Database    SELECT id FROM company.person WHERE first_name="Jio";    
    
Check Table Exists in DB
    Table Must Exist    person    
    #Table Must Exist    personal
    
Verify Row Count is Zero
    Row Count Is 0    SELECT * FROM company.person WHERE first_name="xyz";     
    
Verify Row Count is Equal to Some Value
    Row Count Is Equal To X    SELECT * FROM company.person WHERE first_name="David";     1    
    
Verify Row Count is Greater Than Some Value
    Row Count Is Greater Than X    SELECT * FROM company.person WHERE first_name="David";    0    
    
Verify Row Count is Less Than Some Value
    Row Count Is Less Than X    SELECT * FROM company.person WHERE first_name="David";    5   
    
Update Record
    ${output}    Execute SQL Script    UPDATE company.person SET first_name="Newname" WHERE id=104;
    Log To Console     ${output}
    Should Be Equal As Strings    ${output}    None

Retrive Records From Table
    @{queryResults}    Query    SELECT * FROM company.person;
    Log To Console     Many @{queryResults}

Delete Record From Table
   ${output}    Execute SQL String    DELETE FROM company.person;
   Should Be Equal As Strings    ${output}     None    
    


      