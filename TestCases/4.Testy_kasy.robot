*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/4.Testy_kasy_keywords.robot

*** Variables ***
${Browser}      Chrome
${SiteUrl}      https://saucedemo.com
${user}         standard_user
${pwd}          secret_sauce

*** Test Cases ***
TC4.1 Uzytkownik moze przejsc do kasy
    Open my Browser    ${SiteUrl}   ${Browser}
    LoginIntoSite    ${user}    ${pwd}
    Add item to cart
    Proceed to cart
    Proceed to checkout
    Close all browsers

TC4.2 Uzytkownik nie podaje danych First Name
    Open my Browser    ${SiteUrl}   ${Browser}
    LoginIntoSite    ${user}    ${pwd}
    Add item to cart
    Proceed to cart
    Proceed to checkout
    No first name
    Close all browsers

TC4.3 Uzytkownik nie podaje danych Last Name
    Open my Browser    ${SiteUrl}   ${Browser}
    LoginIntoSite    ${user}    ${pwd}
    Add item to cart
    Proceed to cart
    Proceed to checkout
    No last name
    Close all browsers

TC4.3 Uzytkownik nie podaje danych Postal Code
    Open my Browser    ${SiteUrl}   ${Browser}
    LoginIntoSite    ${user}    ${pwd}
    Add item to cart
    Proceed to cart
    Proceed to checkout
    No post code
    Close all browsers

TC4.4 Uzytkownik moze sfinalizowac zakupy
    Open my Browser    ${SiteUrl}   ${Browser}
    LoginIntoSite    ${user}    ${pwd}
    Add item to cart
    Proceed to cart
    Proceed to checkout
    Full details
    Close all browsers

