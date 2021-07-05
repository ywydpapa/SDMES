<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<style>
.h-container:after{ clear: both; display: block; content: '' }
.h-container .item {
	float: left;
	width: 25%;
	padding : 10px;
	height: 100%;
	text-align: center;
	border-right: 1px solid #fff;
}
.h-container .item.cont {
	float: left;
	padding : 10px;
	width: 70%;
	border-right: none;
	text-align: center;
}
</style>

<div class="page-header2">
	<div class="row align-items-end">
		<div class="col-lg-12">
			<div class="page-header-title">
				<div class="d-inline">
					<h5 style="text-align: center"><span></span>기초코드 관리</h5>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="h-container">
		<div class="item">
		<table id="cat01table" class="table table-striped table-bordered" style="margin: auto">
			<thead>
				<tr align="center">
					<th>코드 구분명</th>
				</tr>
				</thead>
				<tbody>
					<tr align="center">
						<td><a style="text-decoration:none" href="javascript:fn_Reload02('${path}/code/listCode01.do')">대분류관리</a></td>
					</tr>
					<tr align="center">
						<td><a style="text-decoration:none" href="javascript:fn_Reload02('${path}/code/listCode02.do')">중분류관리</a></td>
					</tr>
					<tr align="center">
						<td><a style="text-decoration:none" href="javascript:fn_Reload02('${path}/code/listCode03.do')">소분류관리</a></td>
					</tr>
			</tbody>
		</table>

	</div>
	<div class="item cont" id="contentsTable">
	</div>
</div> 
<script>

$('input[type=text]').change(function() {
	var keyvar3= $("#"+catkey3).val();
	var keyvar4= $("#"+catkey4).val();
	var codeData = {};
	codeData.BCD_ID 	= $("#"+catkey).val();
	codeData.BCD_TITLE 	= $("#"+catkey1).val();
	codeData.BCD_REMARK 	= $("#"+catkey2).val();
	console.log(codeData);
	$.ajax({ url: "${path}/code/updateCode.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
				data: codeData , // HTTP 요청과 함께 서버로 보낼 데이터 
				method: "POST", // HTTP 요청 메소드(GET, POST 등) 
				dataType: "json" // 서버에서 보내줄 데이터의 타입 
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
				}else{
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
			.fail(function(xhr, status, errorThrown) { 
				alert("통신 실패");
			});
});


$('select').change(function(){
	var keyid = $(this).attr('id');
	keyid = keyid.substr(4); 
	var catkey = "CAT0"+keyid;
	codeData.BCD_ORDER 	= $("#"+catkey3).val();
	codeData.BCD_USE_YN 	= $("#"+catkey4).val();
	console.log(codeData);

	$.ajax({ url: "${path}/code/updatebCode.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
				data: codeData , // HTTP 요청과 함께 서버로 보낼 데이터 
				method: "POST", // HTTP 요청 메소드(GET, POST 등) 
				dataType: "json" // 서버에서 보내줄 데이터의 타입 
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
				}else{
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
			.fail(function(xhr, status, errorThrown) { 
				alert("통신 실패");
			});
});

function fn_Reload02(url, data){
	$("#contentsTable").empty();
	$("#contentsTable").load(url, data, function(){
		setTimeout(function(){
		}, 500);
});
}

function fn_Reload03(url, data){
	$("#initable").empty();
	$("#initable").load(url, data, function(){
		setTimeout(function(){
		}, 500);
});
}

function fn_Reload04(url, data){
	$("#sel02").empty();
	$("#sel02").load(url, data, function(){
		setTimeout(function(){
		}, 500);
});
}


$(document).ready(function() {
    $('#cat02table').DataTable(
    		{
    			"paging":false,
    			"info":false,
    			"lengthChange":false
    		}
    );
    fn_Reload02('${path}/code/listCode01.do');
} );
</script>
