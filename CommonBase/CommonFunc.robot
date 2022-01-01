*** Settings ***
Resource    ./imports.robot
Resource    ../CommonBase/CommonElements.robot

*** Keywords ***
Open Website
        [Arguments]         ${URL}
        open browser        ${URL}      chrome      executable_path=${chrome_path}
        maximize browser window
Wait and Click elements
        [Arguments]         ${element_lct}          ${time_out}=15s
        WAIT UNTIL ELEMENT IS VISIBLE     ${element_lct}     ${time_out}
        click element       ${element_lct}
Wait and Input text
        [Arguments]         ${element_lct}     ${text}     ${time_out}=15s
        WAIT UNTIL ELEMENT IS VISIBLE     ${element_lct}     ${time_out}
        input text       ${element_lct}     ${text}
Wait and Click Link
        [Arguments]         ${element_lct}      ${time_out}=15s
        WAIT UNTIL ELEMENT IS VISIBLE     ${element_lct}     ${time_out}
        click link       ${element_lct}
