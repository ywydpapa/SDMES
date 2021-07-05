<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

			<br>
		<table id="initable" class="table table-bordered nowrap " style="margin: auto">
			<colgroup>
				<col width="10%" />
				<col width="20%" />
				<col width="15%" />
				<col width="10%" />
				<col width="10%" />
				<col width="25%" />
			</colgroup>
			<thead>
				<tr style="text-align:center">
					<th>상품종류</th>
					<th>상품명</th>
					<th>모델명</th>
					<th>단위</th>
					<th>재고수량</th>
					<th>일자</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach varStatus="status" var="row2" items="${list01}">
					<tr>
						<td class="Cdt">${row2.goodsNo}</td>
						<td>
						<input class="cdNo" type="hidden" value="${row2.storeioNo}">
						<input class="Cd" type="text" style="width:100%;hight:100%;border:0;" value="${row2.goodsNo}"></td>
						<td><input class="Cdd" type="text" style="width:100%;hight:100%;border:0;" value="${row2.suppNo}"></td>
						<td><input class="Cdv" type="text" style="text-align:right;width:100%;hight:100%;border:0;" value="<fmt:formatNumber value="${row2.storeQty}" pattern="#,###"/>"></td>
						<td><input class="Cdsn" type="text" style="text-align:center;width:100%;hight:100%;border:0;" value="${row2.storeUnit}"></td>
						<td><input class="Cdcm" type="text" style="width:100%;hight:100%;border:0;" value="${row2.locateCode}"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
