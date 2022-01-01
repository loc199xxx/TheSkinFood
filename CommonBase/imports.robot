*** Settings ***
Library     SeleniumLibrary
Library     String
# CommonBase
Resource      ./CommonElements.robot
Resource      ./CommonFunc.robot
Resource      ./DataTest.robot

# Chuc nang
Resource       ../DangNhap/functions.robot
Resource       ../GioHang/functions.robot
Resource       ../TimKiem/functions.robot
Resource       ../DangKy/functions.robot
