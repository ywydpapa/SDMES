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
			<td colspan="2"><select id="selgoodsNo" class="form-control">
					<option value="">선택</option>
					<c:forEach var="rowg" items="${goods}">
						<option value="${rowg.goodsNo}" <c:if test="${dto.goodsNo eq rowg.goodsNo}">selected</c:if> >${rowg.goodsTitle}(${rowg.goodsType})</option>
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
				class="form-control num_only num_comma num_sum CHK" id="storeUnit"
				name="storeUnit" value="${dto.storeUnit}" placeholder=""></td>
		</tr>
		<tr>
			<th>위치</th>
			<td><select class="form-control" id="locateCode">
					<c:forEach var="rowg" items="${locc}">
						<option value="${rowg.codeNo}"<c:if test="${dto.locateCode eq rowg.codeNo}">selected</c:if>>${rowg.codeDesc}(${rowg.mesCode})</option>
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
			<button class="btn btn-md btn-success" 
			onclick="<c:if test="${empty storeioNo}">fnInsertGoodsIo()</c:if><c:if test="${not empty storeioNo}">fnUpdateGoodsIo()</c:if>">
			<c:if test="${empty storeioNo}">저장</c:if><c:if test="${not empty storeioNo}">수정</c:if></button></td>
		</tr>
	</tbody>
</table>
