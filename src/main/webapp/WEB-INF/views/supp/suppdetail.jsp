<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<div class="cnt_wr">
	<div class="row">
		<div class="col-sm-12">
			<div class="card-block table-border-style">
				<div class="table-responsive">
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
								<td><input class = "form-control" id="suppType" value="${dto.suppType}"></td>
								<th scope="row">제품명<input type="hidden" id="suppNo" value="${dto.suppNo}"></th>
								<td ><input type="text" class="form-control" id="suppTitle" name="suppTitle" value="${dto.suppTitle}" placeholder="">
									</td>
									<td>
									<button style="text-align:right;" class="btn btn-md btn-success" value="추가" onClick="fn_newLine1()">새항목 추가</button>
									</td>
							</tr>
							<tr >
								<th scope="row">모델명</th>
								<td><input type="text" style="text-align: right;"
									class="form-control" id="suppModel"
									name="suppModel" value="${dto.suppModel}" placeholder="">
								</td>
								<th scope="row">표시순위</th>
								<td colspan="2"><input type="number" style="text-align: right;"
									class="form-control num_only num_comma num_sum CHK" id="sortNo"
									name="sortNo" value="${dto.sortNo}" min="0" max="100" placeholder="">
								</td>
							</tr>
							<tr >
								<th scope="row">단가</th>
								<td><input type="text" style="text-align: right;"
									class="form-control num_only num_comma num_sum CHK" id="suppPrice"
									name="suppPrice" value="<fmt:formatNumber value="${dto.suppPrice}" pattern="#,###"/>" placeholder="">
								</td>
								<th scope="row">단위</th>
								<td colspan="2"><input type="text" style="text-align: right;"
									class="form-control num_only num_comma num_sum CHK" id="suppUnit"
									name="suppUnit" value="${dto.suppUnit}" placeholder="">
								</td>
							</tr>
							<tr>
								<th scope="row">설명</th>
								<td colspan="4"><textarea name="comment" id="comment"
										rows="8" class="form-control">${dto.comment}</textarea></td>
							</tr>
							<tr>
								<th scope="row">사용여부</th>
								<td><select name="useYn" id="useYn"
									class="form-control form-control-sm">
										<option value="Y" <c:if test = "${dto.useYn eq 'Y'}">selected</c:if> >사용</option>
										<option value="N" <c:if test = "${dto.useYn eq 'N'}">selected</c:if> >미사용</option>
								</select></td>
									<th scope="row">이미지등록</th>
									<td>
										<form id="uploadForm" enctype="multipart/form-data" method="post">
											<input type="hidden" id="uploadServerImageName" value="${dto.suppImage}">
											<input type="file" style="text-align: right;" class="form-control form-control-sm" name="suppImage" id="suppImage">
										</form>
									</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div id="udtbtn">
				<button class="btn btn-md btn-primary " onClick="fn_updateLine1()">저장</button>
			</div>
			<br>
			<div class="col-md-auto">
				<div class="card h-80">
					<h5 class="card-header">상품이미지</h5>
					<div class="card-body" id="oldImage">
						<c:if test="${dto.suppImage ne null && dto.suppImage ne ''}">
							<div id="imagebefore" style="height: 100%; background-image: url('${path}/resources/image/local/${dto.suppImage}')"></div>
						</c:if>
					</div>
					<div class="card-body" id="newImage" style="display: none">
						<img id="imagenow" style="width: 100%;">
					</div>
				</div>
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
	var messuppdata = {};
	messuppdata.suppTitle = "새자재";
	messuppdata.suppModel = "모델";
	messuppdata.suppUnit = "";
	messuppdata.suppPrice = 0;
	messuppdata.sortNo = 10;
	messuppdata.useYn = "Y";
	console.log(messuppdata);
	$.ajax({
		url : "${path}/supp/insert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
		data : messuppdata, // HTTP 요청과 함께 서버로 보낼 데이터 
		method : "POST", // HTTP 요청 메소드(GET, POST 등) 
		dataType : "json" // 서버에서 보내줄 데이터의 타입 
		})
	.done(function(data) {
		if(data.code == 10001){
			var url = "${path}/supp/listSupp01.do"; 
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
	var messuppdata = {};
	messuppdata.suppNo = $("#suppNo").val();
	messuppdata.suppTitle = $("#suppTitle").val();
	messuppdata.suppType = $("#suppType").val();
	messuppdata.suppModel = $("#suppModel").val();
	messuppdata.suppUnit = $("#suppUnit").val();
	messuppdata.suppPrice = $("#suppPrice").val().replace(/[\D\s\._\-]+/g, "");
	messuppdata.sortNo = $("#sortNo").val();
	messuppdata.useYn = $("#useYn").val();
	messuppdata.comment = $("#comment").val();
	console.log(messuppdata);
	$.ajax({
		url : "${path}/supp/update.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
		data : messuppdata, // HTTP 요청과 함께 서버로 보낼 데이터 
		method : "POST", // HTTP 요청 메소드(GET, POST 등) 
		dataType : "json" // 서버에서 보내줄 데이터의 타입 
		})
	.done(function(data) {
		if(data.code == 10001){
			var url = "${path}/supp/listSupp01.do"; 
			fn_Reload02(url);
			}else{
			alert("저장 실패");
			}
		}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
		.fail(function(xhr, status, errorThrown) { 
		alert("통신 실패");
		});
	}

		$("#suppImage").change(function (event) {
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
	</script>