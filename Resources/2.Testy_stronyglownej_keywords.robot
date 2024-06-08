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

CheckTheContainer
    Page should contain element    ${wholeInventory}

#Zmienna ktora potwierdza ze na stronie glownej jest dokladnie 6 produktow
Check every item in the shop
    ${id}   Get WebElements    ${inventoryItem}
    FOR     ${item}     IN    @{id}
        ${name}     Get element attribute    ${item}    innerText
        Log to console    ${name}
    END

Add every element to the basket
    ${addToBasket}     Get WebElements    ${cartButton}
    FOR    ${link}  IN    @{addToBasket}
        Click element    ${link}
    END
    Element text should be    ${cartNumber}     6

Remove from basket
    ${removeFromBasket}     Get WebElements    ${cartRemove}
    FOR    ${elem}  IN    @{removeFromBasket}
        Click element    ${elem}
    END
    Element should not be visible    ${cartNumber}

Click on every item in the shop
    # Zmienna pobierająca WebElement ${inventoryItem} została umieszczona w środku pętli
    # dlatego ze jest to element dynamiczny ktory sie zmienia co odswiezenie strony
    FOR     ${i}    IN RANGE    6
        @{elementItem}      Get WebElements    ${inventoryItem}
        Click element    ${elementItem[${i}]}
        Sleep    3
        Go back
    END








