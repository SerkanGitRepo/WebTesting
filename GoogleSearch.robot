*** Settings ***
Library    SeleniumLibrary    

*** Test Cases ***
Google Search  
    Open Browser    https://www.google.com    Chrome    remote_url=http://127.0.0.1:4444/wd/hub   
    Set Browser Implicit Wait    3
    Input Text    name=q    test automation
    Click Button    name=btnK    
    Sleep    2    
    