<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<script>
var d = new Date(2018, 8, 18)
var day = dayjs(d)
</script>
			<div class="btn_wr text-right mt-3">
				<button class="btn btn-md btn-success" value="추가" id="btn-add-row1">새코드 추가</button>
			</div>
			<br>
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
				<c:forEach varStatus="status" var="row2" items="${list01}">
					<tr>
						<td>
						<input class="cdNo" type="hidden" value="${row2.codeNo}">
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
			<div class="btn_wr text-right mt-3">
				<button class="btn btn-md btn-success" value="저장" id="btn-upd-row1">변경사항저장</button>
			</div>
<script>

function fn_updateLine1(){
	var $Aarr = $(".cdNo");
	var $Barr = $(".Cd");
	var $Carr = $(".Cdd");
	var $Darr = $(".Cdv");
	var $Earr = $(".Cdsn");
	var $Farr = $(".Cdyn");
	for (var i=0; i<$Aarr.length; i++){
		var mescodedata = {};
		mescodedata.mesCode = $Barr[i].value;
		mescodedata.codeDesc = $Carr[i].value;
		mescodedata.codeValue = $Darr[i].value;
		mescodedata.sortNo = $Earr[i].value;
		mescodedata.useYn = $Farr[i].value;
		mescodedata.codeNo = $Aarr[i].value;
		$.ajax({
			url : "${path}/code/update.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
			data : mescodedata, // HTTP 요청과 함께 서버로 보낼 데이터 
			method : "POST", // HTTP 요청 메소드(GET, POST 등) 
			dataType : "json" // 서버에서 보내줄 데이터의 타입 
		})
		.done(function(data) {
		});
	}
}


function fn_newLine1(){
	var mescodedata = {};
	mescodedata.motherCode = 0;
	mescodedata.compNo = 100001;
	mescodedata.mesCode = "새코드";
	mescodedata.codeDesc = "코드설명";
	mescodedata.codeValue = "코드값";
	mescodedata.sortNo = 10;
	mescodedata.codeLevel = 1;
	mescodedata.useYn = "Y";
	console.log(mescodedata);
	$.ajax({
		url : "${path}/code/insert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
		data : mescodedata, // HTTP 요청과 함께 서버로 보낼 데이터 
		method : "POST", // HTTP 요청 메소드(GET, POST 등) 
		dataType : "json" // 서버에서 보내줄 데이터의 타입 
	})
	.done(function(data) {
		if(data.code == 10001){
			var url = "${path}/code/listCode01.do"; 
			fn_Reload02(url);
			}else{
				alert("저장 실패");
			}
		}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
		.fail(function(xhr, status, errorThrown) { 
			alert("통신 실패");
		});
	}
	
	
	
$("#btn-add-row1").click(function(){
	fn_newLine1();
});

$("#btn-upd-row1").click(function(){
	fn_updateLine1();
});


</script>