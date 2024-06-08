*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/2.Testy_stronyglownej_keywords.robot

*** Variables ***
${Browser}      Chrome
${SiteUrl}      https://saucedemo.com
${user}         standard_user
${pwd}          secret_sauce

*** Test Cases ***
TC2.1 Wszystkie produkty sa widoczne
    Open my Browser    ${SiteUrl}   ${Browser}
    LoginIntoSite    ${user}    ${pwd}
    Check every item in the shop
    Sleep    2
    CheckTheContainer
    Close all browsers

# TestCase przeniesiony i polaczony z TC2.1
#TC2.2
#    Open my Browser    ${SiteUrl}   ${Browser}
#    LoginIntoSite    ${user}    ${pwd}
#    Check every item in the shop
#    Close all browsers

TC2.2 Dodawanie produktow do koszyka
    Open my Browser    ${SiteUrl}   ${Browser}
    LoginIntoSite    ${user}    ${pwd}
    Add every element to the basket
    Sleep   3
    Log to console    'Wszystkie przedmioty zostaly dodane do koszyka'
    Close all browsers

TC2.3 Usuwanie produktow z koszyka
    Open my Browser    ${SiteUrl}   ${Browser}
    LoginIntoSite    ${user}    ${pwd}
    Add every element to the basket
    Sleep   3
    Remove from basket
    Log to console    'Wszystkie przedmioty zostaly usuniete z koszyka'
    Close all browsers

TC2.4 Kazdy przedmiot jest mozliwy do klikniecia
    Open my Browser    ${SiteUrl}   ${Browser}
    LoginIntoSite    ${user}    ${pwd}
    Click on every item in the shop
    Sleep    3
    Close all browsers

