<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<style>
.listcont {
	width: 100%;
	height: 100%;
	padding: 20px;
	background: white;
}

.detailcont {
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

<div class="listcont">
	<div class="h-container">
		<div class="item">
			<table class="table table-bordered nowrap" id="contlistTable">
				<thead>
					<tr>
						<th scope="col" width="100" align="center">요청번호</th>
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
		</div>
		<div class="item cont">
			<div id="detailcont" class="detailcont"></div>
		</div>
	</div>
</div>


<script>

function fn_Reload02(url, data){
	$("#contlistTable").empty();
	$("#contlistTable").load(url, data, function(){
		setTimeout(function(){
		}, 500);
});
}

function fn_Reload03(url, data){
	$("#detailcont").empty();
	$("#detailcont").load(url, data, function(){
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

function tableDetailLoad(){
	var $target;
	$target = $("#goodslistTable > tbody > tr > td > a");
	var tempArr = $target.eq(0).attr('href').split('/');
	var num = tempArr[tempArr.length - 1].replace(')','').replace('"','').replace('\'','');
	var url ="${path}/cont/detail/"+num;
		$.ajax({
			type: "GET",
			url : url,
			dataType : "html",
			success : function(html){
				$("#detailcont").empty();
				$("#detailcont").append(html);
			},
			error : function(xhr){
				console.log(xhr);
			}
		});
	} 

function newreq(){
	var url3 ="${path}/cont/writereq.do";
	fn_Reload03(url3);
}

$(document).ready(function() {
setfirst();
var url3 ="${path}/cont/writereq.do";
fn_Reload03(url3);
} );
</script>
