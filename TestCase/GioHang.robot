*** Settings ***
Resource  ../CommonBase/imports.robot
Test Setup      GH - Open Homepage and close popup
Test Teardown       close browser

*** Test Cases ***
GH001 - Them 1 san pham vao gio hang

        TK - Input and search       Bột Tẩy Trắng Răng Eucryl Toothpowder Freshmint 50g
        ${product_search}=      GH - View product and return product name         //h6/a
        wait and click elements         //h6/a
        Wait and Click elements         ${btn_addtocart}
        GH - Verify product and quantily in cart        ${product_search}        quantily=1

GH002 - Kiem tra gia tri mac dinh cua gio hang

        mouse over          ${btn_cart}
        wait until page contains            Giỏ hàng của bạn đang trống             3s
GH003 - Them 2 san pham giong nhau vao gio hang

        TK - Input and search       Bột Tẩy Trắng Răng Eucryl Toothpowder Freshmint 50g
        ${product_search}=      GH - View product and return product name         //h6/a
        wait and click elements         //h6/a
        Wait and Click elements         ${btn_addtocart}
        TK - Input and search       Bột Tẩy Trắng Răng Eucryl Toothpowder Freshmint 50g
        Wait and Click elements         //h6/a
        Wait and Click elements         ${btn_addtocart}
        GH - Verify product and quantily in cart         ${product_search}       quantily=2
GH004 - Them 2 san pham khac nhau vao gio hang

        TK - Input and search       Bột Tẩy Trắng Răng Eucryl Toothpowder Freshmint 50g
        ${product_search1}=      GH - View product and return product name         //h6/a
        wait and click elements         //h6/a
        Wait and Click elements         ${btn_addtocart}
        TK - Input and search       Klairs Supple Preparation Facial Toner
        ${product_search2}=      GH - View product and return product name         //h6/a
        wait and click elements         //h6/a
        Wait and Click elements         ${btn_addtocart}
        GH - Verify product and quantily in cart         ${product_search1}       quantily=1
        GH - Verify product and quantily in cart        ${product_search2}       quantily=1
GH005 - Them 1 san pham vao gio hang va xoa

        TK - Input and search       Bột Tẩy Trắng Răng Eucryl Toothpowder Freshmint 50g
        ${product_search}=      GH - View product and return product name         //h6/a
        wait and click elements         //h6/a
        Wait and Click elements         ${btn_addtocart}
        GH - Verify product and quantily in cart         ${product_search}       quantily=1
        #Wait and Click elements         //div[@aria-label="đóng"]
        Wait and Click elements         //*[@class="cart__remove"]
        wait until page contains            Giỏ hàng của bạn đang trống             5s
GH006 - Them 1 san pham vao gio hang va thay doi so luong la 2
        [Tags]          12
        TK - Input and search       Bột Tẩy Trắng Răng Eucryl Toothpowder Freshmint 50g
        ${product_search}=      GH - View product and return product name         //h6/a
        ${price_product}=    GH - Get price value product        ${product_search}
        wait and click elements         //h6/a
        Wait and Click elements         ${btn_addtocart}
        GH - Verify product and quantily in cart        ${product_search}        quantily=1
        GH - input quantily product         ${product_search}       2
        GH - Verify product and quantily in cart        ${product_search}        quantily=2
        GH - verify amount product      ${product_search}    ${price_product}       quantily=2

GH007 - Kiem tra khi nhap so luong la am
        # fail vi so luong tu dong ve 1, mong muon hien thi thong bao so luong k hop le

        TK - Input and search       Bột Tẩy Trắng Răng Eucryl Toothpowder Freshmint 50g
        ${product_search}=      GH - View product and return product name         //h6/a
        wait and click elements         //h6/a
        Wait and Click elements         ${btn_addtocart}
        GH - Verify product and quantily in cart        ${product_search}        quantily=1
        GH - input quantily product         ${product_search}       -2
        Wait and Click elements         ${btn_update_cart}
        WAIT UNTIL PAGE CONTAINS        Số lượng không hợp lệ!          5s

GH008 - Kiem tra khi nhap so luong la 0

        # fail vi nhap so luong 0 se xoa di san pham do, mong muon hien thi thong bao so luong k hop le

        TK - Input and search       Bột Tẩy Trắng Răng Eucryl Toothpowder Freshmint 50g
        ${product_search}=      GH - View product and return product name         //h6/a
        wait and click elements         //h6/a
        Wait and Click elements         ${btn_addtocart}
        GH - Verify product and quantily in cart        ${product_search}        quantily=1
        GH - input quantily product         ${product_search}       0
        Wait and Click elements         ${btn_update_cart}
        WAIT UNTIL PAGE CONTAINS        Số lượng không hợp lệ!          5s

GH009 - Kiem tra khi nhap so luong la 1,5
        # fail vi so luong tu dong ve 1, mong muon hien thi thong bao so luong k hop le
        TK - Input and search       Bột Tẩy Trắng Răng Eucryl Toothpowder Freshmint 50g
        ${product_search}=      GH - View product and return product name         //h6/a
        wait and click elements         //h6/a
        Wait and Click elements         ${btn_addtocart}
        GH - Verify product and quantily in cart        ${product_search}        quantily=1
        GH - input quantily product         ${product_search}       0
        Wait and Click elements         ${btn_update_cart}
        WAIT UNTIL PAGE CONTAINS        Số lượng không hợp lệ!          5s



