*** Settings ***
Resource    ../CommonBase/imports.robot
Resource    ../TimKiem/elements.robot


*** Keywords ***
TK - Open Homepage and close popup
        Open Website        ${URL_Home}
        Wait and Click elements         ${button_popup_close}
TK - Input and search
        [Arguments]         ${text_search}=
        Wait and Input text       ${ipt_search}        ${text_search}
        Wait and Click elements         ${btn_search}
TK - Verify result
        WAIT UNTIL PAGE CONTAINS        Kết quả tìm kiếm cho

TK - Verify with 1 result
       [Arguments]          ${text_search}
       ${text_search}=      convert to lower case   ${text_search}
       ${a1}=       get element attribute   //h6/a     title
       ${a1}=      convert to lower case   ${a1}
       should contain       ${a1}     ${text_search}


