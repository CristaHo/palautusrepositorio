*** Settings ***
Resource  resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Browser
Test Setup  Go To Register Page

*** Test Cases ***
Register With Valid Username And Password
    Set Username  abcde
    Set Password  abcde12345
    Set Password Confirmation  abcde12345
    Submit Credentials Register
    Register Should Succeed

Register With Too Short Username And Valid Password
    Set Username  ab
    Set Password  abcde12345
    Set Password Confirmation  abcde12345
    Submit Credentials Register
    Register Should Fail With Message  Username too short

Register With Valid Username And Invalid Password
    Set Username  abcde
    Set Password  abcdefghi
    Set Password Confirmation  abcdefghi
    Submit Credentials Register
    Register Should Fail With Message  Password should contain numbers and/or special characters

Register With Nonmatching Password And Password Confirmation
    Set Username  abcde
    Set Password  abcde12345
    Set Password Confirmation  abcde123456
    Submit Credentials Register
    Register Should Fail With Message  Password and password confirmation are not equal

Login After Successful Registration
    Set Username  abcdef
    Set Password  abcde123456
    Set Password Confirmation  abcde123456
    Submit Credentials Register
    Register Should Succeed
    Go To Login Page
    Set Username  abcdef
    Set Password  abcde123456
    Submit Credentials Login
    Login Should Succeed

Login After Failed Registration
    Set Username  ab
    Set Password  abcde123456
    Set Password Confirmation  abcde123456
    Submit Credentials Register
    Register Should Fail With Message  Username too short
    Go To Login Page
    Set Username  ab
    Set Password  abcde123456
    Submit Credentials Login
    Login Should Fail With Message  Invalid username or password
    

*** Keywords ***
Register Should Succeed
    Welcome Page Should Be Open

Register Should Fail With Message
    [Arguments]  ${message}
    Register Page Should Be Open
    Page Should Contain  ${message}

Submit Credentials Register
    Click Button  Register

Submit Credentials Login
    Click Button  Login

Set Username
    [Arguments]  ${username}
    Input Text  username  ${username}

Set Password
    [Arguments]  ${password}
    Input Password  password  ${password}

Set Password Confirmation
    [Arguments]  ${password_confirmation}
    Input Password  password_confirmation  ${password_confirmation}

Login Should Succeed
    Main Page Should Be Open

Login Should Fail With Message
    [Arguments]  ${message}
    Login Page Should Be Open
    Page Should Contain  ${message}
