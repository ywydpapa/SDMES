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
		<div class="item" id="listcont">
			<table class="table table-bordered align-middle" id="contlistTable">
				<thead>
				<tr class="table-info">
					<th style="text-align:center; vertical-align: middle;">계약번호</th>
					<th style="text-align:center; vertical-align: middle;">계약명</th>
					<th style="text-align:center; vertical-align: middle;">납품일자</th>
					<th style="text-align:center; vertical-align: middle;">납품처</th>
					<th style="text-align:center; vertical-align: middle;">생산목표</th>
					<th style="text-align:center; vertical-align: middle;">생산완료<br/>(완제품)</th>
					<th style="text-align:center; vertical-align: middle;">잔여량</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="row" items="${list01}">
					<tr id="${row.contNo}">
						<td class="first from-control">${row.contNo}</td>
						<td><a href="javascript:fn_Reload03('${path}/cont/porderdetail/${row.contNo}','',${row.contNo})">${row.contTitle}</a></td>
						<td>${row.deliveryDate}</td>
						<td>${row.codeDesc}</td>
						<td style="text-align: right"><fmt:formatNumber value="${row.goodsQty}" pattern="#,###" /></td>
						<td style="text-align: right"><fmt:formatNumber value="${row.prdQtyComplete}" pattern="#,###" /></td>
						<td style="text-align: right"><fmt:formatNumber value="${row.remQty}" pattern="#,###" /></td>
					</tr>
				</c:forEach>
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
		$("#listcont").empty();
		$("#listcont").load(url, data, function(){
			setTimeout(function(){
			}, 500);
		});
	}

	function fn_Reload03(url, data, id){
		$("#contlistTable tbody tr").css("background-color", "");
		$("#"+id).closest('tr').css("background-color", "#dfffd4");

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
		$target = $("#contlistTable > tbody > tr > td > a");
		var tempArr = $target.eq(0).attr('href').split('/');
		var num = tempArr[tempArr.length - 1].replace(')','').replace('"','').replace('\'','').split(',')[0];
		var url ="${path}/cont/porderdetail/"+num;
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

	function reload2(){
		var url2 = "${path}/cont/listporder.do";
		fn_Reload02(url2);
	}

	function fn_printporder() {
		lineCopy();
		var initBody = document.body.innerHTML;
		window.onbeforeprint = function(){
			document.body.innerHTML = document.getElementById("printdiv").innerHTML;
		}
		window.onafterprint = function(){
			document.body.innerHTML = initBody;
		}
		window.print();
	}

	$(document).ready(function() {
		// tableDetailLoad();

		var list = $("#contlistTable > tbody > tr");
		if(list.length > 0){
			var tr = list[0];
			$(tr).find("a").get(0).click();	// a link force click!!
		}
	});
</script>
