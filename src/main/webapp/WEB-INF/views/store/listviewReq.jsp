<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<style>
.liststore {
	width: 100%;
	height: 100%;
	padding: 20px;
	background: white;
}

.detailstore {
	width: 100%;
	height: 100%;
	padding: 20px;
	background: white;
}

.h-container:after {
	clear: both;
	display: block;
	content: ''
}

.h-container .item {
	float: left;
	width: 40%;
	height: 100%;
	text-align: center;
	border-right: 1px solid #ddd;
}

.h-container .item.cont {
	float: left;
	width: 58%;
	border-right: none;
	text-align: center;
}
</style>

<div class="liststore">
		<table class="table table-bordered nowrap"
		style="width: 50%;">
		<colgroup>
			<col width="10%" />
			<col width="40%" />
			<col width="10%" />
		</colgroup>
		<tr>
			<td>구분</td>
			<td><select id="STORE_TYPE" class="form-control form-control-sm">
				<option value="SUP">자재</option>
				<option value="GDS">상품</option>
			</select></td>
			<td><button class="btn btn-md btn-success" onclick="newreq()">새데이터</button></td>
		</tr>
</table>
<hr>
	<div class="h-container">
		<div class="item">
			<table class="table table-striped table-bordered nowrap" id="storelistTable">
				<thead>
				</thead>
				<tbody>
				</tbody>
			</table>
			
		</div>
		<div class="item cont">
			<div id="detailstore" class="detailstore">
			</div>
		</div>
	</div>
</div>


<script>
$("#STORE_TYPE").change(function(){
	var sele = $("#STORE_TYPE").val();
	if (sele == 'GDS'){
		var url ="${path}/store/listgoodsio.do";
		fn_Reload02(url);
		var url3 ="${path}/store/goodsio.do";
		fn_Reload03(url3);
	}
	else
		{
		var url ="${path}/store/listsuppio.do";
		fn_Reload02(url);	
		var url3 ="${path}/store/suppio.do";
		fn_Reload03(url3);
		}
	
});

function fn_Reload02(url, data){
	$("#storelistTable").empty();
	$("#storelistTable").load(url, data, function(){
		setTimeout(function(){
		}, 500);
});
}

function fn_Reload03(url, data){
	$("#detailstore").empty();
	$("#detailstore").load(url, data, function(){
		setTimeout(function(){
		}, 500);
});
}

function setfirst(){
	var i = 1;
	var str;
	var element = $(".first");
	var firstElement;
	element.each(function() {
		console.dir(i + $(this).text());
		if (str == undefined && firstElement == undefined) {
			str = $(".first")[0].innerText;
			firstElement = $(".first")[0];
			return;
		}
		if (str == $(this).text()) {
			i++;
			console.dir('--> ' + i + $(this).text());
			$(this).remove();
		} else {
			$(firstElement).attr('rowspan', i);
			i = 1;
			str = $(this).text();
			firstElement = $(this);
		}
	});
	// 마지막꺼까지 반영
	$(firstElement).attr('rowspan', i);
	}

function fnInsertGoodsIo(){
	var messtoredata = {};
	messtoredata.goodsNo = $("#selgoodsNo").val();
	messtoredata.inoutTyp = $("#inoutType").val();
	messtoredata.storeQty = $("#storeQty").val().replace(/[\D\s\._\-]+/g, "");
	messtoredata.storeUnit = $("#storeUnit").val();
	messtoredata.locateCode = $("#locateCode").val();
	messtoredata.comment = $("#comment").val();
	console.log(messtoredata);
	$.ajax({
		url : "${path}/store/insert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
		data : messtoredata, // HTTP 요청과 함께 서버로 보낼 데이터 
		method : "POST", // HTTP 요청 메소드(GET, POST 등) 
		dataType : "json" // 서버에서 보내줄 데이터의 타입 
		})
	.done(function(data) {
		if(data.code == 10001){
			var url = "${path}/store/listgoodsio.do"; 
			fn_Reload02(url);
			}else{
			alert("저장 실패");
			}
		}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
		.fail(function(xhr, status, errorThrown) { 
		alert("통신 실패");
		});
}

function fnUpdateGoodsIo(){
	var messtoredata = {};
	messtoredata.storeioNo = $("#storeioNo").val();
	messtoredata.goodsNo = $("#selgoodsNo").val();
	messtoredata.inoutTyp = $("#inoutType").val();
	messtoredata.storeQty = $("#storeQty").val().replace(/[\D\s\._\-]+/g, "");
	messtoredata.storeUnit = $("#storeUnit").val();
	messtoredata.locateCode = $("#locateCode").val();
	messtoredata.comment = $("#comment").val();
	console.log(messtoredata);
	$.ajax({
		url : "${path}/store/update.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
		data : messtoredata, // HTTP 요청과 함께 서버로 보낼 데이터 
		method : "POST", // HTTP 요청 메소드(GET, POST 등) 
		dataType : "json" // 서버에서 보내줄 데이터의 타입 
		})
	.done(function(data) {
		if(data.code == 10001){
			var url = "${path}/store/listgoodsio.do"; 
			fn_Reload02(url);
			}else{
			alert("저장 실패");
			}
		}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
		.fail(function(xhr, status, errorThrown) { 
		alert("통신 실패");
		});
}


function fnInsertSuppIo(){
	var messtoredata = {};
	messtoredata.suppNo = $("#selsuppNo").val();
	messtoredata.inoutTyp = $("#inoutType").val();
	messtoredata.storeQty = $("#storeQty").val().replace(/[\D\s\._\-]+/g, "");
	messtoredata.storeUnit = $("#storeUnit").val();
	messtoredata.locateCode = $("#locateCode").val();
	messtoredata.comment = $("#comment").val();
	console.log(messtoredata);
	$.ajax({
		url : "${path}/store/insert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
		data : messtoredata, // HTTP 요청과 함께 서버로 보낼 데이터 
		method : "POST", // HTTP 요청 메소드(GET, POST 등) 
		dataType : "json" // 서버에서 보내줄 데이터의 타입 
		})
	.done(function(data) {
		if(data.code == 10001){
			var url = "${path}/store/listsuppio.do"; 
			fn_Reload02(url);
			}else{
			alert("저장 실패");
			}
		}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
		.fail(function(xhr, status, errorThrown) { 
		alert("통신 실패");
		});
}

function fnUpdateSuppIo(){
	var messtoredata = {};
	messtoredata.storeioNo = $("#storeioNo").val();
	messtoredata.suppNo = $("#selsuppNo").val();
	messtoredata.inoutTyp = $("#inoutType").val();
	messtoredata.storeQty = $("#storeQty").val().replace(/[\D\s\._\-]+/g, "");
	messtoredata.storeUnit = $("#storeUnit").val();
	messtoredata.locateCode = $("#locateCode").val();
	messtoredata.comment = $("#comment").val();
	console.log(messtoredata);
	$.ajax({
		url : "${path}/store/update.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
		data : messtoredata, // HTTP 요청과 함께 서버로 보낼 데이터 
		method : "POST", // HTTP 요청 메소드(GET, POST 등) 
		dataType : "json" // 서버에서 보내줄 데이터의 타입 
		})
	.done(function(data) {
		if(data.code == 10001){
			var url = "${path}/store/listsuppio.do"; 
			fn_Reload02(url);
			}else{
			alert("저장 실패");
			}
		}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
		.fail(function(xhr, status, errorThrown) { 
		alert("통신 실패");
		});
}


$(document).ready(function() {
	var url ="${path}/store/listReq.do";
	fn_Reload02(url);
	var url3 ="${path}/store/buyrequest.do";
	fn_Reload03(url3);
} );

function newreq() {
	var seltyp = $("#STORE_TYPE").val();
	if (seltyp == "GDS"){
		var url3 ="${path}/store/buyrequest.do";
		fn_Reload03(url3);
	}
	else
		{
		var url3 ="${path}/store/buyrequest.do";
		fn_Reload03(url3);
		}
	
}


</script>

