*** Settings ***
Library       Selenium2Library
Test Teardown    Close Browser
*** Test Cases ***
Post Comment
  [Tags]     develop
  Open Browser                      http://192.168.100.25:8080/2016/02/08/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu/
  Maximize Browser Window
  Input Text      comment   test comment
  Input Text      author    roof
  Input Text      email     roof@odd-e.com
  Input Text      url       www.roofimon.com
  Click Button    submit


Delete Comment
  Open Browser                      http://192.168.100.25:8080/wp-admin
  Maximize Browser Window
  Wait Until Element Is Visible     user_login
  Input Text                        user_login    set
  Input password                    pwd     password
  Click Button                      wp-submit
  Go To                             http://192.168.100.25:8080/wp-admin/edit-comments.php
  Click Element                     css=#the-comment-list > tr:first-child input
  Select From List By Label         bulk-action-selector-top     Move to Trash
  Click Button                      doaction
  Go To                             http://192.168.100.25:8080/2016/02/08/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu/
  Page Should Not Contain           test comment
