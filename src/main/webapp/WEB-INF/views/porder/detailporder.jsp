<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<table id="initable" class="table table-bordered nowrap " style="margin: auto">
	<colgroup>
		<col width="20%" />
		<col width="10%" />
		<col width="10%" />
		<col width="10%" />
		<col width="10%" />
		<col width="10%" />
		<col width="10%" />
		<col width="10%" />
	</colgroup>
	<thead>
	<tr class="table-info">
		<th style="text-align:center; vertical-align: middle;">상품명</th>
		<th style="text-align:center; vertical-align: middle;">생산목표량</th>
		<th style="text-align:center; vertical-align: middle;">생산량<br/>(완제품)</th>
		<th style="text-align:center; vertical-align: middle;">생산량<br/>(반제품)</th>
		<th style="text-align:center; vertical-align: middle;">잔여량</th>
		<th style="text-align:center; vertical-align: middle;">금회생산량<br/>(완제품)</th>
		<th style="text-align:center; vertical-align: middle;">금회생산량<br/>(반제품)</th>
		<th style="text-align:center; vertical-align: middle;">생산지시량</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach varStatus="status" var="row2" items="${list1}">
		<tr>
			<td style="text-align:center; vertical-align: middle;">
				<input class="cdNo" type="hidden" value="${row2.contdtlNo}">
				<input id="contNo" type="hidden" value="${row2.contNo}">
				<input id="goodsNo" class="goodsNo" type="hidden" value="${row2.goodsNo}">
				${row2.goodsTitle}(${row2.goodsModel})
			<td style="text-align:right; vertical-align: middle;"><fmt:formatNumber value="${row2.goodsQty}" pattern="#,###" /></td>
			<td style="text-align:right; vertical-align: middle;"><fmt:formatNumber value="${row2.prdQtyComplete}" pattern="#,###" /></td>
			<td style="text-align:right; vertical-align: middle;"><fmt:formatNumber value="${row2.prdQtyPart}" pattern="#,###" /></td>
			<td style="text-align:right; vertical-align: middle;"><fmt:formatNumber value="${row2.goodsQty - row2.prdQtyComplete}" pattern="#,###" /></td>
			<td><input class="form-control PrdQtyComplete" type="number" style="width:100%;hight:100%;border:0;text-align:right;" value="0" min="0" max="${row2.goodsQty - row2.prdQtyComplete}" ></td>
			<td><input class="form-control PrdQtyPart" type="number" style="width:100%;hight:100%;border:0;text-align:right;" value="0" max= "${row2.remQty}" ></td>
			<td><input class="form-control PrdToday" type="number" style="width:100%;hight:100%;border:0;text-align:right;" value="0" max= "${row2.remQty}" ></td>
		</tr>
	</c:forEach>
	</tbody>
</table>
	<c:if test="${userRole eq 'ADMIN'}">
	<table class="table table-bordered">
		<colgroup>
			<col width="25%" />
			<col width="75%" />
		</colgroup>
		<tbody>
		<tr>
		<td style="text-align:center; vertical-align: middle;" height="100">안전조치사항</td>
		<td><textarea rows="5" class="form-control" id="ordSafety"></textarea></td>
		</tr>
		<tr>
		<td style="text-align:center; vertical-align: middle;" height="100">기타사항</td>
		<td><textarea rows="5" class="form-control" id="ordRemark"></textarea></td>
		</tr>
		</tbody>
	</table>
	</c:if>
<div class="btn_wr text-right mt-3">
	<c:if test="${userRole eq 'ADMIN'}">
		<button class="btn btn-md btn-primary" value="저장" id="btn-upd-row1" onclick="fn_printporder()">작업지시서 출력</button>
	</c:if>
	<button class="btn btn-md btn-success" value="저장" id="btn-upd-row1" onclick="fn_updateLines()">변경사항저장</button>
</div>
<div style="display:none" id = "printdiv">
	<table class="table table-bordered nowrap " style="margin: auto">
		<colgroup>
			<col width="15%" />
			<col width="15%" />
			<col width="17%" />
			<col width="5%" />
			<col width="12%" />
			<col width="12%" />
			<col width="12%" />
			<col width="12%" />
		</colgroup>
	<tr>
	<th rowspan="3" style="text-align:center;vertical-align:middle"><img src="${path}/resources/image/logo.png"></th>
	<th rowspan="3" style="text-align:center;vertical-align:middle" colspan="5"><h3>작업지시서</h3></th>
	<th style="text-align:center;vertical-align:middle" class="table-info">문서번호</th>
	<th></th>
	</tr>
	<tr>
	<th style="text-align:center;vertical-align:middle" class="table-info">페이지</th>
	<th></th>
	</tr>
	<tr>
	<th style="text-align:center;vertical-align:middle" class="table-info">작성일자</th>
	<th id="printDate"> </th>
	</tr>
	<tr>
	<td colspan="8"></td>
	</tr>
	<tr>
	<th style="text-align:center;vertical-align:middle" colspan="3" rowspan="2">아래와 같이 작업지시서를<br/>제출합니다.</th>
	<th style="text-align:center;vertical-align:middle" rowspan="2">결<br/><br/>재</th>
	<th style="text-align:center;vertical-align:middle">영업담당</th>
	<th style="text-align:center;vertical-align:middle">이사</th>
	<th style="text-align:center;vertical-align:middle">부사장</th>
	<th style="text-align:center;vertical-align:middle">대표이사</th>
	</tr>
	<tr>
	<th height="100"></th>
	<th></th>
	<th></th>
	<th></th>
	</tr>
	<tr>
	<td colspan="8"></td>
	</tr>
	</table>
		<table class="table table-bordered">
		<colgroup>
			<col width="25%" />
			<col width="25%" />
			<col width="25%" />
			<col width="25%" />
		</colgroup>
		<tbody>
		<tr>
		<td style="text-align:center; vertical-align: middle;">납품처</td>
		<td style="text-align:center; vertical-align: middle;">${cont.codeDesc}</td>
		<td style="text-align:center; vertical-align: middle;">납품예정일</td>
		<td style="text-align:center; vertical-align: middle;">${cont.deliveryDate}</td>
		</tr>
		</tbody>
	</table>
	<table class="table table-bordered nowrap " style="margin: auto">
		<colgroup>
			<col width="25%" />
			<col width="10%" />
			<col width="10%" />
			<col width="10%" />
			<col width="10%" />
			<col width="10%" />
		</colgroup>
		<thead>
		<tr>
			<th style="text-align:center; vertical-align: middle;">상품명</th>
			<th style="text-align:center; vertical-align: middle;">생산목표량</th>
			<th style="text-align:center; vertical-align: middle;">생산량<br/>(완제품)</th>
			<th style="text-align:center; vertical-align: middle;">생산량<br/>(반제품)</th>
			<th style="text-align:center; vertical-align: middle;">잔여량</th>
			<th style="text-align:center; vertical-align: middle;">생산지시량</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach varStatus="status" var="row2" items="${list1}">
			<tr>
				<td style="text-align:center; vertical-align: middle;">
					<input class="cdNo" type="hidden" value="${row2.contdtlNo}">
					<input id="contNo" type="hidden" value="${row2.contNo}">
						${row2.goodsTitle}(${row2.goodsModel})
				<td style="text-align:right; vertical-align: middle;"><fmt:formatNumber value="${row2.goodsQty}" pattern="#,###" /></td>
				<td style="text-align:right; vertical-align: middle;"><fmt:formatNumber value="${row2.prdQtyComplete}" pattern="#,###" /></td>
				<td style="text-align:right; vertical-align: middle;"><fmt:formatNumber value="${row2.prdQtyPart}" pattern="#,###" /></td>
				<td style="text-align:right; vertical-align: middle;"><fmt:formatNumber value="${row2.remQty}" pattern="#,###" /></td>
				<td class="PrdPrn" style="text-align:right; vertical-align: middle;"><fmt:formatNumber value="" pattern="#,###" /></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<table class="table table-bordered">
		<colgroup>
			<col width="25%" />
			<col width="75%" />
		</colgroup>
		<tbody>
		<tr>
		<td style="text-align:center; vertical-align: middle;" height="200">안전조치사항</td>
		<td><textarea class="form-control" rows="5" id="printSafety" style="border:none; resize:none" ></textarea></td>
		</tr>
		<tr>
		<td style="text-align:center; vertical-align: middle;" height="200">기타사항</td>
		<td><textarea class="form-control" rows="5" id="printRemark" style="border:none; resize:none" ></textarea></td>
		</tr>
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


	function fn_updateLines(){
		var $Aarr = $("#initable").find(".cdNo");
		// var $Barr = $(".PrdQty");
		var $Carr = $(".PrdQtyComplete");
		var $Darr = $(".PrdQtyPart");
		var $Earr = $(".goodsNo");
		for (var i=0; i<$Aarr.length; i++){
			var mesdata = {};
			mesdata.contdtlNo = $Aarr[i].value;
			mesdata.prdQtyComplete = Number($Carr[i].value);
			mesdata.prdQtyPart = Number($Darr[i].value);
			mesdata.goodsNo = Number($Earr[i].value);
			console.log(mesdata);

			$.ajax({
				url : "${path}/cont/updateaddgoods.do",
				data : mesdata,
				method : "POST",
				dataType : "json",
				async : false,
			})
			.done(function(data) {
			});
		}

		var list = $("#contlistTable > tbody > tr");
		if(list.length > 0){
			var tr = list[0];
			$(tr).find("a").get(0).click();	// a link force click!!
		}
	}
	
	function lineCopy(){
		var $Aarr = $(".PrdToday");
		var $Barr = $(".PrdPrn");
		for (var i=0; i<$Aarr.length; i++){
			var cnt = numberWitioutCommas($Aarr[i].value);
			$Barr[i].innerText = numberWithCommas(cnt);			
		}
		var aa = $("#ordSafety").val(); 
		$("#printSafety").html(aa);
		var bb = $("#ordRemark").val();
		$("#printRemark").html(bb);
		
		var today = new Date();
		var year = today.getFullYear();
		var month = ('0' + (today.getMonth() + 1)).slice(-2);
		var day = ('0' + today.getDate()).slice(-2);
		var dateString = year + '-' + month  + '-' + day;
		var hours = ('0' + today.getHours()).slice(-2); 
		var minutes = ('0' + today.getMinutes()).slice(-2);
		var seconds = ('0' + today.getSeconds()).slice(-2); 
		var timeString = hours + ':' + minutes  + ':' + seconds;
		var pdate = dateString + ' ' + timeString; 		
		$("#printDate").html(pdate);
	}

</script>