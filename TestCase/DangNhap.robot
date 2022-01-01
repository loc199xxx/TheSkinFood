*** Settings ***
Resource  ../CommonBase/imports.robot
Test Setup       DN - Open Login page
Test Teardown       close browser
*** Test Cases ***
DN001 - Dang nhap thanh cong
        DN - Input information and click login      ${user_1}       ${password_1}
        DN - Verify login successful
DN002 - Dang nhap that bai - email chua duoc dang ky
        DN - Input information and click login      hongsslan01@gmail.com           hongsslan01
        DN - verify errors notification             Thông tin đăng nhập không hợp lệ.
DN003 - Dang nhap that bai - bo trong tat ca

        DN - Input information and click login
        DN - verify errors notification             Email hoặc số điện thoại không được bỏ trống.
DN004 - Dang nhap that bai - bo trong email

        DN - Input information and click login      pass=qrrrrqr
        DN - verify errors notification             Email hoặc số điện thoại không được bỏ trống.
DN005 - Dang nhap that bai - bo trong mat khau
        DN - Input information and click login      username=${user_1}
        DN - verify errors notification             Mật khẩu không được bỏ trống.
DN006 - Dang nhap that bai - nhap sai mat khau
        DN - Input information and click login      ${user_1}           adddvvvvd
        DN - verify errors notification             Thông tin đăng nhập không hợp lệ.
DN007 - Dang nhap that bai - email chua ky tu dac biet

        DN - Input information and click login      hongsslan01@gmail.com@###           ${password_1}
        WAIT UNTIL ELEMENT IS VISIBLE             //input[@value='Đăng nhập']       5s
DN008 - Dang nhap that bai - mat khau chua khoang trang o dau cuoi

        DN - Input information and click login      ${user_1}           ${SPACE}${password_1}${SPACE}
        DN - verify errors notification             Thông tin đăng nhập không hợp lệ.
DN009 - Dang nhap that bai - email chua khoang trang o dau cuoi

        # theo testcase của lan mong muốn nó ra lỗi nhưng thực tế là thành công => Fail
        DN - Input information and click login      ${SPACE}${user_1}${SPACE}           ${password_1}
        DN - verify errors notification             Thông tin đăng nhập không hợp lệ.
DN010 - Dang nhap that bai - email không dung dinh dang

        DN - Input information and click login      hongsslan01         ${password_1}
        WAIT UNTIL ELEMENT IS VISIBLE             //input[@value='Đăng nhập']       5s
DN011 - Dang nhap that bai - email chua khoang trang o giua

        DN - Input information and click login      hongsslan01@ gmail.com         ${password_1}
        WAIT UNTIL ELEMENT IS VISIBLE             //input[@value='Đăng nhập']       5s
