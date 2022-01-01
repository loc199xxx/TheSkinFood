*** Settings ***
Resource        ../CommonBase/imports.robot
Test Setup      TK - Open Homepage and close popup
Test Teardown       Close Browser
*** Test Cases ***
TK001 - Tim theo du lieu dau vao - bo trong
        TK - Input and search
        WAIT UNTIL PAGE CONTAINS        Không tìm thấy nội dung bạn yêu cầu         5s
TK002 - Tim theo du lieu dau vao - nhap ten san pham khong day du

        TK - Input and search       Giấy
        TK - Verify result
        TK - Verify with 1 result      Giấy

TK003 - Tim theo du lieu dau vao - nhap ten san pham day du
        TK - Input and search       [HB GIFT] Mặt Nạ Giấy Dr.Morita Caviar Moisturizing Essence Facial Mask 28g
        TK - Verify result
        TK - Verify with 1 result      [HB GIFT] Mặt Nạ Giấy Dr.Morita Caviar Moisturizing Essence Facial Mask 28g
TK004 - Tim theo du lieu dau vao - toan khoang trang
        # Fail vì vẫn ra kết quả
        TK - Input and search           ${SPACE}${SPACE}${SPACE}
        WAIT UNTIL PAGE CONTAINS        Không tìm thấy nội dung bạn yêu cầu         5s
TK005 - Tim theo du lieu dau vao - nhap toan ki tu dac biet
        # Fail vì vẫn ra kết quả
        TK - Input and search           $%#%#%#%
        WAIT UNTIL PAGE CONTAINS        Không tìm thấy nội dung bạn yêu cầu         5s
TK006 - Tim theo du lieu dau vao - nhap chu in hoa
        TK - Input and search           GIẤY
        TK - Verify result
        TK - Verify with 1 result      GIẤY
TK007 - Tim theo du lieu dau vao - nhap chu khong dau

        TK - Input and search       giay
        TK - Verify result
        wait until element is visible          xpath=(//h6/a)[1]        5s
TK008 - Tim theo du lieu dau vao - nhap ten san pham va ky tu dac biet
        # Fail vì vẫn ra kết quả

        TK - Input and search           giay $%#%#%#%
        WAIT UNTIL PAGE CONTAINS        Không tìm thấy nội dung bạn yêu cầu         5s
TK008 - Tim theo du lieu dau vao - nhap ca chu hoa chu thuong

        TK - Input and search           GIấy
        TK - Verify result
        TK - Verify with 1 result      GIấy