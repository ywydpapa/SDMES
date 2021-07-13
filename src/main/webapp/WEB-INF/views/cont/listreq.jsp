<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
			<table class="table table-bordered nowrap" id="contlistTable">
				<thead>
					<tr>
						<th scope="col" width="100" align="center">계약(예정)번호</th>
						<th scope="col" width="200" align="center">계약명</th>
						<th scope="col" width="100" align="center">계약금액</th>
						<th scope="col" width="100" align="center">납품일자</th>
						<th scope="col" width="100" align="center">납품처</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${list01}">
						<tr <c:if test="${row.attrib eq '000rj'}">style="background-color: #ffc107"</c:if>>
							<td class="first from-control">${row.contNo}</td>
							<td><a href="javascript:fn_Reload03('${path}/cont/reqdetail/${row.contNo}')"><c:if test="${row.attrib eq '000rj'}">[반려]</c:if>${row.contTitle}</a></td>
							<td style="text-align: right"><fmt:formatNumber value="${row.contAmount}" pattern="#,###" /></td>
							<td>${row.deliveryDate}</td>
							<td>${row.codeDesc}</td>
						</tr>
					</c:forEach>
					<tr>
					<td colspan = "6" style="text-align:right"><button class= "btn btn-md btn-primary" id="newreq" onclick="newreq()">새계약 추가</button></td>
					</tr>
				</tbody>
			</table>
