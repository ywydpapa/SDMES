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
							<col width="20%" />
							<col width="30%" />
							<col width="15%" />
							<col width="20%" />
							<col width="15%" />
						</colgroup>
						<tbody>
							<tr>
								<th style="text-align: center;">요청계약명</th>
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
								<td>
									<input type="date" style="text-align: right;" class="form-control" id="deliveryDate" value="${dto.deliveryDate}">
								</td>
								<th scope="row" style="text-align: center;">계약금액</th>
								<td colspan="2">
									<input type="text" style="text-align: right;" class="form-control num_only num_comma num_sum CHK" id="contAmount" value="<fmt:formatNumber value="${dto.contAmount}" pattern="#,###"/>" placeholder="">
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
							<tr >
								<th scope="row" style="text-align: center;">계약담당</th>
								<td colspan="1">
								<select id="contPic" class="form-control">
								<option value="">담당자 선택</option>
								<c:forEach var="pic" items="${pic}">
										<option value="${pic.userNo}"<c:if test="${dto.contPic eq pic.userNo}">selected</c:if> >${pic.userName}</option>
								</c:forEach>
								</select>
								</td>
							</tr>
							
							<tr>
								<th scope="row">첨부파일 등록</th>
								<td colspan="2">
										<form id="uploadForm">
											<input type="file" name="file" id="fileUpload" style="max-width: 70%; display: inline-block; text-align: left; float: left;" class="form-control form-control-sm"/>
										</form>
										<button type="button" style="display: inline-block; float: left; margin-left: 5px;" class="btn btn-sm btn-info" onclick="uploadFile()">첨부파일 등록</button>
								</td>
							</tr>
							<tr>
								<th scope="row">첨부파일 설명</th>
								<td colspan="4">
									<div>
										<textarea style="width: 100%" name="content" id="fileDesc"></textarea>
									</div>
								</td>
							</tr>
							<tr >
								<th scope="row">첨부파일 리스트</th>
								<td colspan="4">
									<table id="scrolltbody" class="scrolltbody">
										<thead>
											<th>파일이름</th>
											<th>등록일</th>
											<th>용량(byte)</th>
											<th>설명</th>
											<th>삭제</th>
										</thead>
										<tbody>
											<c:forEach var="item" items="${fileList}">
												<tr>
													<td title="${item.fileName}"><a href="javascript:downloadFile('${item.fileId}');" style="text-decoration: underline">${item.fileName}</a></td>
													<td>${item.regDatetime}</td>
													<td title="${item.fileSize}">${item.fileSize}</td>
													<td title="${item.fileDesc}">${item.fileDesc}</td>
													<td style="text-align: center;"><button class="btn btn-sm btn-dark" onclick="javascript:deleteFile('${item.fileId}');">삭제</button></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<th scope="row" style="text-align: center;">설명</th>
								<td colspan="4"><textarea name="comment" id="comment" rows="8" class="form-control">${dto.comment}</textarea></td>
							</tr>
							<tr class="addgoods" align="center">
								<th>계약상품</th>
								<td>
									<select class="form-control" id="contgoods">
										<option value="">선택</option>
										<c:forEach var="goods" items="${goods}">
											<option value="${goods.goodsNo}">${goods.goodsTitle}(${addg.goodsModel})</option>
										</c:forEach>
									 </select>
								</td>
								<td colspan="2">
									<input style="text-align:right" type="number" class="form-control" id="contgoodsqty" min="0"	value="0">
								</td>
								<td><button class="form-control"onclick="fn_addgoods()">추가</button></td>
								<td></td>
							</tr>
							<c:forEach var="addg" items="${addgoods}">
								<tr class="addgoods">
									<td></td>
									<td style="text-align:center">${addg.goodsTitle}(${addg.goodsModel})</td>
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
				<button class="btn btn-md btn-primary " onClick="<c:if test="${empty dto.contNo}">fn_newReq1()</c:if><c:if test="${not empty dto.contNo}">fn_updateReq1()</c:if>">
				<c:if test="${empty dto.contNo}">새계약 요청 저장</c:if><c:if test="${not empty dto.contNo}">요청계약 수정</c:if></button>
				<c:if test="${not empty dto.contNo}">
				<c:if test="${userRole eq 'ADMIN'}"><button class="btn btn-md btn-primary " onClick="fn_updateReqok()">승인</button></c:if>
				<c:if test="${userRole eq 'ADMIN'}"><button class="btn btn-md btn-primary " onClick="fn_updateReqrj()">반려</button></c:if>
				</c:if>
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

	.scrolltbody {
		display: block;
		width: 100%;
		max-width: 819px;
		border-collapse: collapse;
		border: 2px solid #000;
	}
	.scrolltbody th { border: 1px solid #000; background: #A9E1ED; }
	.scrolltbody td { border: 1px solid #000; border-top: 0; }
	.scrolltbody tbody {
		display: block;
		height: 200px;
		overflow-y: scroll;
		overflow-x: hidden;
	}
	.scrolltbody th:nth-of-type(1), .scrolltbody td:nth-of-type(1) { min-width: 360px; max-width: 360px; width: 360px; text-overflow: ellipsis; overflow: hidden;}
	.scrolltbody th:nth-of-type(2), .scrolltbody td:nth-of-type(2) { min-width: 110px; max-width: 110px; width: 110px; text-overflow: ellipsis; overflow: hidden;}
	.scrolltbody th:nth-of-type(3), .scrolltbody td:nth-of-type(3) { min-width: 100px; max-width: 100px; width: 100px; text-overflow: ellipsis; overflow: hidden;}
	.scrolltbody th:nth-of-type(4), .scrolltbody td:nth-of-type(4) { min-width: 150px; max-width: 150px; width: 150px; text-overflow: ellipsis; overflow: hidden;}
	/*.scrolltbody th:nth-of-type(5), .scrolltbody td:nth-of-type(5) { min-width: 75px; }*/
	.scrolltbody th:last-child { min-width: 95px; }
	.scrolltbody td:last-child { min-width: calc( 95px - 19px );}
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

	function fn_newReq1(){
		var mescontdata = {};
		mescontdata.custNo = $("#custNo").val();
		mescontdata.contAmount = $("#contAmount").val().replace(/[\D\s\._\-]+/g, "");
		mescontdata.deliveryDate = $("#deliveryDate").val();
		mescontdata.contDate = $("#contDate").val();
		mescontdata.contNation = $("#contNation").val();
		mescontdata.comment = $("#comment").val();
		mescontdata.contTitle = $("#contTitle").val();
		mescontdata.contPic = $("#contPic").val();
		<c:if test="${not empty tempFileld}">
		mescontdata.tempFileld = '${tempFileld}';
		</c:if>
		console.log(mescontdata);
		$.ajax({
			url : "${path}/cont/insertreq.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
			data : mescontdata, // HTTP 요청과 함께 서버로 보낼 데이터
			method : "POST", // HTTP 요청 메소드(GET, POST 등)
			dataType : "json" // 서버에서 보내줄 데이터의 타입
		}).done(function(data) {
			if(data.code == 10001){
				var url = "${path}/cont/listreq.do";
				fn_Reload02(url);
			}else{
				alert("저장 실패");
			}
		}).fail(function(xhr, status, errorThrown) {
			alert("통신 실패");
		});
	}

	function fn_updateReqok(){
		var mescontdata = {};
		mescontdata.contNo = $("#contNo").val();
		mescontdata.custNo = $("#custNo").val();
		mescontdata.contAmount = $("#contAmount").val().replace(/[\D\s\._\-]+/g, "");
		mescontdata.deliveryDate = $("#deliveryDate").val();
		mescontdata.contDate = $("#contDate").val();
		mescontdata.contNation = $("#contNation").val();
		mescontdata.comment = $("#comment").val();
		mescontdata.contTitle = $("#contTitle").val();
		mescontdata.contPic = $("#contPic").val();
		console.log(mescontdata);
		$.ajax({
			url : "${path}/cont/reqOk.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
			data : mescontdata, // HTTP 요청과 함께 서버로 보낼 데이터
			method : "POST", // HTTP 요청 메소드(GET, POST 등)
			dataType : "json" // 서버에서 보내줄 데이터의 타입
		}).done(function(data) {
			if(data.code == 10001){
				var url = "${path}/cont/listreq.do";
				fn_Reload02(url);
				newreq();
				}else{
				alert("저장 실패");
				}
		}).fail(function(xhr, status, errorThrown) {
			alert("통신 실패");
		});
	}
	
	function fn_updateReqrj(){
		var mescontdata = {};
		mescontdata.contNo = $("#contNo").val();
		mescontdata.custNo = $("#custNo").val();
		mescontdata.contAmount = $("#contAmount").val().replace(/[\D\s\._\-]+/g, "");
		mescontdata.deliveryDate = $("#deliveryDate").val();
		mescontdata.contDate = $("#contDate").val();
		mescontdata.contNation = $("#contNation").val();
		mescontdata.comment = $("#comment").val();
		mescontdata.contTitle = $("#contTitle").val();
		mescontdata.contPic = $("#contPic").val();
		console.log(mescontdata);
		$.ajax({
			url : "${path}/cont/reqRj.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
			data : mescontdata, // HTTP 요청과 함께 서버로 보낼 데이터
			method : "POST", // HTTP 요청 메소드(GET, POST 등)
			dataType : "json" // 서버에서 보내줄 데이터의 타입
		}).done(function(data) {
			if(data.code == 10001){
				var url = "${path}/cont/listreq.do";
				fn_Reload02(url);
				newreq();
				}else{
				alert("저장 실패");
				}
		}).fail(function(xhr, status, errorThrown) {
			alert("통신 실패");
		});
	}

	
	function fn_updateReq1(){
		var mescontdata = {};
		mescontdata.contNo = $("#contNo").val();
		mescontdata.custNo = $("#custNo").val();
		mescontdata.contAmount = $("#contAmount").val().replace(/[\D\s\._\-]+/g, "");
		mescontdata.deliveryDate = $("#deliveryDate").val();
		mescontdata.contDate = $("#contDate").val();
		mescontdata.contNation = $("#contNation").val();
		mescontdata.comment = $("#comment").val();
		mescontdata.contTitle = $("#contTitle").val();
		mescontdata.contPic = $("#contPic").val();
		console.log(mescontdata);
		$.ajax({
			url : "${path}/cont/updateReq.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
			data : mescontdata, // HTTP 요청과 함께 서버로 보낼 데이터
			method : "POST", // HTTP 요청 메소드(GET, POST 등)
			dataType : "json" // 서버에서 보내줄 데이터의 타입
		}).done(function(data) {
			if(data.code == 10001){
				var url = "${path}/cont/listreq.do";
				fn_Reload02(url);
				}else{
				alert("저장 실패");
				}
		}).fail(function(xhr, status, errorThrown) {
			alert("통신 실패");
		});
	}

	function fn_addgoods(){
		var CONid = $("#contNo").val();
		if (CONid != ""){
			var contaddgoods = {};
			contaddgoods.contNo = Number(CONid);
			contaddgoods.goodsNo = $("#contgoods").val();
			contaddgoods.goodsQty = $("#contgoodsqty").val();
			if(contaddgoods.goodsNo == ""){
				alert("상품을 선택해 주세요.");
				$("#contgoods").focus();
				return;
			} else if(contaddgoods.goodsQty < 1){
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
			}).done(function(res) {
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
		} else {
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
		}).done(function(data) {
			alert("삭제성공");
			$(e).parent().parent().remove();
		});
	}

	function fileListLoad(){
		$("#scrolltbody > tbody").empty();
		$("#fileUpload").val("");
		$("#fileDesc").val("");

		var contNo = $("#contNo").val();
		if(contNo == "") {
			contNo = 0;
		}

		<c:if test="${not empty tempFileld}">
		var loadData = {};
		loadData.tempFileld = '${tempFileld}';
		</c:if>

		$.ajax({
			url : "${path}/contFile/listFile/"+contNo,
			<c:if test="${not empty tempFileld}">
			data : loadData,
			</c:if>
			method : "GET",
		}).done(function(result){
			if(result.code == 10001){
				if(result.data.length > 0){
					var html = "";
					var data = result.data;
					for(var i=0; i<data.length; i++){
						html = html + '<tr>' +
								'<td title="'+data[i].fileName+'"><a href="javascript:downloadFile(\''+data[i].fileId+'\');" style="text-decoration: underline">'+data[i].fileName+'</a></td>'+
								'<td>'+data[i].regDatetime+'</td>'+
								'<td title="'+data[i].fileSize+'">'+data[i].fileSize+'</td>'+
								'<td title="'+data[i].fileDesc+'">'+data[i].fileDesc+'</td>'+
								'<td style="text-align: center;"><button class="btn btn-sm btn-dark" onclick="javascript:deleteFile(\''+data[i].fileId+'\');">삭제</button></td>'+
							'</tr>';
					}
					$("#scrolltbody > tbody").html(html);
				}
			}else {
				alert('파일 리스트 불러오기 실패');
			}
		}).fail(function(xhr, status, errorThrown) {
			alert("통신 실패");
		});
	}

	function uploadFile() {
		var formData = new FormData($('#uploadForm')[0]);
		formData.append('fileDesc', $('#fileDesc').val());
		<c:if test="${not empty tempFileld}">
		formData.append('tempFileld', '${tempFileld}');
		</c:if>

		var contNo = $("#contNo").val();
		if(contNo == "") {
			contNo = 0;
		}

		if(!formData.get('file').name) {
			alert('파일을 선택해주세요');
		}else {
			$.ajax({
				url : "${path}/contFile/uploadFile/"+contNo,
				method : "POST",
				data : formData,
				contentType : false,
				processData : false
			}).done(function(result){
				if(result.code == 10001){
					alert('파일 업로드 완료');
					fileListLoad();
				}else {
					alert('파일 업로드 실패');
				}
			}).fail(function(xhr, status, errorThrown) {
				alert("통신 실패");
			});
		}
	}

	function deleteFile(fileId) {
		if(!confirm("정말 삭제하시겠습니까?")){
			return false;
		}

		var contNo = $("#contNo").val();
		if(contNo == "") {
			contNo = 0;
		}

		var deleteData = {};
		deleteData.contNo = contNo;
		deleteData.fileId = fileId;

		$.ajax({
			url : "${path}/contFile/deleteFile/"+contNo+"/"+fileId,
			data : deleteData,
			method : "POST",
		}).done(function(result, status, xhr){
			if(result.code == 10001){
				alert('파일 삭제 완료');
				fileListLoad();
			}else {
				alert('파일 삭제 실패');
			}
		}).fail(function(xhr, status, errorThrown) {
			alert("통신 실패");
		});
	}


	function downloadFile(fileId) {
		var downloadData = {};
		downloadData.contNo = $("#contNo").val();
		downloadData.fileId = fileId;

		$.ajax({
			url : "${path}/contFile/downloadFile/"+$("#contNo").val()+"/"+fileId,
			data : downloadData,
			method : "POST",
			xhrFields: {
				responseType: 'blob'
			},
		}).done(function(data, status, xhr){
			var fileName = xhr.getResponseHeader('content-disposition');
			var link = document.createElement('a');
			link.href = window.URL.createObjectURL(data);
			link.download = fileName;
			link.click();
		}).fail(function(xhr, status, errorThrown) {
			alert("통신 실패");
		});
	}
</script>