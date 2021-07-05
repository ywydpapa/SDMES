<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<div class="cnt_wr">
	<div class="row">
		<div class="col-sm-12">
			<div class="card-block table-border-style">
				<div class="table-responsive">
					<table id="contdtlTable" class="table table-sm bst02">
						<colgroup>
							<col width="15%" />
							<col width="35%" />
							<col width="15%" />
							<col width="20%" />
							<col width="15%" />
						</colgroup>
						<tbody>
							<tr>
								<th style="text-align: center;">계약명</th>
								<td><input class = "form-control" id="contTitle" value="${dto.contTitle}"></td>
								<th scope="row" style="text-align: center;">납품처<input type="hidden" id="contNo" value="${dto.contNo}"></th>
								<td colspan="2">
								<select id="custNo" class="form-control">
								<c:forEach var="cust" items="${cust}">
										<option value="${cust.codeNo}">${cust.codeDesc}(${cust.mesCode})</option>
								</c:forEach>
								</select>
								</td>
							</tr>
							<tr >
								<th scope="row" style="text-align: center;">납품예정일자</th>
								<td><input type="date" style="text-align: right;"
									class="form-control" id="deliveryDate"
									value="${dto.deliveryDate}">
								</td>
								<th scope="row" style="text-align: center;">계약금액</th>
								<td colspan="2"><input type="text" style="text-align: right;"
									class="form-control num_only num_comma num_sum CHK" id="contAmount"
									value="<fmt:formatNumber value="${dto.contAmount}" pattern="#,###"/>" placeholder="">
								</td>
							</tr>
							<tr >
								<th scope="row" style="text-align: center;">계약일자</th>
								<td><input type="date" style="text-align: right;"
									class="form-control" id="contDate"
									value="${dto.contDate}">
								</td>
								<th scope="row" style="text-align: center;">납품국가</th>
								<td colspan="2">
								<select id="contNation" class="form-control">
								<option value="">국가 선택</option>
								<c:forEach var="nation" items="${nation}">
										<option value="${nation.codeNo}"<c:if test="${dto.contNation eq nation.codeNo}">selected</c:if> >${nation.codeDesc}(${nation.mesCode})</option>
								</c:forEach>
								</select>
								</td>
							</tr>
							<tr>
							<th scope="row">첨부파일 등록</th>
								<td>
									<form action = "${path}/cont/fileUpload.do"id="uploadForm" enctype="multipart/form-data" method="post">
										<input type="hidden" id="uploadServerImageName" value="${dto.fileName}">
										<input type="file" style="text-align: right;" class="form-control form-control-sm" name="uploadFile" id="uploadFile">
									</form>
								</td>
							</tr>
							<tr>
								<th scope="row" style="text-align: center;">설명</th>
								<td colspan="4"><textarea name="comment" id="comment"
										rows="8" class="form-control">${dto.comment}</textarea></td>
							</tr>
									<tr class="addgoods" align="center">
													<th>계약상품</th>
													<td>
														<select class="form-control" id="contgoods">
															<option value="">선택</option>
															<c:forEach var="goods" items="${goods}">
																<option value="${goods.goodsNo}">${goods.goodsTitle}</option>
															</c:forEach>
													     </select>
													</td>
													<td colspan="2"><input style="text-align:right" type="number" class="form-control" id="contgoodsqty"
													min="0"	value="0">
													</td>
													<td><button class="form-control"onclick="fn_addgoods()">추가</button></td>
													<td></td>
													</tr>
												<c:forEach var="addg" items="${addgoods}">
													<tr class="addgoods"> 
													<td></td>
													<td style="text-align:center">${addg.goodsTitle}</td>
													<td style="text-align:right">${addg.goodsQty}</td>
													<td></td>
													<td><button onclick="fn_delgoods('${addg.contdtlNo}',this)">삭제</button></td>
													</tr>
												</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div id="udtbtn">
				<button class="btn btn-md btn-primary " onClick="<c:if test="${empty dto.contNo}">fn_newLine1()</c:if><c:if test="${not empty dto.contNo}">fn_updateLine1()</c:if>">
				<c:if test="${empty dto.contNo}">새계약 저장</c:if><c:if test="${not empty dto.contNo}">계약 수정</c:if></button>
				<c:if test="${dto.attrib eq '10000'}"><button class="btn btn-md btn-success " onClick="fn_SetPorder()">생산지시</button></c:if>
			</div>
		</div>
	</div>
</div>
<style>
	.card-body > div {
		background-size: contain;
		background-repeat: no-repeat;
		width: 100%;
		height: 0;
		padding-top: 66.64%;
	}
</style>
<!--//상품등록-->

	<script>
		$(document).ready(function() {
		});
		
		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

		function numberWitioutCommas(x) {
			  return x.toString().replace(/[\D\s\._\-]+/g, "");
		}
		
function fn_newLine1(){
	var mescontdata = {};
	mescontdata.custNo = $("#custNo").val();
	mescontdata.contAmount = $("#contAmount").val().replace(/[\D\s\._\-]+/g, "");
	mescontdata.deliveryDate = $("#deliveryDate").val();
	mescontdata.contDate = $("#contDate").val();
	mescontdata.contNation = $("#contNation").val();
	mescontdata.comment = $("#comment").val();
	mescontdata.contTitle = $("#contTitle").val();
	console.log(mescontdata);
	$.ajax({
		url : "${path}/cont/insert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
		data : mescontdata, // HTTP 요청과 함께 서버로 보낼 데이터 
		method : "POST", // HTTP 요청 메소드(GET, POST 등) 
		dataType : "json" // 서버에서 보내줄 데이터의 타입 
		})
	.done(function(data) {
		if(data.code == 10001){
			var url = "${path}/cont/listcont.do"; 
			fn_Reload02(url);
			}else{
			alert("저장 실패");
			}
		}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
		.fail(function(xhr, status, errorThrown) { 
		alert("통신 실패");
		});
	}
	
	function fn_SetPorder(){
		var mesporder = {};
		mesporder.contNo = $("#contNo").val();
		mesporder.comment = $("#comment").val();
		console.log(mesporder);
		$.ajax({
			url : "${path}/cont/setPorder.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
			data : mesporder, // HTTP 요청과 함께 서버로 보낼 데이터 
			method : "POST", // HTTP 요청 메소드(GET, POST 등) 
			dataType : "json" // 서버에서 보내줄 데이터의 타입 
			})
		.done(function(data) {
			if(data.code == 10001){
				var url = "${path}/cont/listcont.do"; 
				fn_Reload02(url);
				}else{
				alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
			.fail(function(xhr, status, errorThrown) { 
			alert("통신 실패");
			});
	}
			
function fn_updateLine1(){
	var mescontdata = {};
	mescontdata.contNo = $("#contNo").val();
	mescontdata.custNo = $("#custNo").val();
	mescontdata.contAmount = $("#contAmount").val().replace(/[\D\s\._\-]+/g, "");
	mescontdata.deliveryDate = $("#deliveryDate").val();
	mescontdata.contDate = $("#contDate").val();
	mescontdata.contNation = $("#contNation").val();
	mescontdata.comment = $("#comment").val();
	mescontdata.contTitle = $("#contTitle").val();
	console.log(mescontdata);
	$.ajax({
		url : "${path}/cont/update.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
		data : mescontdata, // HTTP 요청과 함께 서버로 보낼 데이터 
		method : "POST", // HTTP 요청 메소드(GET, POST 등) 
		dataType : "json" // 서버에서 보내줄 데이터의 타입 
		})
	.done(function(data) {
		if(data.code == 10001){
			var url = "${path}/cont/listcont.do"; 
			fn_Reload02(url);
			}else{
			alert("저장 실패");
			}
		}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
		.fail(function(xhr, status, errorThrown) { 
		alert("통신 실패");
		});
	}

		$("#goodsImage").change(function (event) {
			var formData = new FormData(document.getElementById("uploadForm"));
			if(this.files && this.files[0]){
				var reader = new FileReader();
				reader.onload = function (data) {
					$("#oldImage").remove();
					$("#newImage").show();
					$("#imagenow").attr("src", data.target.result);
				}
				reader.readAsDataURL(this.files[0]);
			}
			$.ajax({
				type: "post",
				url	:'${path}/file/upload',
				data: formData,
				contentType: false,
				processData: false,
				success:function (data){
					console.log(data);
					$("#uploadServerImageName").val(data);
					console.log('이미지 업로드 성공');
				}
			})
		})
		
		
function fn_addgoods(){
		var CONid = $("#contNo").val();
		if (CONid != ""){
		var contaddgoods ={};
		contaddgoods.contNo = Number(CONid);
		contaddgoods.goodsNo = $("#contgoods").val();
		contaddgoods.goodsQty = $("#contgoodsqty").val();
		if(contaddgoods.goodsNo == ""){
			alert("상품을 선택해 주세요.");
			$("#contgoods").focus();
			return;
		}
		else if(contaddgoods.goodsQty < 1){
			alert("수량을 입력해 주세요.");
			$("#contgoodsqty").focus();
			return;
		}
		console.log(contaddgoods);
		$.ajax({
			url : "${path}/cont/addgoods.do",  
			data : contaddgoods,  
			method : "POST",  
			dataType : "json"  
		})
		.done(function(res) {
		alert("저장성공");
		var innerHtml = "";
		innerHtml += '<tr> <td></td>';
		innerHtml += '<td style="text-align:center">'+$("#contgoods option:checked").text()+' </td>';
		innerHtml += '<td style="text-align:right">'+$("#contgoodsqty").val()+'</td>';
		innerHtml += '<td></td>';
		innerHtml += '<td><button onclick="fn_delgoods(\''+res.data+'\',this)">삭제</button></td>';
		innerHtml += "</tr>";
		$("#contdtlTable > tbody > tr[class=addgoods]:last").after(innerHtml);
		$("#contgoods").val("");
		$("#contgoodsqty").val("0");
		});
		}
		else
			{
			alert("계약기본사항을 먼저 저장해 주세요!!");
			}
	}	
		
		
		function fn_delgoods(contdtlNo, e){
			var contdeladdgoods ={};
			contdeladdgoods.contdtlNo = Number(contdtlNo); 
			console.log(contdeladdgoods);

			$.ajax({
				url : "${path}/cont/deladdgoods.do",  
				data : contdeladdgoods,  
				method : "POST",  
				dataType : "json"  
			})
			.done(function(data) {
				alert("삭제성공");
				$(e).parent().parent().remove();
			});
		}

	</script>