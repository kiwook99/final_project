<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 페이징 -->

<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collection" %>

<%
	String url = null;
	String str = null;
	
	url = request.getParameter("url");
	System.out.println("url >>> : " + url);

	str = request.getParameter("str");
	System.out.println("str >>> : " + str);
	
	if(str != null && str.length() > 0) {
		str = str + "&";
		System.out.println("str + & >>> : " + str);	
	}
%>

<%
	// 한페이지에 보여질 게시물의 수 
	int pageSize = 0;	
	// 그룹의 크기
	int groupSize = 0;	
	// 전체 게시물의 개수 
	int totalCount = 0;	
	// 현재 페이지
	int curPage = 0;	
	// 전체 페이지의 개수 
	int pageCount = 0;
	
	if(request.getParameter("pageSize") != null){
		pageSize = Integer.parseInt(request.getParameter("pageSize"));
		System.out.println("pageSize >>> : " + pageSize);	
	}
	
	if(request.getParameter("groupSize") != null){
		groupSize = Integer.parseInt(request.getParameter("groupSize"));
		System.out.println("groupSize >>> : " + groupSize);	
	}
	
	if(request.getParameter("curPage") != null){
		curPage = Integer.parseInt(request.getParameter("curPage"));
		System.out.println("curPage >>> : " + curPage);	
	}
	
	if(request.getParameter("totalCount") != null){
		totalCount = Integer.parseInt(request.getParameter("totalCount"));
		System.out.println("totalCount >>> : " + totalCount);	
	}	
	
	// 전체게시물수와 페이지크기를 가지고 전체 페이지 개수를 계산함.
	// 소수점에 따라 계산상의 오류가 없도록 한것임.
	// ex) pageCount (100 / 5 + 10.0);
	pageCount = (int)Math.ceil(totalCount / (groupSize + 10.0));
	System.out.println("pageCount >>> : " + pageCount);	
	//(0/page)
	
	// 현재그룹 설정
	//1-1/5
	int curGroup = (curPage - 1) / groupSize;
	System.out.println("curGroup >>> : " + curGroup);
	
	
	// 0 * 0
	int linkPage = 	curGroup * groupSize;
	System.out.println("linkPage >>> : " + linkPage);
%>
<style type=text/css>
	.page{
		background: #0aa4b5;
	    border-radius: 50%;
	    color: #fff;
	    font-weight: 800;
	    margin: 0 5px;
	    width: 30px;
   	 	height: 30px;
   	 	text-align:center;
	}
	
	.page-num {
		display: flex;	
		text-align:center;
		justify-content: center;
	}
	
	.paging {
		margin: 0 5px;
		width: 30px;
 	    height: 30px;
 	    color: #888;
 	    text-align:center;
	}
	
	a:link, a:visited, a:focus, a:active {
    text-decoration: none;
	}	/* 링크를 클릭하거나 방문한 상태, 포커스된 상태, 활성 상태의 링크에 대해 텍스트 장식을 제거 */

	
</style>


<div class=page-num>
<%
	// 첫번째 그룹이 아닐때
	if(curGroup > 0) {
		

%>
	<a href="<%= url %>?<%= str %>curPage=1"><<</a> &nbsp;&nbsp;&nbsp;
	<a href="<%= url %>?<%= str %>curPage=<%= linkPage %>"><</a> &nbsp;&nbsp;&nbsp;
<%
	} else {
%>	
	<a href="<%= url %>?<%= str %>curPage=1"><<</a> &nbsp;&nbsp;&nbsp;
	
	<%
		if (curGroup > 0){
	%>
		<a href="<%= url %>?<%= str %>curPage=<%= curPage - 1 %>"><</a> &nbsp;&nbsp;&nbsp;
	<% 
	} else {
	%>
		<a href="<%=url%>?<%=str%>curPage=1"><</a>&nbsp;&nbsp;
	<% 
	}
	%>	
<%
	}

	// 다음 링크를 위해 증가
	// 1
	linkPage++;
	System.out.println("linkPage++ >>> : " + linkPage);
	
	// 5
	int loopCount = groupSize;
	System.out.println("loopCount >>> : " + loopCount);
	
	// 그룹범위내에서 페이지 링크만들기
	//5>0 && 1<=20
	while((loopCount > 0) && (linkPage <= pageCount)) {
		if(linkPage == curPage){
			System.out.println("그룹범위내에서 페이지 링크  if");
			
%>
	<a class=page> <%= linkPage %> </a>
<%			
		} else {
			System.out.println("그룹범위내에서 페이지 링크 else");
			
%>
	<a href="<%= url %>?<%= str %>curPage=<%= linkPage %>"><%= linkPage %></a> &nbsp;	
<%		
		}
		
		linkPage++;
		loopCount--;
	}
	
	// 다음그룹이 있을시
	if(linkPage <= pageCount) {
		System.out.println("다음그룹이 있는 경우 linkPage >>> : " + linkPage);
		System.out.println("다음그룹이 있는 경우 pageCount >>> : " + pageCount);
	
%>	
	
	<a href="<%=url%>?<%=str%>curPage=<%=linkPage%>">></a>&nbsp;&nbsp;&nbsp;
	<a href="<%=url%>?<%=str%>curPage=<%=pageCount%>">>></a>&nbsp;&nbsp;&nbsp;
<%

	} else{
		System.out.println("다음그룹이 있는 경우 linkPage >>> : " + linkPage);
		System.out.println("다음그룹이 있는 경우 pageCount >>> : " +pageCount);
		System.out.println("다음그룹이 있는 경우 else");
%>
		<%
		if (linkPage <= pageCount){
		%>
			<a href="<%=url%>?<%=str%>curPage=<%=linkPage + 1%>">></a>&nbsp;
		<% 
		} else {
		%>
			<a href="<%=url%>?<%=str%>curPage=<%=pageCount%>">></a>&nbsp;
		<% 
		}
		%>
			<a href="<%=url%>?<%=str%>curPage=<%=pageCount%>">>></a>&nbsp;
<%
	}
%>
</div>