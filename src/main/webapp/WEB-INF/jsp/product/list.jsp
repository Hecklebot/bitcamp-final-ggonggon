<%@page import="bitcamp.chopchop.domain.Product"%>
<%@page import="bitcamp.chopchop.domain.PhotoFile"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
  <title>상품 목록</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
  <link rel='stylesheet' href='/css/common.css'>
</head>
<body>
  <jsp:include page="../header.jsp"/>
  <div id='content'>
    <h1>상품 목록</h1>
    <a href='form'>상품 등록</a><br>
    <form action='detail?no=${product.productNo}' method='post' enctype='multipart/form-data'>
      <table class='table table-hover'>
        <tr>
          <th>번호</th><th>사진</th><th>상품명</th><th>가격</th><th>할인율</th>
        </tr>
        <c:forEach items="${products}" var="product">
          <tr>
            <td>${product.productNo}</td>
            <td>
            </td>
            <td><a href='detail?no=${product.productNo}'>${product.title}</a></td>
            <td>${product.price}</td>
            <td>${product.discount}</td>
          </tr>
        </c:forEach>
      </table>
    </form>
  </div>
  <jsp:include page="../footer.jsp"/>
</body>
</html>