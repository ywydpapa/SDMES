<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<link rel=File-List href="${path}/resources/PorderPrint.files/filelist.xml">
<style id="PorderPrint_30630_Styles">
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
.font530630
	{color:windowtext;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;}
.xl1530630
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl6330630
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl6430630
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl6530630
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl6630630
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#E7E6E6;
	mso-pattern:black none;
	white-space:nowrap;}
.xl6730630
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#E7E6E6;
	mso-pattern:black none;
	white-space:nowrap;}
.xl6830630
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl6930630
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl7030630
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl7130630
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl7230630
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl7330630
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl7430630
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl7530630
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl7630630
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl7730630
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl7830630
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl7930630
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:"m\0022\/\0022d\;\@";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl8030630
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl8130630
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl8230630
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl8330630
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl8430630
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl8530630
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl8630630
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl8730630
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl8830630
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl8930630
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022_-\;_-\@_-";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl9030630
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#E7E6E6;
	mso-pattern:black none;
	white-space:normal;}
.xl9130630
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl9230630
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:20.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl9330630
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl9430630
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
ruby
	{ruby-align:left;}
rt
	{color:windowtext;
	font-size:8.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:"맑은 고딕", monospace;
	mso-font-charset:129;
	mso-char-type:none;}
-->
</style>
<table id="initable" class="table table-bordered nowrap " style="margin: auto">
	<colgroup>
		<col width="25%" />
		<col width="10%" />
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
		<th style="text-align:center; vertical-align: middle;">금회생산량<br/>(완제품)</th>
		<th style="text-align:center; vertical-align: middle;">금회생산량<br/>(반제품)</th>
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
		</tr>
	</c:forEach>
	</tbody>
</table>
<div class="btn_wr text-right mt-3">
	<c:if test="${userRole eq 'ADMIN'}">
		<button class="btn btn-md btn-primary" value="저장" id="btn-upd-row1" onclick="fn_printporder()">작업지시서 출력</button>
	</c:if>
	<button class="btn btn-md btn-success" value="저장" id="btn-upd-row1" onclick="fn_updateLines()">변경사항저장</button>
</div>
<div style="display:none" id = "printdiv">

	<table border=0 cellpadding=0 cellspacing=0 width=738
		style='border-collapse: collapse; table-layout: fixed; width: 554pt'>
		<col width=137
			style='mso-width-source: userset; mso-width-alt: 4384; width: 103pt'>
		<col width=134
			style='mso-width-source: userset; mso-width-alt: 4288; width: 101pt'>
		<col width=43
			style='mso-width-source: userset; mso-width-alt: 1376; width: 32pt'>
		<col width=104
			style='mso-width-source: userset; mso-width-alt: 3328; width: 78pt'>
		<col width=112
			style='mso-width-source: userset; mso-width-alt: 3584; width: 84pt'>
		<col class=xl6330630 width=107
			style='mso-width-source: userset; mso-width-alt: 3424; width: 80pt'>
		<col width=101
			style='mso-width-source: userset; mso-width-alt: 3232; width: 76pt'>
		<tr height=22 style='height: 16.5pt'>
			<td height=22 class=xl1530630 width=137
				style='height: 16.5pt; width: 103pt'><a name="RANGE!A1:G34"></a></td>
			<td class=xl1530630 width=134 style='width: 101pt'></td>
			<td class=xl1530630 width=43 style='width: 32pt'></td>
			<td class=xl1530630 width=104 style='width: 78pt'></td>
			<td class=xl1530630 width=112 style='width: 84pt'></td>
			<td class=xl6330630 width=107 style='width: 80pt'></td>
			<td class=xl1530630 width=101 style='width: 76pt'></td>
		</tr>
		<tr height=27 style='mso-height-source: userset; height: 20.25pt'>
			<td rowspan=3 height=81 width=137
				style='height: 60.75pt; width: 103pt' align=left valign=top>
				<!--[if gte vml 1]><v:shapetype id="_x0000_t75"
   coordsize="21600,21600" o:spt="75" o:preferrelative="t" path="m@4@5l@4@11@9@11@9@5xe"
   filled="f" stroked="f">
   <v:stroke joinstyle="miter"/>
   <v:formulas>
    <v:f eqn="if lineDrawn pixelLineWidth 0"/>
    <v:f eqn="sum @0 1 0"/>
    <v:f eqn="sum 0 0 @1"/>
    <v:f eqn="prod @2 1 2"/>
    <v:f eqn="prod @3 21600 pixelWidth"/>
    <v:f eqn="prod @3 21600 pixelHeight"/>
    <v:f eqn="sum @0 0 1"/>
    <v:f eqn="prod @6 1 2"/>
    <v:f eqn="prod @7 21600 pixelWidth"/>
    <v:f eqn="sum @8 21600 0"/>
    <v:f eqn="prod @7 21600 pixelHeight"/>
    <v:f eqn="sum @10 21600 0"/>
   </v:formulas>
   <v:path o:extrusionok="f" gradientshapeok="t" o:connecttype="rect"/>
   <o:lock v:ext="edit" aspectratio="t"/>
  </v:shapetype><v:shape id="그림_x0020_2" o:spid="_x0000_s1025" type="#_x0000_t75"
   style='position:absolute;margin-left:19.5pt;margin-top:8.25pt;width:64.5pt;
   height:49.5pt;z-index:1;visibility:visible' o:gfxdata="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
+ME22JOYjv0j7nXvxR9xV0RRLI5qfk6VjAmcX5h8AwAA//8DAFBLAwQKAAAAAAAAACEAS7CUHBEs
AAARLAAAFQAAAGRycy9tZWRpYS9pbWFnZTEuanBlZ//Y/+AAEEpGSUYAAQEBANwA3AAA/9sAQwAC
AQEBAQECAQEBAgICAgIEAwICAgIFBAQDBAYFBgYGBQYGBgcJCAYHCQcGBggLCAkKCgoKCgYICwwL
CgwJCgoK/9sAQwECAgICAgIFAwMFCgcGBwoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoK
CgoKCgoKCgoKCgoKCgoKCgoK/8AAEQgAmADFAwEiAAIRAQMRAf/EAB8AAAEFAQEBAQEBAAAAAAAA
AAABAgMEBQYHCAkKC//EALUQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGh
CCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hp
anN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV
1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+v/EAB8BAAMBAQEBAQEBAQEAAAAAAAABAgMEBQYHCAkK
C//EALURAAIBAgQEAwQHBQQEAAECdwABAgMRBAUhMQYSQVEHYXETIjKBCBRCkaGxwQkjM1LwFWJy
0QoWJDThJfEXGBkaJicoKSo1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoKD
hIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uLj5OXm
5+jp6vLz9PX29/j5+v/aAAwDAQACEQMRAD8A/fyiiigAooooAKKKKACiiigAooooAKKKKACiiigA
ory/4R/Hjw58bfjT4w0bwZerd6T4Ms7OyS/iU+Xc3k7ztcbW3ESIgt4FVsD5vMILKytXqFYYfEUs
VT9pSd43av3s2n+KZNOpGpHmjt/loFFFFblBRRRQAUUUUAFFFFABRRRQAUUUUAeV/tWfttfsu/sQ
+F9L8ZftR/FaDwrp+tX7WWlzSabdXTXEyoXZRHaxSPgKMlioUZAJywB8L/4iAf8AgkT/ANHfW/8A
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
">
   <v:imagedata src="PorderPrint.files/PorderPrint_30630_image001.png" o:title=""/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
    <x:AutoPict/>
   </x:ClientData>
  </v:shape><![endif]-->
				<![if !vml]><span
				style='mso-ignore: vglayout; position: absolute; z-index: 1; margin-left: 26px; margin-top: 11px; width: 86px; height: 66px'><img
					width=86 height=66
					src="PorderPrint.files/PorderPrint_30630_image002.png"
					v:shapes="그림_x0020_2"></span>
			<![endif]><span style='mso-ignore: vglayout2'>
					<table cellpadding=0 cellspacing=0>
						<tr>
							<td rowspan=3 height=81 class=xl6430630 width=137
								style='height: 60.75pt; width: 103pt'><span
								style='mso-spacerun: yes'>&nbsp;</span></td>
						</tr>
					</table>
			</span>
			</td>
			<td colspan=4 rowspan=3 class=xl9230630>일일작업지시서</td>
			<td class=xl6730630 style='border-left: none'>문서번호</td>
			<td class=xl6430630 style='border-left: none'></td>
		</tr>
		<tr height=27 style='mso-height-source: userset; height: 20.25pt'>
			<td height=27 class=xl6730630
				style='height: 20.25pt; border-top: none; border-left: none'>페이지</td>
			<td class=xl7930630 style='border-top: none; border-left: none'>1/1</td>
		</tr>
		<tr height=27 style='mso-height-source: userset; height: 20.25pt'>
			<td height=27 class=xl6730630
				style='height: 20.25pt; border-top: none; border-left: none'>작성일자</td>
			<td class=xl6430630 style='border-top: none; border-left: none'>
			</td>
		</tr>
		<tr height=22 style='height: 16.5pt'>
			<td height=22 class=xl1530630 style='height: 16.5pt'></td>
			<td class=xl1530630></td>
			<td class=xl1530630></td>
			<td class=xl1530630></td>
			<td class=xl1530630></td>
			<td class=xl6330630></td>
			<td class=xl1530630></td>
		</tr>
		<tr class=xl6330630 height=39
			style='mso-height-source: userset; height: 29.25pt'>
			<td colspan=2 rowspan=2 height=97 class=xl9330630 width=271
				style='border-right: .5pt solid black; height: 72.75pt; width: 204pt'>아래와
				같이 작업지시서를<br> 제출합니다.
			</td>
			<td rowspan=2 class=xl9030630 width=43 style='width: 32pt'>결<br>
				재
			</td>
			<td class=xl6630630 style='border-left: none'>영업담당</td>
			<td class=xl6630630 style='border-left: none'>이사</td>
			<td class=xl6630630 style='border-left: none'>부사장</td>
			<td class=xl6630630 style='border-left: none'>대표이사</td>
		</tr>
		<tr height=58 style='mso-height-source: userset; height: 43.5pt'>
			<td height=58 class=xl6530630
				style='height: 43.5pt; border-top: none; border-left: none'></td>
			<td class=xl6530630 style='border-top: none; border-left: none'>
			</td>
			<td class=xl6430630 style='border-top: none; border-left: none'>
			</td>
			<td class=xl6530630 style='border-top: none; border-left: none'>
			</td>
		</tr>
		<tr height=17 style='mso-height-source: userset; height: 12.75pt'>
			<td height=17 class=xl1530630 style='height: 12.75pt'></td>
			<td class=xl1530630></td>
			<td class=xl6330630></td>
			<td class=xl1530630></td>
			<td class=xl1530630></td>
			<td class=xl6330630></td>
			<td class=xl1530630></td>
		</tr>
		<tr class=xl6330630 height=34
			style='mso-height-source: userset; height: 25.5pt'>
			<td height=34 class=xl6430630 style='height: 25.5pt'>납품처</td>
			<td class=xl6430630 style='border-left: none'></td>
			<td colspan=2 class=xl6430630 style='border-left: none'>납품 예정일</td>
			<td class=xl6430630 style='border-left: none'></td>
			<td class=xl6430630 style='border-left: none'>공정명</td>
			<td class=xl6430630 style='border-left: none'>완제품</td>
		</tr>
		<tr class=xl6330630 height=34
			style='mso-height-source: userset; height: 25.5pt'>
			<td height=34 class=xl6430630
				style='height: 25.5pt; border-top: none'>제조사</td>
			<td class=xl6430630 style='border-top: none; border-left: none'>규격(mm)</td>
			<td colspan=2 class=xl6430630 style='border-left: none'>수량</td>
			<td colspan=2 class=xl6430630 style='border-left: none'>지시사항</td>
			<td class=xl6430630 style='border-top: none; border-left: none'>비<span
				style='mso-spacerun: yes'>&nbsp;&nbsp; </span>고
			</td>
		</tr>
		<tr class=xl6330630 height=34
			style='mso-height-source: userset; height: 25.5pt'>
			<td rowspan=7 height=238 class=xl6430630
				style='height: 178.5pt; border-top: none'></td>
			<td class=xl6430630 style='border-top: none; border-left: none'>
			</td>
			<td colspan=2 class=xl8930630 style='border-left: none'></td>
			<td colspan=2 rowspan=7 class=xl9130630
				style='border-right: .5pt solid black; border-bottom: .5pt solid black'>
			</td>
			<td rowspan=7 class=xl8030630
				style='border-bottom: .5pt solid black; border-top: none'></td>
		</tr>
		<tr class=xl6330630 height=34
			style='mso-height-source: userset; height: 25.5pt'>
			<td height=34 class=xl6430630
				style='height: 25.5pt; border-top: none; border-left: none'></td>
			<td colspan=2 class=xl8930630 style='border-left: none'></td>
		</tr>
		<tr class=xl6330630 height=34
			style='mso-height-source: userset; height: 25.5pt'>
			<td height=34 class=xl6430630
				style='height: 25.5pt; border-top: none; border-left: none'></td>
			<td colspan=2 class=xl8930630 style='border-left: none'></td>
		</tr>
		<tr class=xl6330630 height=34
			style='mso-height-source: userset; height: 25.5pt'>
			<td height=34 class=xl6430630
				style='height: 25.5pt; border-top: none; border-left: none'></td>
			<td colspan=2 class=xl8930630 style='border-left: none'></td>
		</tr>
		<tr class=xl6330630 height=34
			style='mso-height-source: userset; height: 25.5pt'>
			<td height=34 class=xl6430630
				style='height: 25.5pt; border-top: none; border-left: none'></td>
			<td colspan=2 class=xl8930630 style='border-left: none'></td>
		</tr>
		<tr class=xl6330630 height=34
			style='mso-height-source: userset; height: 25.5pt'>
			<td height=34 class=xl6430630
				style='height: 25.5pt; border-top: none; border-left: none'></td>
			<td colspan=2 class=xl8930630 style='border-left: none'></td>
		</tr>
		<tr class=xl6330630 height=34
			style='mso-height-source: userset; height: 25.5pt'>
			<td height=34 class=xl6430630
				style='height: 25.5pt; border-top: none; border-left: none'></td>
			<td colspan=2 class=xl8930630 style='border-left: none'></td>
		</tr>
		<tr class=xl6330630 height=34
			style='mso-height-source: userset; height: 25.5pt'>
			<td rowspan=7 height=238 class=xl6430630
				style='height: 178.5pt; border-top: none'></td>
			<td class=xl6430630 style='border-top: none; border-left: none'>
			</td>
			<td colspan=2 class=xl8930630 style='border-left: none'></td>
			<td colspan=2 rowspan=7 class=xl8330630 width=219
				style='border-right: .5pt solid black; border-bottom: .5pt solid black; width: 164pt'>
			</td>
			<td rowspan=7 class=xl8030630
				style='border-bottom: .5pt solid black; border-top: none'></td>
		</tr>
		<tr class=xl6330630 height=34
			style='mso-height-source: userset; height: 25.5pt'>
			<td height=34 class=xl6430630
				style='height: 25.5pt; border-top: none; border-left: none'></td>
			<td colspan=2 class=xl8930630 style='border-left: none'></td>
		</tr>
		<tr class=xl6330630 height=34
			style='mso-height-source: userset; height: 25.5pt'>
			<td height=34 class=xl6430630
				style='height: 25.5pt; border-top: none; border-left: none'></td>
			<td colspan=2 class=xl8930630 style='border-left: none'></td>
		</tr>
		<tr class=xl6330630 height=34
			style='mso-height-source: userset; height: 25.5pt'>
			<td height=34 class=xl6430630
				style='height: 25.5pt; border-top: none; border-left: none'></td>
			<td colspan=2 class=xl8930630 style='border-left: none'></td>
		</tr>
		<tr class=xl6330630 height=34
			style='mso-height-source: userset; height: 25.5pt'>
			<td height=34 class=xl6430630
				style='height: 25.5pt; border-top: none; border-left: none'></td>
			<td colspan=2 class=xl8930630 style='border-left: none'></td>
		</tr>
		<tr class=xl6330630 height=34
			style='mso-height-source: userset; height: 25.5pt'>
			<td height=34 class=xl6430630
				style='height: 25.5pt; border-top: none; border-left: none'></td>
			<td colspan=2 class=xl8930630 style='border-left: none'></td>
		</tr>
		<tr class=xl6330630 height=34
			style='mso-height-source: userset; height: 25.5pt'>
			<td height=34 class=xl6430630
				style='height: 25.5pt; border-top: none; border-left: none'></td>
			<td colspan=2 class=xl8930630 style='border-left: none'></td>
		</tr>
		<tr height=30 style='mso-height-source: userset; height: 22.5pt'>
			<td rowspan=5 height=150 class=xl6430630
				style='height: 112.5pt; border-top: none'>안전조치사항</td>
			<td class=xl6930630 style='border-top: none; border-left: none'><span
				style='mso-spacerun: yes'>&nbsp;</span>1)</td>
			<td class=xl7030630 style='border-top: none'></td>
			<td class=xl7030630 style='border-top: none'></td>
			<td class=xl7030630 style='border-top: none'></td>
			<td class=xl6830630 style='border-top: none'></td>
			<td class=xl7130630 style='border-top: none'></td>
		</tr>
		<tr height=30 style='mso-height-source: userset; height: 22.5pt'>
			<td height=30 class=xl7230630
				style='height: 22.5pt; border-left: none'><span
				style='mso-spacerun: yes'>&nbsp;</span>2)</td>
			<td class=xl1530630></td>
			<td class=xl1530630></td>
			<td class=xl1530630></td>
			<td class=xl6330630></td>
			<td class=xl7330630></td>
		</tr>
		<tr height=30 style='mso-height-source: userset; height: 22.5pt'>
			<td height=30 class=xl7230630
				style='height: 22.5pt; border-left: none'><span
				style='mso-spacerun: yes'>&nbsp;</span>3)</td>
			<td class=xl1530630></td>
			<td class=xl1530630></td>
			<td class=xl1530630></td>
			<td class=xl6330630></td>
			<td class=xl7330630></td>
		</tr>
		<tr height=30 style='mso-height-source: userset; height: 22.5pt'>
			<td height=30 class=xl7230630
				style='height: 22.5pt; border-left: none'><span
				style='mso-spacerun: yes'>&nbsp;</span>4)</td>
			<td class=xl1530630></td>
			<td class=xl1530630></td>
			<td class=xl1530630></td>
			<td class=xl6330630></td>
			<td class=xl7330630></td>
		</tr>
		<tr height=30 style='mso-height-source: userset; height: 22.5pt'>
			<td height=30 class=xl7430630
				style='height: 22.5pt; border-left: none'><span
				style='mso-spacerun: yes'>&nbsp;</span>5)</td>
			<td class=xl7530630></td>
			<td class=xl7530630></td>
			<td class=xl7530630></td>
			<td class=xl7630630></td>
			<td class=xl7730630></td>
		</tr>
		<tr height=30 style='mso-height-source: userset; height: 22.5pt'>
			<td rowspan=3 height=90 class=xl6430630
				style='height: 67.5pt; border-top: none'>기타사항</td>
			<td class=xl7830630 style='border-top: none; border-left: none'><span
				style='mso-spacerun: yes'>&nbsp;</span>1)</td>
			<td class=xl7030630 style='border-top: none'></td>
			<td class=xl7030630 style='border-top: none'></td>
			<td class=xl7030630 style='border-top: none'></td>
			<td class=xl6830630 style='border-top: none'></td>
			<td class=xl7130630 style='border-top: none'></td>
		</tr>
		<tr height=30 style='mso-height-source: userset; height: 22.5pt'>
			<td height=30 class=xl7230630
				style='height: 22.5pt; border-left: none'><span
				style='mso-spacerun: yes'>&nbsp;</span>2)</td>
			<td class=xl1530630></td>
			<td class=xl1530630></td>
			<td class=xl1530630></td>
			<td class=xl6330630></td>
			<td class=xl7330630></td>
		</tr>
		<tr height=30 style='mso-height-source: userset; height: 22.5pt'>
			<td height=30 class=xl7430630
				style='height: 22.5pt; border-left: none'><span
				style='mso-spacerun: yes'>&nbsp;</span>3)</td>
			<td class=xl7530630></td>
			<td class=xl7530630></td>
			<td class=xl7530630></td>
			<td class=xl7630630></td>
			<td class=xl7730630></td>
		</tr>
		<tr height=30 style='mso-height-source: userset; height: 22.5pt'>
			<td height=30 class=xl1530630 style='height: 22.5pt'></td>
			<td class=xl1530630></td>
			<td align=left valign=top>
				<!--[if gte vml 1]><v:shape id="그림_x0020_5" o:spid="_x0000_s1026"
   type="#_x0000_t75" style='position:absolute;margin-left:26.25pt;
   margin-top:3pt;width:22.5pt;height:17.25pt;z-index:2;visibility:visible'
   o:gfxdata="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
Dtj5UZIkmaVAT7bB/oOTP3CcziIc/U3H7C5N2YmmY6qvYjxh9gkAAP//AwBQSwMECgAAAAAAAAAh
AEU74N08DAAAPAwAABUAAABkcnMvbWVkaWEvaW1hZ2UxLmpwZWf/2P/gABBKRklGAAEBAQDcANwA
AP/bAEMAAgEBAQEBAgEBAQICAgICBAMCAgICBQQEAwQGBQYGBgUGBgYHCQgGBwkHBgYICwgJCgoK
CgoGCAsMCwoMCQoKCv/bAEMBAgICAgICBQMDBQoHBgcKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoK
CgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCv/AABEIADUARQMBIgACEQEDEQH/xAAfAAABBQEBAQEB
AQAAAAAAAAAAAQIDBAUGBwgJCgv/xAC1EAACAQMDAgQDBQUEBAAAAX0BAgMABBEFEiExQQYTUWEH
InEUMoGRoQgjQrHBFVLR8CQzYnKCCQoWFxgZGiUmJygpKjQ1Njc4OTpDREVGR0hJSlNUVVZXWFla
Y2RlZmdoaWpzdHV2d3h5eoOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbH
yMnK0tPU1dbX2Nna4eLj5OXm5+jp6vHy8/T19vf4+fr/xAAfAQADAQEBAQEBAQEBAAAAAAAAAQID
BAUGBwgJCgv/xAC1EQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJ
IzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1
dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY
2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/AP36A/vDpR8mO1eZ/tk/C7xz8dP2TviT
8EvhqulDXPGngfVNB0+TW76W2tYnvLWS2MskkUMzgIshfCxksVC5XO4fh/ff8ETP2n/+CbsMn7Q3
xa8beBda1qSGXS/hrb+F9Xu2+x65LG7tqV1LdWltHZQ2OmxalfpemeMWtzZ207t5ccgPpZbl9HHy
5JVVBtpJNb+bd1ZLq+i1PPx+MlgaLqKDkkm3bf0Stq30P3J8YftW/swfD7xVc+A/Hn7RXgfRdcsy
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
">
   <v:imagedata src="PorderPrint.files/PorderPrint_30630_image003.png" o:title=""/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
    <x:AutoPict/>
   </x:ClientData>
  </v:shape><![endif]-->
				<![if !vml]><span
				style='mso-ignore: vglayout; position: absolute; z-index: 2; margin-left: 35px; margin-top: 4px; width: 30px; height: 23px'><img
					width=30 height=23
					src="PorderPrint.files/PorderPrint_30630_image004.png"
					v:shapes="그림_x0020_5"></span>
			<![endif]><span style='mso-ignore: vglayout2'>
					<table cellpadding=0 cellspacing=0>
						<tr>
							<td height=30 class=xl1530630 width=43
								style='height: 22.5pt; width: 32pt'></td>
						</tr>
					</table>
			</span>
			</td>
			<td class=xl1530630 colspan=2><span style='mso-spacerun: yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</span>㈜티앤제이</td>
			<td class=xl6330630></td>
			<td class=xl1530630></td>
		</tr>
		<tr height=22 style='height: 16.5pt'>
			<td height=22 class=xl1530630 style='height: 16.5pt'></td>
			<td class=xl1530630></td>
			<td class=xl1530630></td>
			<td class=xl1530630></td>
			<td class=xl1530630></td>
			<td class=xl6330630></td>
			<td class=xl1530630></td>
		</tr>
		<![if supportMisalignedColumns]>
		<tr height=0 style='display: none'>
			<td width=137 style='width: 103pt'></td>
			<td width=134 style='width: 101pt'></td>
			<td width=43 style='width: 32pt'></td>
			<td width=104 style='width: 78pt'></td>
			<td width=112 style='width: 84pt'></td>
			<td width=107 style='width: 80pt'></td>
			<td width=101 style='width: 76pt'></td>
		</tr>
		<![endif]>
	</table>
	<table class="table table-bordered nowrap " style="margin: auto">
		<colgroup>
			<col width="25%" />
			<col width="10%" />
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
			<th style="text-align:center; vertical-align: middle;">금회생산량<br/>(완제품)</th>
			<th style="text-align:center; vertical-align: middle;">금회생산량<br/>(반제품)</th>
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
				<td><input class="form-control PrdQtyComplete" type="number" style="width:100%;hight:100%;border:0;text-align:right;" value="0" min="0" max= "${row2.remQty}" ></td>
				<td><input class="form-control PrdQtyPart" type="number" style="width:100%;hight:100%;border:0;text-align:right;" value="0" min="0" max= "${row2.remQty}" ></td>
			</tr>
		</c:forEach>
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

	function fn_printporder() {
		var initBody = document.body.innerHTML;
		window.onbeforeprint = function(){
			document.body.innerHTML = document.getElementById("printdiv").innerHTML;
		}
		window.onafterprint = function(){
			document.body.innerHTML = initBody;
		}
		window.print();
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
			// mesdata.prdQty = Number($Barr[i].value.replace(/[\D\s\._\-]+/g, ""));
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
		// reload2();

		var list = $("#contlistTable > tbody > tr");
		if(list.length > 0){
			var tr = list[0];
			$(tr).find("a").get(0).click();	// a link force click!!
		}

		<%--var url2 = "${path}/cont/listporder.do";--%>
		<%--fn_Reload02(url2);--%>
		<%--var url3 = "${path}/cont/porderdetail/"+$("#contNo").val();--%>
		<%--fn_Reload03(url3);--%>
	}

</script>