<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
						<option value="">선택</option>
				<c:forEach varStatus="status" var="row2" items="${list02}">
						<option value="${row2.codeNo}">${row2.codeDesc}</option>
				</c:forEach>

