*** Settings ***
Resource        ../CommonBase/imports.robot
Resource        ../DangNhap/elements.robot

*** Keywords ***
DN - Open Login page
    Open Website    ${url_login}
DN - Input information and click login
    [Arguments]         ${username}=        ${pass}=
    Wait and Input text         ${inp_email_login}       ${username}
    Wait and Input text         ${inp_pass_login}       ${pass}
    Wait and Click elements     ${btn_login_dangnhap}
DN - Verify errors notification
    [Arguments]          ${text_error}
    wait until element is visible       ${notif_errors_login}       5s
    ${text}=        get text        ${notif_errors_login}
    SHOULD BE EQUAL     ${text}     ${text_error}
DN - Verify login successful
     wait until element is visible      ${btn_logout_login}         7s