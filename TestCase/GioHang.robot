*** Settings ***
Resource  ../CommonBase/imports.robot
Test Setup      GH - Open Homepage and close popup
Test Teardown       close browser

*** Test Cases ***
GH001 - Them 1 san pham vao gio hang

        TK - Input and search       Bột Tẩy Trắng Răng Eucryl Toothpowder Freshmint 50g
        ${product_search}=      GH - View product and return product name         //h6/a
        Wait and Click elements         ${btn_addtocart}
        GH - Verify product and quantily in cart        ${product_search}        quantily=1

GH002 - Kiem tra gia tri mac dinh cua gio hang

        mouse over          ${btn_cart}
        wait until page contains            Giỏ hàng của bạn đang trống             3s
GH003 - Them 2 san pham giong nhau vao gio hang

        TK - Input and search       Bột Tẩy Trắng Răng Eucryl Toothpowder Freshmint 50g
        ${product_search}=      GH - View product and return product name         //h6/a
        Wait and Click elements         ${btn_addtocart}
        TK - Input and search       Bột Tẩy Trắng Răng Eucryl Toothpowder Freshmint 50g
        Wait and Click elements         //h6/a
        Wait and Click elements         ${btn_addtocart}
        GH - Verify product and quantily in cart         ${product_search}       quantily=2
GH004 - Them 2 san pham khac nhau vao gio hang

        TK - Input and search       Bột Tẩy Trắng Răng Eucryl Toothpowder Freshmint 50g
        ${product_search1}=      GH - View product and return product name         //h6/a
        Wait and Click elements         ${btn_addtocart}
        TK - Input and search       Klairs Supple Preparation Facial Toner
        ${product_search2}=      GH - View product and return product name         //h6/a
        Wait and Click elements         ${btn_addtocart}
        GH - Verify product and quantily in cart         ${product_search1}       quantily=1
        GH - Verify product and quantily in cart        ${product_search2}       quantily=1
GH005 - Them 1 san pham vao gio hang va xoa
        [Tags]          12
        TK - Input and search       Bột Tẩy Trắng Răng Eucryl Toothpowder Freshmint 50g
        ${product_search}=      GH - View product and return product name         //h6/a
        Wait and Click elements         ${btn_addtocart}
        GH - Verify product and quantily in cart         ${product_search}       quantily=1

GH006 - Them 1 san pham vao gio hang
GH007 - Them 1 san pham vao gio hang
GH008 - Them 1 san pham vao gio hang
GH009 - Them 1 san pham vao gio hang

