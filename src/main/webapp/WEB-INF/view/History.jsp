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
        <a class="nav-link active" aria-current="page" href="/lich-su-mua-hang/hien-thi">Lịch sử mua hàng</a>
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
        <a class="nav-link " aria-current="page" href="/khach-hang/hien-thi">Khách Hàng</a>
    </li>
    <li class="nav-item">
        <a class="nav-link " aria-current="page" href="/mau-sac/hien-thi">màu sắc</a>
    </li>
    <li class="nav-item">
        <a class="nav-link " aria-current="page" href="/nha-san-xuat/hien-thi">Nhà sản xuất</a>
    </li>
</ul>
<h2>Danh sách đơn hàng đã mua</h2>
<table class="table">
    <thead>
    <tr>
        <th scope="col">stt</th>
        <th scope="col">id</th>
        <th scope="col">khách hàng</th>
        <th scope="col">ngày tạo</th>
        <th scope="col">Tổng tiền</th>
        <th scope="col">Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${listHoaDon.content}" var="hd" varStatus="i">
        <tr>
            <th scope="row">${i.index+1}</th>
            <td>${hd.id}</td>
            <td>${hd.khachHang.ho} ${hd.khachHang.tenDem} ${hd.khachHang.ten}</td>
            <td>${hd.ngayTao}</td>
            <td>0.0</td>
            <td>
                <a href="/lich-su-mua-hang/chi-tiet-don-hang/${hd.id}" type="button" class="btn btn-success">xem chi tiết</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<nav aria-label="Page navigation example">
    <ul class="pagination">
        <li class="page-item"><a class="page-link" href="/lich-su-mua-hang/hien-thi?page=${currentPage-1}">Previous</a></li>
        <c:forEach var="i" begin="0" end="${totalPage-1}">
            <li class="page-item <c:if test="${i==currentPage}">active</c:if>">
                <a class="page-link" href="/lich-su-mua-hang/hien-thi?page=${i}">${i+1}</a>
            </li>
        </c:forEach>
        <li class="page-item"><a class="page-link" href="/lich-su-mua-hang/hien-thi?page=${currentPage+1}">Next</a></li>
    </ul>
</nav>
<h2>Danh sách chi tiết đơn hàng</h2>
Tổng tiền hóa đơn: <span>${tongTien}</span>
<table class="table">
    <thead>
    <tr>
        <th scope="col">stt</th>
        <th scope="col">id</th>
        <th scope="col">id hóa đơn</th>
        <th scope="col">tên sản phẩm</th>
        <th scope="col">nhà sản xuất</th>
        <th scope="col">Màu sắc</th>
        <th scope="col">số lượng</th>
        <th scope="col">đơn giá</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${listHoaDonCt}" var="hdct" varStatus="i">
        <tr>
            <th scope="row">${i.index+1}</th>
            <td>${hdct.id}</td>
            <td>${hdct.hoaDon.id}</td>
            <td>${hdct.chiTietSP.sanPham.ten}</td>
            <td>${hdct.chiTietSP.nsx.ten}</td>
            <td>${hdct.chiTietSP.mauSac.ten}</td>
            <td>${hdct.chiTietSP.dongSP.ten}</td>
            <td>${hdct.soLuong}</td>
            <td>${hdct.donGia}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>