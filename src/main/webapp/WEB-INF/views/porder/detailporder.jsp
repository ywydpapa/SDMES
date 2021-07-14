<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<table id="initable" class="table table-bordered nowrap " style="margin: auto">
	<colgroup>
		<col width="25%" />
		<col width="20%" />
		<col width="20%" />
		<col width="20%" />
		<col width="15%" />
	</colgroup>
	<thead>
	<tr>
		<th style="text-align:center">상품명</th>
		<th style="text-align:center">생산목표량</th>
		<th style="text-align:center">기존생산량</th>
		<th style="text-align:center">잔여량</th>
		<th style="text-align:center">금회생산량</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach varStatus="status" var="row2" items="${list1}">
		<tr>
			<td style="text-align:center">
				<input class="cdNo" type="hidden" value="${row2.contdtlNo}"><input id="contNo" type="hidden" value="${row2.contNo}">
					${row2.goodsTitle}(${row2.goodsModel})
			<td style="text-align:right"><fmt:formatNumber value="${row2.goodsQty}" pattern="#,###" /></td>
			<td style="text-align:right"><fmt:formatNumber value="${row2.prdQty}" pattern="#,###" /></td>
			<td style="text-align:right"><fmt:formatNumber value="${row2.remQty}" pattern="#,###" /></td>
			<td><input class="form-control PrdQty" type="number" style="width:100%;hight:100%;border:0;text-align:right;" value="0" min="0" max= "${row2.remQty}" ></td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<div class="btn_wr text-right mt-3">
	<c:if test="${userRole eq 'ADMIN'}">
		<button class="btn btn-md btn-primary" value="저장" id="btn-upd-row1" onclick="fn_printporder()">작업지시서 출력</button>
	</c:if>
	<button class="btn btn-md btn-success" value="저장" id="btn-upd-row1" onclick="fn_updateLines()">변경사항저장</button>
</div>
<div style="display:none" id = "printdiv">
	<table id="initable" class="table table-bordered nowrap " style="margin: auto">
		<colgroup>
			<col width="25%" />
			<col width="25%" />
			<col width="25%" />
			<col width="25%" />
		</colgroup>
		<thead>
		<tr>
			<th colspan="4" style="text-align:center"><h3>작업지시서</h3></th>
		</tr>
		<tr>
			<th colspan="1" style="text-align:center"><h4>계약명</h4></th>
			<th colspan="3" style="text-align:center"><h4></h4>${cont.contTitle}</th>
		</tr>
		<tr>
			<th colspan="1" style="text-align:center"><h4>납품예정일</h4></th>
			<th colspan="3" style="text-align:center"><h4></h4>${cont.deliveryDate}</th>
		</tr>
		<tr>
			<th style="text-align:center">상품명</th>
			<th style="text-align:center">생산목표량</th>
			<th style="text-align:center">기존생산량</th>
			<th style="text-align:center">잔여량</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach varStatus="status" var="row2" items="${list1}">
			<tr>
				<td style="text-align:center">
					<input class="cdNo" type="hidden" value="${row2.contdtlNo}"><input id="contNo" type="hidden" value="${row2.contNo}">
						${row2.goodsTitle}(${row2.goodsModel})
				<td style="text-align:right"><fmt:formatNumber value="${row2.goodsQty}" pattern="#,###" /></td>
				<td style="text-align:right"><fmt:formatNumber value="${row2.prdQty}" pattern="#,###" /></td>
				<td style="text-align:right"><fmt:formatNumber value="${row2.remQty}" pattern="#,###" /></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>

<script>
	$(document).ready(function() {
	});

	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	function numberWitioutCommas(x) {
		return x.toString().replace(/[\D\s\._\-]+/g, "");
	}

	function fn_printporder() {
		var initBody = document.body.innerHTML;
		window.onbeforeprint = function(){
			document.body.innerHTML = document.getElementById("printdiv").innerHTML;
		}
		window.onafterprint = function(){
			document.body.innerHTML = initBody;
		}
		window.print();
	}

	function fn_updateLines(){
		var $Aarr = $(".cdNo");
		var $Barr = $(".PrdQty");
		for (var i=0; i<$Aarr.length; i++){
			var mesdata = {};
			mesdata.contdtlNo = $Aarr[i].value;
			mesdata.prdQty = Number($Barr[i].value.replace(/[\D\s\._\-]+/g, ""));
			console.log(mesdata);
			$.ajax({
				url : "${path}/cont/updateaddgoods.do",
				data : mesdata,
				method : "POST",
				dataType : "json"
			})
					.done(function(data) {
					});
		}
		reload2();
		var url3 = "${path}/cont/porderdetail/"+$("#contNo").val();
		fn_Reload03(url3);
	}

</script>