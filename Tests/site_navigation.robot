*** Settings ***
Suite Setup       Open Browser To Front Page
Suite Teardown    Close Browser
Resource          resources.robot

*** Test Cases ***
Navigate To Permit Page
    Click Element    ${MENU BUTTON}
    Click Element    ${MENUBTN PERMIT}
    Wait For Condition    return window.location.href == "${PERMIT URL}"    timeout=10
    Location Should Be    ${PERMIT URL}

Navigate To Blog Page
    Click Element    ${MENU BUTTON}
    Click Element    ${MENUBTN BLOG}
    Wait For Condition    return window.location.href == "${BLOG URL}"    timeout=10
    Location Should Be    ${BLOG URL}
