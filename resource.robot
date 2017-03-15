*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library

*** Variables ***
${SERVER}         https://www.lupapiste.fi/
${FRONTPAGE URL}     https://www.lupapiste.fi/
${BROWSER}        Firefox
${DELAY}          0
${LUVANHAKIJA URL}    http://${SERVER}/luvanhakija
${CONTACT URL}      http://${SERVER}/ota-yhteytta
${LOGIN URL}         http://${SERVER}/kirjaudu
${CONTACT BUTTON}      id('login-button')

*** Keywords ***
Open Browser To Front Page
    Open Browser    ${FRONTPAGE URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Front Page Should Be Open
    
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Front Page Should Be Open
    Url Should Be    ${SERVER}
    
Login Page Should Be Open
    Url Should Be    ${LOGIN PAGE}
    
Go To Login Page
  Go To       ${LOGIN URL}
  Url Should Be      https://www.lupapiste.fi/kirjaudu
