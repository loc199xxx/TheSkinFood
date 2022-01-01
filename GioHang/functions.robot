*** Settings ***
Resource    ../CommonBase/imports.robot
Resource    ../GioHang/elements.robot

*** Keywords ***
GH - Open Homepage and close popup
        Open Website        ${URL_Home}
        Wait and Click elements         ${button_popup_close}
GH - Verify product and quantily in cart
        [Arguments]         ${product_name}      ${quantily}
        WAIT UNTIL ELEMENT IS VISIBLE       ${title_my_cart}        15s
        wait until page contains       ${product_name}         3s
        ${sl}=       get element attribute          //input[@data-name2="${product_name}"]        value
        SHOULD BE EQUAL         ${quantily}         ${sl}
GH - View product and return product name
        [Arguments]         ${element_lct}          ${time_out}=15s
        WAIT UNTIL ELEMENT IS VISIBLE     ${element_lct}     ${time_out}
        ${product_name}=        get element attribute       ${element_lct}      title
        click element       ${element_lct}
        [Return]     ${product_name}
GH - Delete product in cart
