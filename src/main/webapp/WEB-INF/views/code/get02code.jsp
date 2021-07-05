<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
		<table id="initable" class="table table-bordered nowrap " style="margin: auto">
			<colgroup>
				<col width="25%" />
				<col width="25%" />
				<col width="25%" />
				<col width="10%" />
				<col width="15%" />
			</colgroup>
			<thead>
				<tr>
					<th>코드</th>
					<th>코드표시값</th>
					<th>코드처리값</th>
					<th>표시순번</th>
					<th>사용여부</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach varStatus="status" var="row2" items="${list02}">
					<tr>
						<td><input class="mtCd" type="hidden" value="${row2.motherCode}">
						<input class="CdNo" type="hidden" value="${row2.codeNo}">
						<input class="Cd" type="text" style="width:100%;hight:100%;border:0;" value="${row2.mesCode}"></td>
						<td><input class="Cdd" type="text" style="width:100%;hight:100%;border:0;" value="${row2.codeDesc}"></td>
						<td><input class="Cdv" type="text" style="width:100%;hight:100%;border:0;" value="${row2.codeValue}"></td>
						<td><input class="Cdsn" type="text" style="width:100%;hight:100%;border:0;" value="${row2.sortNo}"></td>
						<td>
						<select class="Cdyn" name="YN" class="form-control">
						<option value = "Y"<c:if test="${row2.useYn eq 'Y'}">selected</c:if>>사용</option>
						<option value = "N"<c:if test="${row2.useYn eq 'N'}">selected</c:if>>미사용</option>
						</select>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

