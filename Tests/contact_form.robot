*** Settings ***
Documentation     Test for contact form

Resource          resources.robot
Suite Teardown    Close Browser

*** Test Cases ***
Invalid Contact Message
    Open Contact Page
    Send Contact Message
    Contact Message Send Should Have Failed
