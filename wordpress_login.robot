*** Settings ***
Library           Selenium2Library
                  Selenium2Library.Wait

*** Test Cases ***
Login
  Open Browser                      http://192.168.2.103:8080/wp-login.php
  Maximize Browser Window
  Wait Until Element Is Visible     user_login
  Input Text                        user_login    set
  Input password                    pwd     password
  Click Button                      wp-submit
  Page Should Contain               Dashboard

Login With Invalid Username
  Go To    http://192.168.2.103:8080/wp-login.php
  Wait Until Element Is Visible     user_login
  Input Text                        user_login    INVALIDUSER
  Input password                    pwd     password
  Click Button                      wp-submit
  Page Should Contain               Invalid username. Lost your password?


Login With Invalid Password
  Go To    http://192.168.1.101:8080/wp-login.php
  Wait Until Element Is Visible     user_login
  Input Text                        user_login    set
  Input password                    pwd     INVALIDPASS
  Click Button                      wp-submit
  Page Should Contain               The password you entered for the username set is incorrect. Lost your password?
  Close Browser
