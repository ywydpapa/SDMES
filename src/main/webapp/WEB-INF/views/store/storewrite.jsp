<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
							<col width="35%" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">재고구분</th>
								<td><input type="text"
									class="form-control"
									id="typename" name="typename" value="" readonly placeholder=""></td>
								<td></td>
								<td style="text-align:right;"><button class="btn btn-md btn-success" onClick="fn_setinsert()">새항목 추가</button></td>
								</tr>
								<tr class="alt_B">
								<th scope="row">종류</th>
								<td><input type="text" style="text-align: right;"
									class="form-control num_only num_comma num_sum CHK" id="priceSale"
									name="priceSale" value="<fmt:formatNumber value="${dto.FTABLE_AMOUNT}" pattern="#,###"/>" placeholder="">
									<input type="hidden" id="ftableID" value="${dto.FTABLE_ID}">
								</td>
								<th scope="row">단위</th>
								<td><input type="text" style="text-align: right;"
									class="form-control num_only num_comma num_sum CHK" id="intUnit"
									name="intUnit" value="${dto.FTABLE_UNIT}" placeholder="">
								</td>
							</tr>
							<tr>
								<th scope="row">설명</th>
								<td colspan="3"><textarea name="altarRemark" id="altarRemark"
										rows="8" class="form-control">${dto.FTABLE_REMARK}</textarea></td>
							</tr>
							<tr>
								<th scope="row">정렬순서</th>
								<td><input type="number" style="text-align: right;"
									class="form-control num_only num_comma num_sum CHK" id="sortNo"
									name="sortNo" value="${dto.FTABLE_ORDER}"  min="0" max="1000" placeholder="">
								</td>
								<th scope="row">사용여부</th>
								<td><select name="useYn" id="useYn"
									class="form-control form-control-sm">
										<option value="Y">사용</option>
										<option value="N">미사용</option>
								</select></td>
							</tr>
							<tr>
								<th scope="row">이미지등록</th>
								<td>
									<form id="uploadForm" enctype="multipart/form-data" method="post">
										<input type="hidden" id="uploadServerImageName" value="${dto.FTABLE_IMAGE}">
										<input type="file" style="text-align: right;" class="form-control form-control-sm" name="altarImage" id="altarImage">
									</form>
								</td>
								<th></th>
								<td></td>
							</tr>
							
						</tbody>
					</table>
				</div>
			</div>
			<div id="udtbtn">
				<button class="btn btn-md btn-primary alt_D" onClick="fn_Updateftable()">저장</button>
			</div>
			<div id="istbtn">
				<button class="btn btn-md btn-primary alt_D" onClick="fn_Inserttable()">새로 저장</button>
			</div>
			<br>
			<div class="col-md-auto">
        		<div class="card h-80">
					<h5 class="card-header">상품이미지</h5>
					<div class="card-body" id="oldImage">
						<c:if test="${dto.FTABLE_IMAGE ne null && dto.FTABLE_IMAGE ne ''}">
							<div id="imagebefore" style="height: 100%; background-image: url('${path}/resources/image/local/${dto.FTABLE_IMAGE}')"></div>
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