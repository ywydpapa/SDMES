<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<div class="cnt_wr">
	<div class="row">
		<div class="col-sm-12">
			<div class="card-block table-border-style">
				<div class="table-responsive">
					<table class="table table-sm bst02 align-middle">
						<colgroup>
							<col width="15%" />
							<col width="35%" />
							<col width="15%" />
							<col width="20%" />
							<col width="15%" />
						</colgroup>
						<tbody>
							<tr>
								<th style="text-align: center" class="table-info" scope="row">사용자 이름<input
									type="hidden" id="userId" value="${list.userId}">
									</th>
								<td><input type="text" class="form-control"
									id="unamk" value="${list.userName}" placeholder=""></td>
								<th style="text-align: center"  class="table-info" scope="row">로그인아이디</th>
								<td colspan="2"><input class="form-control" type="text" id="uId" value="${list.userId}"></td>
							</tr>
							<tr>
								<th style="text-align: center"  class="table-info" scope="row">권한</th>
								<td><select class="urole form-control" id="urank">
										<option value="CUSER"
											<c:if test="${list.userRole eq 'CUSER'}">selected</c:if>>일반
											사용자</option>
										<option value="ADMIN"
											<c:if test="${list.userRole eq 'ADMIN'}">selected</c:if>>관리자</option>
								</select></td>
								<th style="text-align: center"  class="table-info" scope="row">암호 초기화</th>
								<td colspan="2"><button class="btn btn-primary">암호초기화</button></td>
							</tr>
							<tr>
							<td colspan = "5"></td>
							</tr>
							<tr>
							<th style="text-align: center" scope="row">계약 관리(A)</th>
							<c:set var = "role1" value = "${list.userKey}" />
							<td><select id="Arole" class="form-control">
							<option value="A2" <c:if test = "${fn : contains(role1, 'A2')}">selected</c:if> >읽기/쓰기</option>
							<option value="A1" <c:if test = "${fn : contains(role1, 'A1')}">selected</c:if> >읽기전용</option>
							<option value="A0"<c:if test = "${fn : contains(role1, 'A0')}">selected</c:if> >접근불가</option>
							</select></td>
							</tr>
							<tr>
							<th style="text-align: center" scope="row">계약 요청(B)</th>
							<td><select id="Brole" class="form-control">
							<option value="B2" <c:if test = "${fn : contains(role1, 'B2')}">selected</c:if>>읽기/쓰기</option>
							<option value="B1" <c:if test = "${fn : contains(role1, 'B1')}">selected</c:if>>읽기전용</option>
							<option value="B0" <c:if test = "${fn : contains(role1, 'B0')}">selected</c:if>>접근불가</option>
							</select></td>
							</tr>
							<tr>
							<th style="text-align: center" scope="row">생산 관리(C)</th>
							<td><select id="Crole" class="form-control">
							<option value="C2" <c:if test = "${fn : contains(role1, 'C2')}">selected</c:if>>읽기/쓰기</option>
							<option value="C1" <c:if test = "${fn : contains(role1, 'C1')}">selected</c:if>>읽기전용</option>
							<option value="C0" <c:if test = "${fn : contains(role1, 'C0')}">selected</c:if>>접근불가</option>
							</select></td>
							</tr>
							<tr>
							<th style="text-align: center" scope="row">상품/자재 입출고 관리(D)</th>
							<td><select id="Drole" class="form-control">
							<option value="D2" <c:if test = "${fn : contains(role1, 'D2')}">selected</c:if>>읽기/쓰기</option>
							<option value="D1" <c:if test = "${fn : contains(role1, 'D1')}">selected</c:if>>읽기전용</option>
							<option value="D0" <c:if test = "${fn : contains(role1, 'D0')}">selected</c:if>>접근불가</option>
							</select></td>
							</tr>
							<tr>
							<th style="text-align: center" scope="row">자재 구매신청(E)</th>
							<td><select id="Erole" class="form-control">
							<option value="E2" <c:if test = "${fn : contains(role1, 'E2')}">selected</c:if>>읽기/쓰기</option>
							<option value="E1" <c:if test = "${fn : contains(role1, 'E1')}">selected</c:if>>읽기전용</option>
							<option value="E0" <c:if test = "${fn : contains(role1, 'E0')}">selected</c:if>>접근불가</option>
							</select></td>
							</tr>
							<tr>
							<th style="text-align: center" scope="row">코드 설정(F)</th>
							<td><select id="Frole" class="form-control">
							<option value="F2" <c:if test = "${fn : contains(role1, 'F2')}">selected</c:if>>읽기/쓰기</option>
							<option value="F1" <c:if test = "${fn : contains(role1, 'F1')}">selected</c:if>>읽기전용</option>
							<option value="F0" <c:if test = "${fn : contains(role1, 'F0')}">selected</c:if>>접근불가</option>
							</select></td>
							</tr>
							<tr>
							<th style="text-align: center" scope="row">상품/자재 등록(G)</th>
							<td><select id="Grole" class="form-control">
							<option value="G2" <c:if test = "${fn : contains(role1, 'G2')}">selected</c:if>>읽기/쓰기</option>
							<option value="G1" <c:if test = "${fn : contains(role1, 'G1')}">selected</c:if>>읽기전용</option>
							<option value="G0" <c:if test = "${fn : contains(role1, 'G0')}">selected</c:if>>접근불가</option>
							</select></td>
							</tr>
							<tr>
							<th style="text-align: center" scope="row">사용자 권한 관리(H)</th>
							<td><select id="Hrole" class="form-control">
							<option value="H2" <c:if test = "${fn : contains(role1, 'H2')}">selected</c:if>>읽기/쓰기</option>
							<option value="H1" <c:if test = "${fn : contains(role1, 'H1')}">selected</c:if>>읽기전용</option>
							<option value="H0" <c:if test = "${fn : contains(role1, 'H0')}">selected</c:if>>접근불가</option>
							</select></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
				<div id="udtbtn">
					<button class="btn btn-md btn-primary " onClick="fn_UpdateRole()">저장</button>
				</div>
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