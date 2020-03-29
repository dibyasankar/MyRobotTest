*** Settings ***
Library    SeleniumLibrary   
Test Setup  OpenAPPBrowser    ${LOGIN URL}    ${BROWSER} 
Test Teardown    Close Browser
Default Tags    Sanity Test

*** Variables ***
${LOGIN URL}  https://qa-platform.dovertech.co.in/
${BROWSER}    chrome 
${USERNAME}   admin
${PASSWORD}   D@ver_321

*** Test Cases ***
PlatformLogin
    # Verify Login functionality for Platfrom Allplication
    # Author:Dibysankar Sendha
    [Documentation]    This testcase is to verify the login functionality of Platform application
    ...    Here Tag(s) referrring to the Jira ID.
    [Tags]    DDIP-2345
    LoginToApplication    ${USERNAME}    ${PASSWORD}
    Set Browser Implicit Wait    5 
    VerifyLoginSuccessFul
    
*** Keywords ***
OpenAPPBrowser
    [Arguments]    ${LOGIN URL}    ${BROWSER} 
    [Documentation]    This keyword can be used for Opening the browser
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Browser Implicit Wait    5
LoginToApplication    
   [Arguments]  ${USERNAME}   ${PASSWORD} 
   [Documentation]    This keyword can be used for Login Application
    Click Element    name=login 
    Sleep    2    
    Input Text       name=login            ${USERNAME}
    Click Element    name=passwd
    Sleep    2  
    Input Text    name=passwd    ${PASSWORD}     
    Click Button    id=cred_sign_in_button  
        
VerifyLoginSuccessFul
    [Documentation]    This Keyword can be used for verifying Login successful or not
    Element Should Be Visible    //a[contains(@class,'uName')] 
    Sleep    3
    ${Profile_username} =  Get Text  //a[contains(@class,'uName')]
    Log   ${Profile_username}
    Should Be Equal As Strings    ${Profile_username}    ${USERNAME}  ignore_case=True 