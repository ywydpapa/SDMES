<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<table class="table table-striped table-bordered nowrap" id="listTable">
				<thead>
					<tr>
						<th scope="col" width="25%" style="text-align:center">로그인아이디</th>
						<th scope="col" width="25%" style="text-align:center">이름</th>
						<th scope="col" width="25%" style="text-align:center">권한</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${list}">
						<tr>
							<td><a href="javascript:fnSetupdetail('${path}/user/detail/${row.userId}')">${row.userId}</a></td>
							<td>${row.userName}</td>
							<td>${row.userRole}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>