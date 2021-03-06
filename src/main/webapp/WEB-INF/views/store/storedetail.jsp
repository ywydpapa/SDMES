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
								<td><input class = "from-control" id="typename" value="" readonly></td>
								<th scope="row">제단명<input type="hidden" id="altarID" value="${dto.ALTAR_ID}"></th>
								<td ><input type="text"
									class="form-control"
									id="altarTitle" name="altarTitle" value="${dto.ALTAR_TITLE}" placeholder="">
									</td>
									<td>
									<button style="text-align:right;" class="btn btn-md btn-success" value="추가" onClick="fn_setinsert()">새항목 추가</button>
									</td>
							</tr>
							<tr >
								<th scope="row">단가</th>
								<td><input type="text" style="text-align: right;"
									class="form-control num_only num_comma num_sum CHK" id="priceNet"
									name="priceNet" value="<fmt:formatNumber value="${dto.ALTAR_NET_PRICE}" pattern="#,###"/>" placeholder="">
								</td>
								<th scope="row">기본수량</th>
								<td colspan="2"><input type="text" style="text-align: right;"
									class="form-control num_only num_comma num_sum CHK" id="intQty"
									name="intQty" value="${dto.ALTAR_QTY}" placeholder="">
								</td>
							</tr>
							
							<tr >
								<th scope="row">판매금액</th>
								<td colspan="4"><input type="text"
									class="form-control text-right font-weight-bold num_only num_comma num_sum CHK" readonly
									id="priceSale" name="priceSale" value="<fmt:formatNumber value="${dto.ALTAR_AMOUNT}" pattern="#,###"/>" placeholder="">
							</tr>
							<tr>
								<th scope="row">설명</th>
								<td colspan="4"><textarea name="altarRemark" id="altarRemark"
										rows="8" class="form-control">${dto.ALTAR_REMARK}</textarea></td>
							</tr>
							<tr>
								<th scope="row">사용여부</th>
								<td><select name="useYn" id="useYn"
									class="form-control form-control-sm">
										<option value="Y">사용</option>
										<option value="N">미사용</option>
								</select></td>
									<th scope="row">이미지등록</th>
									<td>
										<form id="uploadForm" enctype="multipart/form-data" method="post">
											<input type="hidden" id="uploadServerImageName" value="${dto.ALTAR_IMAGE}">
											<input type="file" style="text-align: right;" class="form-control form-control-sm" name="altarImage" id="altarImage">
										</form>
									</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div id="udtbtn">
				<button class="btn btn-md btn-primary " onClick="fn_Updatealtar()">저장</button>
			</div>
			<div id="istbtn">
				<button class="btn btn-md btn-primary " onClick="fn_Insertaltar()">새로 저장</button>
			</div>
			<br>
			<div class="col-md-auto">
				<div class="card h-80">
					<h5 class="card-header">상품이미지</h5>
					<div class="card-body" id="oldImage">
						<c:if test="${dto.ALTAR_IMAGE ne null && dto.ALTAR_IMAGE ne ''}">
							<div id="imagebefore" style="height: 100%; background-image: url('${path}/resources/image/local/${dto.ALTAR_IMAGE}')"></div>
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
			$('#USE_YN').val('${dto.ALTAR_USE_YN}').prop("selected",true);
			$('#altarTypeb').val('${dto.ALTAR_CAT}').prop("selected",true);
			$('#istbtn').hide();
			var name = $('#ALTAR_TYP option:selected').text();
			console.log(name);
			$('#typename').val(name);

		});
		
		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

		function numberWitioutCommas(x) {
			  return x.toString().replace(/[\D\s\._\-]+/g, "");
		}

	    function recal() {
				var sum1 = parseInt(($("#priceNet").val().replace(/[\D\s\._\-]+/g, "")) || 0);
				var sum2 = parseInt(($("#intQty").val().replace(/[\D\s\._\-]+/g, "")) || 0);
				var sum = sum1 * sum2;
				$("#priceSale").val(numberWithCommas(sum));
				$("#priceNet").val(numberWithCommas(sum1));
		}
		  
	    $(".CHK").change(function(){
			recal();  
	    });

		$("#altarImage").change(function (event) {
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