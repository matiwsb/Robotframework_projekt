*** Settings ***
Library     SeleniumLibrary
Library     Collections
Variables    ../PageObjects/Locators.py

*** Keywords ***
Open my Browser
    [Arguments]    ${SiteUrl}  ${browser}
    Open browser    ${SiteUrl}  ${browser}
    Maximize browser window

LoginIntoSite
    [Arguments]    ${username}  ${password}
    Input text    ${loginBox}   ${username}
    Input text    ${passwordBox}   ${password}
    Click element    ${loginBtn}
    Sleep    1

Select Name Z-A
    Select from list by value    xpath=//*[@id="header_container"]/div[2]/div/span/select     za
    Sleep    3
# First item in the shop should be Test.allTheThings() T-Shirt (Red)
    Element text should be    class=inventory_item_name      Test.allTheThings() T-Shirt (Red)

Select Price low-high
    Select from list by label    xpath=//*[@id="header_container"]/div[2]/div/span/select   Price (low to high)
    Sleep   3
#First item price should be $7,99
    Element should contain    class=inventory_item_price    7.99

Select price high-low
    Select from list by index    xpath=//*[@id="header_container"]/div[2]/div/span/select   3
    Sleep   3
#First element should be $49,99
    Element should contain    class=inventory_item_price    49.99

Select name A-Z
#First we have to change the default A-Z value to another
    Select from list by value    xpath=//*[@id="header_container"]/div[2]/div/span/select     za
    Sleep    1
    Select from list by value    xpath=//*[@id="header_container"]/div[2]/div/span/select     az
    Sleep    3
#First element should be Sauce labs backpack
    Element text should be    class=inventory_item_name     Sauce Labs Backpack
