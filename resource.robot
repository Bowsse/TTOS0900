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
${DELAY}          2
${LUVANHAKIJA URL}    http://${SERVER}/luvanhakija
${CONTACT URL}      http://${SERVER}/ota-yhteytta
${LOGIN URL}         http://${SERVER}/kirjaudu
${CONTACT BUTTON}      id('register')/x:div/x:div/x:div[3]/x:p[2]/x:a
${SEARCH BUTTON}       id('top-bar')/x:div/x:div/x:div[3]/x:ul[2]/x:li[1]/x:a/x:span[2]

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
    Location Should Be    ${SERVER}
    
Contact Page Should Be Open
    Location Should Be    ${CONTACT PAGE}
    
Login Page Should Be Open
    Url Should Be    ${LOGIN PAGE}
    
Go To Login Page
  Go To       ${LOGIN URL}
  Location Should Be      https://www.lupapiste.fi/kirjaudu
  
Search For Help
  Click Element     ${SEARCH BUTTON}
  Input Text   search-field     Apua
  Location Should Be     ${SERVER}/?s=Apua
