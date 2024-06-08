*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Url}          https://google.pl
${browser}      Chrome
${agreeBtn}     id=L2AGLb
${searchBtn}    name=btnK
${textArea}     class=gLFyf

*** Test Cases ***
Valid Login
    Open Browser To Search Page
    Click on the agree
    Search for item     kosiarka
    Click on Search
    [Teardown]      Close browser

*** Keywords ***
Open Browser To Search Page
    Open browser    ${Url}   ${browser}
    Maximize browser window
    Sleep    5
    Title should be    Google

Click on the agree
    Click button    ${agreeBtn}
    Page should contain button    ${searchBtn}

Search for item
    [Arguments]     ${BrowsingPhrase}
    Input text      ${textArea}     ${BrowsingPhrase}

Click on Search
    Click button    ${searchBtn}
    Sleep           5



