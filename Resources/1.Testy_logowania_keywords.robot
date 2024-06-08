*** Settings ***
Library     SeleniumLibrary
Variables    ../PageObjects/Locators.py

*** Keywords ***
Open my Browser
    [Arguments]    ${SiteUrl}  ${browser}
    Open browser    ${SiteUrl}  ${browser}
    Maximize browser window

Enter Username
    [Arguments]    ${username}
    Input text    ${loginBox}   ${username}

Enter Password
    [Arguments]    ${password}
    Input text    ${passwordBox}    ${password}

Click SignIn
    Click element    ${loginBtn}

Verify Successful Login
    Title should be    Swag Labs

Verify Fail Login
    Page should contain button    ${failBtn}

Close my Browser
    Close all browsers

Verify no username
    Element Should Contain    ${errorMsg}    Epic sadface: Username is required

Verify no password
    Element Should Contain    ${errorMsg}    Epic sadface: Password is required

