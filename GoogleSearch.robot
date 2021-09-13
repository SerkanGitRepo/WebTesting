*** Settings ***
Library    SeleniumLibrary    

*** Test Cases ***
Google Search  
    Open Browser    https://www.google.com    chrome    --no-sandbox
    Set Browser Implicit Wait    3
    Input Text    name=q    test automation
    Click Button    name=btnK    
    Sleep    2    
    