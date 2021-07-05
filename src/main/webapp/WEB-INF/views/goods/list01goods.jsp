<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
			<table class="table table-bordered nowrap" id="goodslistTable">
				<thead>
					<tr>
						<th scope="col" width="100" align="center">구분</th>
						<th scope="col" width="200" align="center">품명</th>
						<th scope="col" width="100" align="center">모델명</th>
						<th scope="col" width="100" align="center">단위</th>
						<th scope="col" width="100" align="center">단가</th>
						<th scope="col" width="100" align="center">사용여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${list01}">
						<tr>
							<td class="first">${row.goodsType}</td>
							<td><a href="javascript:fn_Reload03('${path}/goods/goodsdetail/${row.goodsNo}')">${row.goodsTitle}</a></td>
							<td>${row.goodsModel}</td>
							<td>${row.goodsUnit}</td>
							<td style="text-align: right"><fmt:formatNumber value="${row.goodsPrice}" pattern="#,###" /></td>
							<td>${row.useYn}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	<script>		
		$(document).ready(function() {
			setfirst();
		} );
	</script>