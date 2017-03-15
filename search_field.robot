*** Settings ***
Documentation     A test suite with a single test for search function.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Search Something
    Open Browser To Front Page
    Search For Help
    [Teardown]    Close Browser
