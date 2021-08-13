<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

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
								<th style="text-align: center" scope="row">사용자 이름<input
									type="hidden" id="userId" value="${list.userId}">
									</th>
								<td><input type="text" class="form-control"
									id="unamk" value="${list.userName}" placeholder=""></td>
								<th style="text-align: center" scope="row">로그인아이디</th>
								<td><input class="form-control" type="text" id="uId" value="${list.userId}"></td>
								<td>
									<button style="text-align: right;" class="btn btn-md btn-success" value="추가"
										onClick="fn_setNewuser()">새사용자 추가</button>
								</td>
							</tr>
							<tr>
								<th style="text-align: center" scope="row">권한</th>
								<td><select class="urole form-control" id="urank">
										<option value="CUSER"
											<c:if test="${list.userRole eq 'CUSER'}">selected</c:if>>일반
											사용자</option>
										<option value="ADMIN"
											<c:if test="${list.userRole eq 'ADMIN'}">selected</c:if>>관리자</option>
								</select></td>
								<th style="text-align: center" scope="row">로그인허용</th>
								<td colspan="2"><select class="form-control" id="ulogin">
										<option value="Y">예</option>
										<option value="N">아니오</option>
								</select></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<c:if test="${not empty list.userId}">
				<div id="udtbtn">
					<button class="btn btn-md btn-primary " onClick="fn_Updateuser()">저장</button>
				</div>
			</c:if>
			<c:if test="${empty list.userId}">
				<div id="istbtn">
					<button class="btn btn-md btn-primary " onClick="fn_Insertuser()">새로
						저장</button>
				</div>
			</c:if>
			<br>
		</div>
	</div>
</div>
<style>
.card-body>div {
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
		

	</script>