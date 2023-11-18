*** Settings ***
Resource  resource.robot
Test Setup  Input New Command And Create User

*** Test Cases ***
Register With Valid Username And Password
    Input Credentials  abcde  defgh1234!
    Output Should Contain  New user registered

Register With Already Taken Username And Valid Password
    Input Credentials  abcde  defgh1234
    Input  new
    Input Credentials  abcde  defgh1234
    Output Should Contain  User with username abcde already exists

Register With Too Short Username And Valid Password
    Input Credentials  ab  abcdef123
    Output Should Contain   Username too short

Register With Enough Long But Invald Username And Valid Password
    Input Credentials  abc1  abcdefg123!
    Output Should Contain  Username should contain only letters from a to z

Register With Valid Username And Too Short Password
    Input Credentials  abcd  ab12
    Output Should Contain  Password too short

Register With Valid Username And Long Enough Password Containing Only Letters
    Input Credentials  abcd  abcdefghi
    Output Should Contain  Password should contain numbers and/or special characters

***Keywords***
Input New Command And Create User
    Input New Command
