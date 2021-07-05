<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<table class="table table-bordered nowrap" id="contlistTable">
	<thead>
		<tr>
			<th scope="col" width="100" align="center">계약번호</th>
			<th scope="col" width="200" align="center">계약명</th>
			<th scope="col" width="100" align="center">납품일자</th>
			<th scope="col" width="100" align="center">납품처</th>
			<th scope="col" width="100" align="center">생산목표</th>
			<th scope="col" width="100" align="center">생산완료</th>
			<th scope="col" width="100" align="center">잔여량</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="row" items="${list01}">
			<tr>
				<td class="first from-control">${row.contNo}</td>
				<td><a
					href="javascript:fn_Reload03('${path}/cont/porderdetail/${row.contNo}')">${row.contTitle}</a></td>
				<td>${row.deliveryDate}</td>
				<td>${row.codeDesc}</td>
				<td style="text-align: right"><fmt:formatNumber
						value="${row.goodsQty}" pattern="#,###" /></td>
				<td style="text-align: right"><fmt:formatNumber
						value="${row.prdQty}" pattern="#,###" /></td>
				<td style="text-align: right"><fmt:formatNumber
						value="${row.remQty}" pattern="#,###" /></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
