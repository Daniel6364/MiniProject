<%@ page contentType="text/html; charset=euc-kr" %>
<%--@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" --%>

<%@ page import="java.util.List"  %>

<%@ page import="com.model2.mvc.service.domain.*" %>
<%@ page import="com.model2.mvc.common.Search" %>
<%@ page import="com.model2.mvc.common.Page" %>
<%@page import="com.model2.mvc.common.util.CommonUtil"%>

<%
	List<Purchase> list = (List<Purchase>)request.getAttribute("list");
	Page resultPage = (Page)request.getAttribute("resultPage");
	Search search = (Search)request.getAttribute("search");
	
	//==> null 을 ""(nullString)으로 변경
	String searchCondition = CommonUtil.null2str(search.getSearchCondition());
	String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
%>


<html>
<head>
<title>updateTranCode.jsp</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
function fncGetPurchaseList(currentPage) {
	document.getElementById("currentPage").value = currentPage;
   	document.detailForm.submit();		
}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" action="/listPurchase.do" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">구매 목록조회</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">전체  <%=resultPage.getTotalCount()%> 건수, 현재 <%=resultPage.getCurrentPage()%> 페이지</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">전화번호</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">배송현황</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">정보수정</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<%
		for(int i = 0; i < list.size(); i++) {
			Purchase purchase = (Purchase)list.get(i);
	%>	
	<tr class="ct_list_pop">
		<td align="center">
			<a href="/getPurchase.do?tranNo=<%=purchase.getTranNo()%>"><%=i + 1%></a>
		</td>
		<td></td>
		<td align="left">
			<a href="/getUser.do?userId=<%=purchase.getBuyer().getUserId()%>"><%=purchase.getBuyer().getUserId()%></a>
		</td>
		<td></td>
		<td align="left"><%=purchase.getReceiverName()%></td>
		<td></td>
		<td align="left"><%=purchase.getReceiverPhone()%></td>
		<td></td>
		<td align="left">
			<% if (purchase.getTranCode().trim().equals("0")) {%>
				구매완료
			<%} else if (purchase.getTranCode().trim().equals("1")) {%>
				배송중
			<%} else if (purchase.getTranCode().trim().equals("2")) {%>
				배송완료
			<%} %>
		</td>
		<td></td>
		<td align="left">
			<% if(purchase.getTranCode().trim().equals("1")) {%>
			<a href="/updateTranCode.do?tranNo=<%=purchase.getTranNo()%>&tranCode=2">물건도착</a>
			<%} %>
		</td>
	</tr>
	<%} %>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
			<input type="hidden" id="currentPage" name="currentPage" value=""/>
		 
		  <% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %>
				◀ [prev]
		<% }else{ %>
				<a href="javascript:fncGetPurchaseList('<%=resultPage.getCurrentPage()-1%>')">◀ [prev]</a>
		<% } %>
				
		<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%>
				<a href="javascript:fncGetPurchaseList('<%=i %>');"><%=i %></a>
		<% 	}  %>
				
		<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
					[next] ▶
		<% }else{ %>
				<a href="javascript:fncGetPurchaseList('<%=resultPage.getEndUnitPage()+1%>')">[next]▶</a>
		<% } %>
		
		</td>
	</tr>
</table>

<!--  페이지 Navigator 끝 -->
</form>

</div>

</body>
</html>