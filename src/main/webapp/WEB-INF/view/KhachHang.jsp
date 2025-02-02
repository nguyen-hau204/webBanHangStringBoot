<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body class="container">
<ul class="nav nav-tabs">
    <li class="nav-item">
        <a class="nav-link " aria-current="page" href="/ban-hang/hien-thi">Bán Hàng</a>
    </li>
    <li class="nav-item">
        <a class="nav-link " aria-current="page" href="/lich-su-mua-hang/hien-thi">Lịch sử mua hàng</a>
    </li>
    <li class="nav-item">
        <a class="nav-link " aria-current="page" href="/nhan-vien/hien-thi">Nhân viên</a>
    </li>
    <li class="nav-item">
        <a class="nav-link " aria-current="page" href="/san-pham/hien-thi">sản phẩm</a>
    </li>
    <li class="nav-item">
        <a class="nav-link " aria-current="page" href="/chi-tiet-san-pham/hien-thi">chi tiết sản phẩm</a>
    </li>
    <li class="nav-item">
        <a class="nav-link " aria-current="page" href="/chuc-vu/hien-thi">chức vụ</a>
    </li>
    <li class="nav-item">
        <a class="nav-link " aria-current="page" href="/cua-hang/hien-thi">cửa hàng</a>
    </li>
    <li class="nav-item">
        <a class="nav-link " aria-current="page" href="/dong-san-pham/hien-thi">Dòng sản phẩm</a>
    </li>
    <li class="nav-item">
        <a class="nav-link active" aria-current="page" href="/khach-hang/hien-thi">Khách Hàng</a>
    </li>
    <li class="nav-item">
        <a class="nav-link " aria-current="page" href="/mau-sac/hien-thi">màu sắc</a>
    </li>
    <li class="nav-item">
        <a class="nav-link " aria-current="page" href="/nha-san-xuat/hien-thi">Nhà sản xuất</a>
    </li>
</ul>
<h1 class="text-center">Thêm khách hàng</h1>
<form action="/khach-hang/add" method="post">
    <div class="mb-3">
        <label for="maSv" class="form-label">họ</label>
        <input type="text" class="form-control" id="maSv" name="ho" value="${khachHang.ho}">
    </div>
    <div class="mb-3">
        <label for="maSv" class="form-label">tên đệm</label>
        <input type="text" class="form-control" id="tenDem" name="tenDem" value="${khachHang.tenDem}">
    </div>
    <div class="mb-3">
        <label for="maSv" class="form-label">tên</label>
        <input type="text" class="form-control" id="ten" name="ten" value="${khachHang.ten}">
    </div>
    <div class="mb-3">
        <label for="maSv" class="form-label">Ngày sinh</label>
        <input type="date" class="form-control" id="ngaySinh" name="ngaySinh" value="${ngaySinh}"
               pattern="\d{4}-\d{2}-\d{2}">
    </div>
    <div class="mb-3">
        <label for="sdt" class="form-label">số điện thoại</label>
        <input type="text" class="form-control" id="sdt" name="sdt" value="${khachHang.sdt}">
    </div>
    <div class="mb-3">
        <label for="diaChi" class="form-label">địa chỉ</label>
        <input type="text" class="form-control" id="diaChi" name="diaChi" value="${khachHang.diaChi}">
    </div>
    <div class="mb-3">
        <label for="thanhPho" class="form-label">thành phố</label>
        <input type="text" class="form-control" id="thanhPho" name="thanhPho" value="${khachHang.thanhPho}">
    </div>
    <div class="mb-3">
        <label for="quocGia" class="form-label">quốc gia</label>
        <input type="text" class="form-control" id="quocGia" name="quocGia" value="${khachHang.quocGia}">
    </div>
    <div class="mb-3">
        <label for="matKhau" class="form-label">mật khẩu</label>
        <input type="text" class="form-control" id="matKhau" name="matKhau" value="${khachHang.matKhau}">
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>
<h1 class="text-center">Danh sách khách hàng</h1>
<table class="table">
    <thead>
    <tr>
        <th scope="col">stt</th>
        <th scope="col">id</th>
        <th scope="col">họ tên</th>
        <th scope="col">ngày sinh</th>
        <th scope="col">số điện thoại</th>
        <th scope="col">địa chỉ</th>
        <th scope="col">thành phố</th>
        <th scope="col">quốc gia</th>
        <th scope="col">mật khẩu</th>
        <th scope="col">action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${listKhachHang}" var="nv" varStatus="i">
        <tr>
            <th scope="row">${i.index}</th>
            <td>${nv.id}</td>
            <td>${nv.ho} ${nv.tenDem} ${nv.ten}</td>
            <td>${nv.ngaySinh}</td>
            <td>${nv.sdt}</td>
            <td>${nv.diaChi}</td>
            <td>${nv.thanhPho}</td>
            <td>${nv.quocGia}</td>
            <td>${nv.matKhau}</td>
            <td>
                <a href="/khach-hang/remove/${nv.id}" type="button" class="btn btn-danger">delete</a>
                <a href="/khach-hang/detail/${nv.id}" type="button" class="btn btn-info">detail</a>
                <a href="/khach-hang/view-update/${nv.id}" type="button" class="btn btn-warning">update</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>