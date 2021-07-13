<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
	<table class="table table-striped table-bordered nowrap" id="storelistTable">
				<thead>
					<tr>
						<th scope="col" width="100" align="center">구분</th>
						<th scope="col" width="200" align="center">상품명</th>
						<th scope="col" width="100" align="center">단위</th>
						<th scope="col" width="100" align="center">구매요청량</th>
						<th scope="col" width="100" align="center">금액</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${list01}">
						<tr>
							<td class="first">${row.suppType}</td>
							<td><a href="javascript:fn_Reload03('${path}/store/detailsuppio/${row.storeioNo}')">${row.suppTitle}(${row.suppModel})</a></td>
							<td >${row.storeUnit}</td>
							<td style="text-align: right"><c:if test="${row.inoutTyp eq 'I'}"><fmt:formatNumber value="${row.storeQty}" pattern="#,###" /></c:if></td>
							<td style="text-align: right"><fmt:formatNumber value="${row.storeAmount}" pattern="#,###" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>	<script>		
		$(document).ready(function() {
			setfirst();
		} );
	</script>