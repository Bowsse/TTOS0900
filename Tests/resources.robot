*** Settings ***
Documentation     Variables and Keywords for Lupapiste.fi tests
Library           Selenium2Library

*** Variables ***
${SERVER}         https://www.lupapiste.fi/
${FRONTPAGE URL}    https://www.lupapiste.fi/
${BROWSER}        Firefox
${DELAY}          0.2
${PERMIT URL}    ${SERVER}luvanhakija
${BLOG URL}      ${SERVER}blogi
${CONTACT URL}    ${SERVER}ota-yhteytta
${LOGIN URL}      ${SERVER}kirjaudu
${CONTACT BUTTON}    //a[@href='/ota-yhteytta']
${SEARCH SUBMIT}    //input[@id='searchsubmit']
${LOGIN MSG}      //div[@id='login-message']

${SEARCH BUTTON}    //span[contains(.,'Haku')]
${MENU BUTTON}    //span[contains(.,'Valikko')]
${MENUBTN PERMIT}        //a[@href='https://www.lupapiste.fi/luvanhakija']
${MENUBTN BLOG}           //a[@href='https://www.lupapiste.fi/blogi']

*** Keywords ***
Open Browser To Front Page
    Open Browser    ${FRONTPAGE URL}    ${BROWSER}
    Set Selenium Speed     ${DELAY}
    Maximize Browser Window
    Front Page Should Be Open

Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Set Selenium Speed     ${DELAY}
    Maximize Browser Window
    Login Page Should Be Open

Open Contact Page
    Open Browser To Login Page
    Click Element    ${CONTACT BUTTON}
    Contact Page Should Be Open

Front Page Should Be Open
    Location Should Be    ${SERVER}

Contact Page Should Be Open
    Location Should Be    ${CONTACT URL}

Login Page Should Be Open
    Location Should Be    ${LOGIN URL}

Go To Login Page
    Go To    ${LOGIN URL}
    Location Should Be    https://www.lupapiste.fi/kirjaudu

Search For Help
    Click Element    ${SEARCH BUTTON}
    Input Text    search-field    Apua
    Click Element       ${SEARCH SUBMIT}
    Wait Until Page Contains Element    //h1[contains(.,'Hakutulos: Apua')]       timeout=10       error=None
    Location Should Be    ${SERVER}?s=Apua

Contact Message Send Should Have Failed
    Wait Until Page Contains Element    //label[@id='viesti-error']

Send Contact Message
    Click Element     //button[@id='send-yhteydenotto']

Login With Invalid Credentials Should Fail
    [Arguments]    ${username}    ${password}
    Input Text    //input[@title='Sähköposti']    ${username}
    Input Password    //input[@title='Salasana']    ${password}
    Click Element    //button[@id='login-button']
    Login Should Have Failed

Login Should Have Failed
    Element Should Be Visible    ${LOGIN MSG}
