<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<table class="table table-sm bst02">
	<colgroup>
		<col width="15%" />
		<col width="35%" />
		<col width="15%" />
		<col width="20%" />
		<col width="15%" />
	</colgroup>
	<tbody>
		<tr>
			<th>구분</th>
			<td>
				<select class="form-control" id="inoutType">
					<option value="I" <c:if test="${dto.inoutTyp eq 'I'}">selected</c:if>>입 고</option>
					<option value="O" <c:if test="${dto.inoutTyp eq 'O'}">selected</c:if>>출 고</option>
				</select>
			</td>
			<th scope="row">상품명<input type="hidden" id="storeioNo" value="${dto.storeioNo}"></th>
			<td colspan="2"><select id="selgoodsNo" class="form-control">
				<option value="">선택</option>
				<c:forEach var="rowg" items="${goods}">
					<option value="${rowg.goodsNo}" <c:if test="${dto.goodsNo eq rowg.goodsNo}">selected</c:if> >${rowg.goodsTitle}(${rowg.goodsModel})</option>
				</c:forEach>
			</select></td>
		</tr>
		<tr>
			<th scope="row">수량</th>
			<td>
				<input type="text" style="text-align: right;" class="form-control num_only num_comma num_sum CHK" id="storeQty" name="storeQty" value="<fmt:formatNumber value="${dto.storeQty}" pattern="#,###"/>" placeholder="">
			</td>
			<th scope="row">단위</th>
			<td colspan="2"><input type="text" style="text-align: right;" class="form-control num_only num_comma num_sum CHK" id="storeUnit" name="storeUnit" value="${dto.storeUnit}" placeholder=""></td>
		</tr>
		<tr>
			<th>위치</th>
			<td><select class="form-control" id="locateCode">
					<c:forEach var="rowg" items="${locc}">
						<option value="${rowg.codeNo}"<c:if test="${dto.locateCode eq rowg.codeNo}">selected</c:if>>${rowg.codeDesc}(${rowg.mesCode})</option>
					</c:forEach>
			</select></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<th scope="row">설명</th>
			<td colspan="4"><textarea name="comment" id="comment" rows="4" class="form-control">${dto.comment}</textarea></td>
		</tr>
		<tr>
			<td colspan="5" style="text-align: right">
			<button class="btn btn-md btn-success"  onclick="<c:if test="${empty storeioNo}">fnInsertGoodsIo()</c:if><c:if test="${not empty storeioNo}">fnUpdateGoodsIo()</c:if>">
				<c:if test="${empty storeioNo}">저장</c:if><c:if test="${not empty storeioNo}">수정</c:if>
			</button>
			<c:if test="${not empty storeioNo}">
				<button class="btn btn-md btn-warning" onclick="fnDeleteGoods();">삭제</button>
			</c:if>
			</td>
		</tr>
	</tbody>
</table>

<table class="table table-striped table-bordered nowrap" id="storelistTable">
	<thead>
	<tr>
		<th scope="col" width="100" align="center">구분</th>
		<th scope="col" width="200" align="center">상품명</th>
		<th scope="col" width="100" align="center">단위</th>
		<th scope="col" width="100" align="center">입고량</th>
		<th scope="col" width="100" align="center">출고량</th>
		<th scope="col" width="100" align="center">발행일자</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="row" items="${list01}">
		<tr>
			<td class="first">${row.goodsType}</td>
			<td><a href="javascript:fn_Reload03('${path}/store/detailgoodsio/${row.storeioNo}')">${row.goodsTitle}(${row.goodsModel})</a></td>
			<td>${row.goodsUnit}</td>
			<td style="text-align: right"><c:if test="${row.inoutTyp eq 'I'}"><fmt:formatNumber value="${row.storeQty}" pattern="#,###" /></c:if></td>
			<td style="text-align: right"><c:if test="${row.inoutTyp eq 'O'}"><fmt:formatNumber value="${row.storeQty}" pattern="#,###" /></c:if></td>
			<td>${row.regDate}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>

<script>
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

	function fnDeleteGoods(){
		if(!confirm("정말 삭제하시겠습니까?")){
			return false;
		}
		var messtoredata = {};
		messtoredata.storeioNo = $("#storeioNo").val();
		console.log(messtoredata);
		$.ajax({
			url : "${path}/store/delete.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
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

	function fn_Reload03(url, data){
		$("#detailstore").empty();
		$("#detailstore").load(url, data, function(){
			setTimeout(function(){
			}, 500);
		});
	}
</script>