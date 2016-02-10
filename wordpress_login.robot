*** Settings ***
Library           Selenium2Library

*** Test Cases ***
Login
  Set Selenium Speed    .1
  Open Browser                      https://sprint3r1.wordpress.com/wp-login.php
  Maximize Browser Window
  Wait Until Element Is Visible     user_login
  Input Text                        user_login    sprint3r1
  Input password                    pwd     WorkingSoftware
  Click Button                      wp-submit
  Page Should Contain               Dashboard

Login With Invalid Username
  Go To    https://sprint3r1.wordpress.com/wp-login.php
  Wait Until Element Is Visible     user_login
  Input Text                        user_login    INVALIDUSER
  Input password                    user_pass     password
  Click Button                      wp-submit
  Wait Until Page Contains               ERROR: The password you entered for the email or username invaliduser is incorrect. Lost your password?


Login With Invalid Password
  Go To    https://sprint3r1.wordpress.com/wp-login.php
  Wait Until Element Is Visible     user_login
  Input Text                        user_login    set
  Input password                    user_pass     INVALIDPASS
  Click Button                      wp-submit
  Page Should Contain               ERROR: Invalid email or username. Lost your password?
  Close Browser
