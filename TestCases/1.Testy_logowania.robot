*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/1.Testy_logowania_keywords.robot

*** Variables ***
${Browser}      Chrome
${SiteUrl}      https://saucedemo.com
${user}         standard_user
${pwd}          secret_sauce
${wrongPwd}     adam1234
${wrongUser}    adam3241

*** Test Cases ***
TC1.1 Pomyslne logowanie
    Open my Browser     ${SiteUrl}  ${Browser}
    Enter Username    standard_user
    Enter Password    ${pwd}
    Click SignIn
    Sleep   3
    Verify Successful Login
    Close my Browser

TC1.2 Logowanie z bledna nazwa uzytkownika
    Open my Browser     ${SiteUrl}  ${Browser}
    Enter Username    ${user}
    Enter Password    ${wrongPwd}
    Click SignIn
    Sleep   3
    Verify Fail Login
    Close my Browser

TC1.3 Logowanie z blednym haslem
    Open my Browser     ${SiteUrl}  ${Browser}
    Enter Username    ${wrongUser}
    Enter Password    ${pwd}
    Click SignIn
    Sleep   3
    Verify Fail Login
    Close my Browser

TC1.4 Logowanie bez podania nazwy uzytkownika
    Open my Browser     ${SiteUrl}  ${Browser}
    Click SignIn
    Sleep    3
    Verify no username
    Close my Browser

TC1.5 Logowanie bez podania hasla
    Open my Browser     ${SiteUrl}  ${Browser}
    Enter Username    ${user}
    Click SignIn
    Sleep    3
    Verify no password
    Close my Browser