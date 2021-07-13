<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<table class="table table-sm bst02">
	<colgroup>
		<col width="15%" />
		<col width="35%" />
		<col width="15%" />
		<col width="20%" />
		<col width="15%" />
	</colgroup>
	<tbody>
		<tr>
			<th>구분</th>
			<td><select class="form-control" id="inoutType">
					<option value="I" <c:if test="${dto.inoutTyp eq 'I'}">selected</c:if>>입 고</option>
					<option value="O" <c:if test="${dto.inoutTyp eq 'O'}">selected</c:if>>출 고</option>
			</select></td>
			<th scope="row">상품명<input type="hidden" id="storeioNo"
				value="${dto.storeioNo}"></th>
			<td colspan="2"><select id="selsuppNo" class="form-control">
					<option value="">선택</option>
					<c:forEach var="rowg" items="${supps}">
						<option value="${rowg.suppNo}" <c:if test="${dto.suppNo eq rowg.suppNo}">selected</c:if>>${rowg.suppTitle}(${rowg.suppType})</option>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<th scope="row">수량</th>
			<td><input type="text" style="text-align: right;"
				class="form-control num_only num_comma num_sum CHK" id="storeQty"
				name="storeQty"
				value="<fmt:formatNumber value="${dto.storeQty}" pattern="#,###"/>"
				placeholder=""></td>
			<th scope="row">단위</th>
			<td colspan="2"><input type="text" style="text-align: right;"
				class="form-control num_only num_comma num_sum CHK" id="suppUnit"
				name="suppUnit" value="${dto.suppUnit}" placeholder=""></td>
		</tr>
		<tr>
			<th>위치</th>
			<td><select class="form-control" id="locateCode">
					<c:forEach var="rowg" items="${locc}">
						<option value="${rowg.codeNo}" <c:if test="${dto.locateCode eq rowg.codeNo}">selected</c:if>>${rowg.codeDesc}(${rowg.mesCode})</option>
					</c:forEach>
			</select></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<th scope="row">설명</th>
			<td colspan="4"><textarea name="comment" id="comment" rows="4"
					class="form-control">${dto.comment}</textarea></td>
		</tr>
		<tr>
			<td colspan="5" style="text-align: right">
			<c:if test="${userRole eq 'ADMIN'}"><c:if test="${dto.attrib eq '00000'}"><button class="btn btn-md btn-success" onclick = "allowReq()">구매허가</button></c:if></c:if>
			<button class="btn btn-md btn-success" onclick = "<c:if test="${empty storeioNo}">fnInsertSuppIo()</c:if><c:if test="${not empty storeioNo}">fnUpdateSuppIo()</c:if>">
			<c:if test="${empty storeioNo}">저장</c:if><c:if test="${not empty storeioNo}">수정</c:if></button></td>
		</tr>
	</tbody>
</table>

<table class="table table-striped table-bordered nowrap">
	<thead>
	<tr>
		<th scope="col" width="100" align="center">구분</th>
		<th scope="col" width="200" align="center">상품명</th>
		<th scope="col" width="100" align="center">단위</th>
		<th scope="col" width="100" align="center">입고량</th>
		<th scope="col" width="100" align="center">출고량</th>
		<th scope="col" width="100" align="center">잔량</th>
		<th scope="col" width="100" align="center">구매신청</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="row" items="${list01}">
		<tr>
			<td class="first">${row.suppType}</td>
			<td><a href="javascript:fn_Reload03('${path}/store/detailsuppio/${row.storeioNo}')">${row.suppTitle}(${row.suppModel})</a></td>
			<td>${row.suppUnit}</td>
			<td style="text-align: right"><c:if test="${row.inoutTyp eq 'I'}"><fmt:formatNumber value="${row.storeQty}" pattern="#,###" /></c:if></td>
			<td style="text-align: right"><c:if test="${row.inoutTyp eq 'O'}"><fmt:formatNumber value="${row.storeQty}" pattern="#,###" /></c:if></td>
			<td></td>
			<td style="text-align:center"><c:if test="${row.attrib eq '00000'}">O</c:if></td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<script>
function allowReq(){

}
</script>