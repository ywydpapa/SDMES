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
						${row2.goodsTitle}
						<td style="text-align:right"><fmt:formatNumber value="${row2.goodsQty}" pattern="#,###" /></td>
						<td style="text-align:right"><fmt:formatNumber value="${row2.prdQty}" pattern="#,###" /></td>
						<td style="text-align:right"><fmt:formatNumber value="${row2.remQty}" pattern="#,###" /></td>
						<td><input class="form-control PrdQty" type="number" style="width:100%;hight:100%;border:0;text-align:right;" value="0" min="0" max= "${row2.remQty}" ></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
			<div class="btn_wr text-right mt-3">
				<button class="btn btn-md btn-success" value="저장" id="btn-upd-row1" onclick="fn_updateLines()">변경사항저장</button>
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
			var $Aarr = $(".cdNo");
			var $Barr = $(".PrdQty");
			for (var i=0; i<$Aarr.length; i++){
				var mesdata = {};
				mesdata.contdtlNo = $Aarr[i].value;
				mesdata.prdQty = Number($Barr[i].value.replace(/[\D\s\._\-]+/g, ""));
				console.log(mesdata);
				$.ajax({
					url : "${path}/cont/updateaddgoods.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
					data : mesdata, // HTTP 요청과 함께 서버로 보낼 데이터 
					method : "POST", // HTTP 요청 메소드(GET, POST 등) 
					dataType : "json" // 서버에서 보내줄 데이터의 타입 
				})
				.done(function(data) {
				});
			}
			reload2();
			var url3 = "${path}/cont/porderdetail/"+$("#contNo").val();
			fn_Reload03(url3);
		}

		
	</script>