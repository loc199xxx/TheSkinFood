*** Settings ***
Resource    ../CommonBase/imports.robot
Resource    ../GioHang/elements.robot

*** Keywords ***
GH - Open Homepage and close popup
        Open Website        ${URL_Home}
        #Wait and Click elements         css=iframe[name='blank_f73e2b410ebc4']
        Wait and Click elements         ${button_popup_close}
        sleep  2s
        select frame        //iframe[starts-with(@name,'f')]
        Wait and Click elements       //*[@aria-label="đóng"]
        unselect frame

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
        #click element       ${element_lct}
        [Return]     ${product_name}
GH - input quantily product
        [Arguments]         ${product_name}      ${quantily}
        wait until page contains       ${product_name}         3s
        click element          //input[@data-name2="${product_name}"]
        input text         //input[@data-name2="${product_name}"]         ${quantily}
GH - Get price value product
        [Arguments]         ${product_name}
        ${price}=       get text        //a[@title="${product_name}"]/ancestor::div[@class="product-details "] /div/p/span[@class="price-value"]
        ${price}=       remove string     ${price}        ,   ₫
        [Return]        ${price}

GH - verify amount product
         [Arguments]      ${product_name}    ${price}      ${quantily}
         ${price}=      convert to integer      ${price}
         ${quantily}=      convert to integer     ${quantily}
         ${total}=      evaluate       ${price} * ${quantily}
         Wait and Click elements         ${btn_update_cart}
         sleep  4.5s
         #WAIT UNTIL ELEMENT IS VISIBLE          //input[@data-name2="${product_name}"]/parent::div/following-sibling::div[1]/span[@class="h5"]      5s
         ${price_visible}=      get text    //input[@data-name2="${product_name}"]/parent::div/following-sibling::div[1]/span[@class="h5"]
         ${price_visible}=      remove string     ${price_visible}        ,   ₫
         ${price_visible}=      convert to integer     ${price_visible}
         should be equal     ${price_visible}        ${total}
         [Return]       ${price_visible}