*** Settings ***
Resource        ../CommonBase/imports.robot
Resource        ../DangKy/elements.robot

*** Keywords ***
DK - Open Regsister page
        Open Website    ${url_regsister}
DK - Input information and click regsister
    [Arguments]         ${lastname}=        ${firstname}=        ${email}=        ${pass}=
    Wait and Input text         ${inp_ho_dangky}       ${lastname}
    Wait and Input text         ${inp_ten_dangky}       ${firstname}
    Wait and Input text         ${inp_email_dangky}       ${email}
    Wait and Input text         ${inp_matkhau_dangky}       ${pass}
    Wait and Click elements     ${btn_regsister_dangky}
DK - Verify errors notification
    [Arguments]          ${text_error}
    wait until element is visible       ${notif_erorrs_dangky}        5s
    ${text}=        get text        ${notif_erorrs_dangky}
    SHOULD BE EQUAL     ${text}     ${text_error}
DK - Verify regsister successful
     wait until element is visible      ${btn_logout_login}         7s