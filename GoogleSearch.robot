*** Settings ***
Library    SeleniumLibrary    

*** Test Cases ***
Google Search  
    Open Browser    https://www.google.com    browser=chromeheadless
    Set Browser Implicit Wait    3
    Input Text    name=q    test automation
    Click Button    name=btnK    
    Sleep    2    
    