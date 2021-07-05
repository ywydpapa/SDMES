<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<style>
.listgoods {
	width: 100%;
	height: 100%;
	padding: 20px;
	background: white;
}

.detailgoods {
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

<div class="listgoods">
		<table class="table table-bordered nowrap"
		style="width: 50%;">
		<colgroup>
			<col width="10%" />
			<col width="20%" />
		</colgroup>
		<tr>
			<td>구분</td>
			<td><select id="GOODS_TYPE" class="form-control form-control-sm">
				<option value="GDS">상품</option>				
				<option value="SUP" selected>자재</option>
			</select></td>
		</tr>
</table>
<hr>
	<div class="h-container">
		<div class="item">
			<table class="table table-bordered nowrap" id="supplistTable">
				<thead>
					<tr>
						<th scope="col" width="100" align="center">구분</th>
						<th scope="col" width="200" align="center">품명</th>
						<th scope="col" width="100" align="center">모델명</th>
						<th scope="col" width="100" align="center">단위</th>
						<th scope="col" width="100" align="center">단가</th>
						<th scope="col" width="100" align="center">사용여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${list01}">
						<tr>
							<td class="first from-control">${row.suppType}</td>
							<td><a href="javascript:fn_Reload03('${path}/supp/suppdetail/${row.suppNo}')">${row.suppTitle}</a></td>
							<td>${row.suppModel}</td>
							<td>${row.suppUnit}</td>
							<td style="text-align: right"><fmt:formatNumber value="${row.suppPrice}" pattern="#,###" /></td>
							<td>${row.useYn}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="item cont">
			<div id="detailsupp" class="detailsupp"></div>
		</div>
	</div>
</div>


<script>
$("#GOODS_TYPE").change(function(){
	var url ="${path}/goods/listview.do";
	fnSetPage(url);
});

function fn_Reload02(url, data){
	$("#supplistTable").empty();
	$("#supplistTable").load(url, data, function(){
		setTimeout(function(){
		}, 500);
});
}

function fn_Reload03(url, data){
	$("#detailsupp").empty();
	$("#detailsupp").load(url, data, function(){
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
	$target = $("#supplistTable > tbody > tr > td > a");
	var tempArr = $target.eq(0).attr('href').split('/');
	var num = tempArr[tempArr.length - 1].replace(')','').replace('"','').replace('\'','');
	var url ="${path}/supp/suppdetail/"+num;
		$.ajax({
			type: "GET",
			url : url,
			dataType : "html",
			success : function(html){
				$("#detailsupp").empty();
				$("#detailsupp").append(html);
			},
			error : function(xhr){
				console.log(xhr);
			}
		});
	} 


$(document).ready(function() {
setfirst();
tableDetailLoad();
} );
</script>
