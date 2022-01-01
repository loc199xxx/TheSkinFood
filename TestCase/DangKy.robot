*** Settings ***
Resource    ../CommonBase/imports.robot
Test Setup          DK - Open Regsister page
Test Teardown       close browser
*** Test Cases ***
DK001 - Dang ky thanh cong
        ${ramdom}=      generate random string          8
        DK - Input information and click regsister          Ánh         Is my life          ${ramdom}@gmail.com      trunglee123
        DK - Verify regsister successful
DK002 - Dang ky that bai - bo trong mat khau

        DK - Input information and click regsister          Ánh         Is my life          anhonthelux2123@gmail.com
        DK - Verify errors notification          Mật khẩu không được để trống.
DK003 - Dang ky that bai - bo trong tat ca cac truong


        DK - Input information and click regsister
        DK - Verify errors notification          Dữ liệu không hợp lệ.
DK004 - Dang ky that bai - bo trong email

        DK - Input information and click regsister          Ánh         Is my life          pass=trunglee
        DK - Verify errors notification          Dữ liệu không hợp lệ.
DK005 - Dang ky that bai - nhap email da dang ky

        DK - Input information and click regsister          Ánh         Is my life      tranthaoanh999@gmail.com    trunglee
        DK - Verify errors notification          Email đã tồn tại. Nếu bạn quên mật khẩu, bạn có thể thiết lập lại mật khẩu tại đây.
DK006 - Dang ky thanh cong - nhap email chua khoang trang dau cuoi

        ${ramdom}=      generate random string          8
        DK - Input information and click regsister          Ánh         Is my life         ${SPACE}${ramdom}@gmail.com${SPACE}     pass=trunglee
        DK - Verify regsister successful
DK007 - Dang ky that bai - nhap email chua khoang trang o giua
        ${ramdom}=      generate random string          8
        DK - Input information and click regsister          Ánh         Is my life         ${ramdom}${SPACE}@gmail.com     pass=trunglee
        WAIT UNTIL ELEMENT IS VISIBLE       ${btn_regsister_dangky}     5s
DK008 - Dang ky that bai - nhap email chua ki tu dac biet
        ${ramdom}=      generate random string          8
        DK - Input information and click regsister          Ánh         Is my life         ${ramdom}@gmail.com@#$$%     pass=trunglee
        WAIT UNTIL ELEMENT IS VISIBLE       ${btn_regsister_dangky}     5s
DK009 - Dang ky that bai - nhap email khong co @
        ${ramdom}=      generate random string          8
        DK - Input information and click regsister          Ánh         Is my life         ${ramdom}     pass=trunglee
        WAIT UNTIL ELEMENT IS VISIBLE       ${btn_regsister_dangky}     5s
DK010 - Dang ky that bai - nhap mat khau 4 ki tu
        DK - Input information and click regsister          Ánh         Is my life    tranthaoan3h999@gmail.com      pass=trun
        DK - Verify errors notification          Mật khẩu quá ngắn (tối thiểu 5 ký tự).

DK011 - Dang ky that bai - bo trong ho
        # dang ky van thanh cong => fail
        ${ramdom}=      generate random string          8
        DK - Input information and click regsister            firstname=Is my life    email=${ramdom}@gmail.com      pass=trunglee
        DK - Verify errors notification          Không được bỏ trống Họ
DK012 - Dang ky that bai - bo trong ten
        # dang ky van thanh cong => fail
        ${ramdom}=      generate random string          8
        DK - Input information and click regsister            lastname=Ánh    email=${ramdom}@gmail.com      pass=trunglee
        DK - Verify errors notification          Mật khẩu không được chứa khoảng trắng.
DK013 - Dang ky that bai - nhap mat khau chua khoang trang o dau va cuoi
        # dang ky van thanh cong => fail
        ${ramdom}=      generate random string          8
        DK - Input information and click regsister            lastname=Ánh    email=${ramdom}@gmail.com      pass=${SPACE}truntrunglee${SPACE}
        DK - Verify errors notification          Mật khẩu không được chứa khoảng trắng.
DK014 - Dang ky that bai - nhap mat khau chua khoang trang o giua
        # dang ky van thanh cong => fail
        ${ramdom}=      generate random string          8
        DK - Input information and click regsister            lastname=Ánh    email=${ramdom}@gmail.com      pass=trung${SPACE}lee
        DK - Verify errors notification          Mật khẩu không được chứa khoảng trắng.
