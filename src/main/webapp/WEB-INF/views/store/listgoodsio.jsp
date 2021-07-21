<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<thead>
	<tr>
		<th scope="col" width="100" align="center">구분</th>
		<th scope="col" width="200" align="center">상품명</th>
		<th scope="col" width="100" align="center">단위</th>
		<th scope="col" width="100" align="center">입고량</th>
		<th scope="col" width="100" align="center">출고량</th>
		<th scope="col" width="100" align="center">잔여량</th>
	</tr>
</thead>
<tbody>
	<c:forEach var="row" items="${list01}">
		<tr>
			<td class="first">${row.goodsType}</td>
			<td id="${row.storeioNo}"><a href="javascript:fn_Reload03('${path}/store/detailgoodsio/${row.storeioNo}','',${row.storeioNo})">${row.goodsTitle}(${row.goodsModel})</a></td>
			<td>${row.goodsUnit}</td>
			<td style="text-align: right"><fmt:formatNumber value="${row.inStoreQty}" pattern="#,###" /></td>
			<td style="text-align: right"><fmt:formatNumber value="${row.outStoreQty}" pattern="#,###" /></td>
			<td style="text-align: right"><fmt:formatNumber value="${row.diffStoreQty}" pattern="#,###" /></td>
		</tr>
	</c:forEach>
</tbody>
<script>
	$(document).ready(function() {
		setfirst();
	});
</script>