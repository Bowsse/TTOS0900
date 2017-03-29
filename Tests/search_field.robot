*** Settings ***
Documentation     Search field test

Resource          resources.robot
Suite Teardown    Close Browser

*** Test Cases ***
Search Something
    Open Browser To Front Page
    Search For Help

