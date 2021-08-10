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
		</colgroup>
		<tr class="table-primary">
			<td class="align-middle">재고구분</td>
			<td>
				<select id="STORE_TYPE" class="form-control form-control-sm">
					<option value="GDS">상품</option>
					<option value="SUP">자재</option>
				</select>
			</td>
		</tr>
</table>
<hr>
	<div class="h-container">
		<div class="item">
			<table class="table table-bordered align-middle" id="storelistTable">
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
		<%--var url3 ="${path}/store/goodsio.do";--%>
		<%--fn_Reload03(url3);--%>
	}
	else
		{
		var url ="${path}/store/listsuppio.do";
		fn_Reload02(url);	
		<%--var url3 ="${path}/store/suppio.do";--%>
		<%--fn_Reload03(url3);--%>
		}
	
});

function fn_Reload02(url, data){
	$("#storelistTable").empty();
	$("#storelistTable").load(url, data, function(){
		setTimeout(function(){
			var list = $("#storelistTable > tbody > tr");
			if(list.length > 0){
				var tr = list[0];
				$(tr).find("a").get(0).click();	// a link force click!!
			}
		}, 100);
	});
}

function fn_Reload03(url, data, id){
	$("#storelistTable tbody tr td").css("background-color", "");
	$("#"+id).closest('tr').find('td').not(".first").css("background-color", "#dfffd4");

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

$(document).ready(function() {
	var url ="${path}/store/listgoodsio.do";
	fn_Reload02(url);
	<%--var url3 ="${path}/store/goodsio.do";--%>
	<%--fn_Reload03(url3);--%>
} );

function newdata() {
	var seltyp = $("#STORE_TYPE").val();
	if (seltyp == "GDS"){
		var url3 ="${path}/store/goodsio.do";
		fn_Reload03(url3);
	}
	else
		{
		var url3 ="${path}/store/suppio.do";
		fn_Reload03(url3);
		}
	
}


</script>

