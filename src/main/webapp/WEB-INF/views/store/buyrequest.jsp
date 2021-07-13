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
			<th style="text-align:center">구분</th>
			<td><select class="form-control" id="inoutType">
					<option value="I" <c:if test="${dto.inoutTyp eq 'I'}">selected</c:if>>구매신청</option>
					<option value="O" <c:if test="${dto.inoutTyp eq 'O'}">selected</c:if>>반출신청</option>
			</select></td>
			<th style="text-align:center" scope="row">요청 자재<input type="hidden" id="storeioNo"
				value="${dto.storeioNo}"></th>
			<td colspan="2"><select id="selsuppNo" class="form-control">
					<option value="">선택</option>
					<c:forEach var="rowg" items="${supp}">
						<option value="${rowg.suppNo}" <c:if test="${dto.suppNo eq rowg.suppNo}">selected</c:if>>${rowg.suppTitle}(${rowg.suppModel})</option>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<th  style="text-align:center" scope="row">수량</th>
			<td><input type="text" style="text-align: right;"
				class="form-control num_only num_comma num_sum CHK" id="storeQty"
				name="storeQty"
				value="<fmt:formatNumber value="${dto.storeQty}" pattern="#,###"/>"
				placeholder=""></td>
			<th  style="text-align:center"scope="row">단위</th>
			<td colspan="2"><input type="text" style="text-align: right;"
				class="form-control num_only num_comma num_sum CHK" id="suppUnit"
				name="suppUnit" value="${dto.suppUnit}" placeholder=""></td>
		</tr>
		<tr>
		<th  style="text-align:center" scope="row">신청금액</th>
			<td><input type="text" style="text-align: right;"
				class="form-control num_only num_comma num_sum CHK" id="storeAmount"
				name="storeAmount"
				value="<fmt:formatNumber value="${dto.storeAmount}" pattern="#,###"/>"
				placeholder=""></td>
			<th  style="text-align:center">위치</th>
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
			<th  style="text-align:center" scope="row">설명</th>
			<td colspan="4"><textarea name="comment" id="comment" rows="8"
					class="form-control">${dto.comment}</textarea></td>
		</tr>
		<tr>
			<td colspan="5" style="text-align: right"><button
					class="btn btn-md btn-success" onclick = "<c:if test="${empty storeioNo}">fnInsertSuppReq()</c:if><c:if test="${not empty storeioNo}">fnUpdateSuppIo()</c:if>">
					<c:if test="${empty storeioNo}">구매신청</c:if><c:if test="${not empty storeioNo}">수정</c:if></button></td>
		</tr>
	</tbody>
</table>
<script>
function fnInsertSuppReq(){
	var messtoredata = {};
	messtoredata.suppNo = $("#selsuppNo").val();
	messtoredata.inoutTyp = $("#inoutType").val();
	messtoredata.storeQty = $("#storeQty").val().replace(/[\D\s\._\-]+/g, "");
	messtoredata.storeUnit = $("#storeUnit").val();
	messtoredata.locateCode = $("#locateCode").val();
	messtoredata.comment = $("#comment").val();
	messtoredata.storeAmount = $("#storeAmount").val().replace(/[\D\s\._\-]+/g, "");
	console.log(messtoredata);
	$.ajax({
		url : "${path}/store/insertReq.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
		data : messtoredata, // HTTP 요청과 함께 서버로 보낼 데이터 
		method : "POST", // HTTP 요청 메소드(GET, POST 등) 
		dataType : "json" // 서버에서 보내줄 데이터의 타입 
		})
	.done(function(data) {
		if(data.code == 10001){
			var url = "${path}/store/listview.do"; 
			fnSetPage(url);
			}else{
			alert("저장 실패");
			}
		}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
		.fail(function(xhr, status, errorThrown) { 
		alert("통신 실패");
		});
}
</script>