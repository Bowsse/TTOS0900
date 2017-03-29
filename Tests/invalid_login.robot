*** Settings ***
Documentation     Test login with invalid data

Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Test Setup        Go To Login Page
Test Template     Login With Invalid Credentials Should Fail
Resource          resources.robot

*** Test Cases ***    USER NAME    PASSWORD

Invalid Username And Password     ASD      ASD

Empty Username        ${EMPTY}     ASD

Empty Password        ASD          ${EMPTY}

Empty Username And Password          ${EMPTY}     ${EMPTY}
