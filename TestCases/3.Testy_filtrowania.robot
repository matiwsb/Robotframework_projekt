*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/3.Testy_filtrowania_keywords.robot

*** Variables ***
${Browser}      Chrome
${SiteUrl}      https://saucedemo.com
${user}         standard_user
${pwd}          secret_sauce

*** Test Cases ***
TC3.1 Filtrowanie po nazwie Z-A
    Open my Browser    ${SiteUrl}   ${Browser}
    LoginIntoSite    ${user}    ${pwd}
    Select Name Z-A
    Close all browsers

TC3.2 Filtrowanie ceny od najmniejszej do najwiekszej
    Open my Browser    ${SiteUrl}   ${Browser}
    LoginIntoSite    ${user}    ${pwd}
    Select Price low-high
    Close all browsers

TC3.3 Filtrowanie ceny od najwiekszej do najmniejszej
    Open my Browser    ${SiteUrl}   ${Browser}
    LoginIntoSite    ${user}    ${pwd}
    Select price high-low
    Close all browsers

TC3.4 Filtrowanie po nazwie A-Z
    Open my Browser    ${SiteUrl}   ${Browser}
    LoginIntoSite    ${user}    ${pwd}
    Select name A-Z
    Close all browsers
