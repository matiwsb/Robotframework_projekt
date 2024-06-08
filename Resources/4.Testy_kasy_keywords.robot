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

# Checkout keywords
Add item to cart
    ${addToBasket}  Get WebElement    ${cartButton}
    Click element    ${addToBasket}
    Sleep    1

Proceed to cart
    ${enterCart}    Get WebElement    ${cartEnter}
    Click element    ${enterCart}
    Sleep    1

Proceed to checkout
    ${enterCheckout}    Get WebElement    ${checkout}
    Click element    ${enterCheckout}
    Sleep    1

No first name
    ${continue}   Get WebElement    ${continueButton}
    Click element    ${continue}
    Sleep   1
    Element text should be    ${error}  Error: First Name is required

No last name
    ${continue}   Get WebElement    ${continueButton}
    Input text    ${firstName}  tester
    Click element    ${continue}
    Sleep    1
    Element text should be    ${error}  Error: Last Name is required

No post code
    ${continue}   Get WebElement    ${continueButton}
    Input text    ${firstName}  tester
    Sleep    1
    Input text    ${lastName}   Kowalski
    Sleep    1
    Click element    ${continue}
    Sleep    1
    Element text should be    ${error}  Error: Postal Code is required

Full details
    ${continue}   Get WebElement    ${continueButton}
    Input text    ${firstName}  tester
    Sleep    1
    Input text    ${lastName}   Kowalski
    Sleep    1
    Input text    ${postCode}   123456
    Sleep   1
    Click element    ${continue}
    Sleep    1
    Click element    ${finishButton}
    Sleep    1
    Element text should be    ${complete}   Thank you for your order!
