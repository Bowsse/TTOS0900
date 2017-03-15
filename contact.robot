*** Settings ***
Documentation     A test suite with a single test for empty contact form.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Click Element ${CONTACT BUTTON}
    Contact Page Should Be Open
    [Teardown]    Close Browser