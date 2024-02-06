<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collection" %>

<%
	/**********************************
	전달해야 할 변수
	***********************************/
	String	url = null;
	String	str = null;
	
	url = request.getParameter("url");
	System.out.println("url >>> : " + url);
	
	str = request.getParameter("str");
	System.out.println("str >>> " + str);
	
	if(str != null && str.length() > 0){
		str = str + "&";
		System.out.println("str + &>>>"+str);
	}
%>

<%
	/**********************************
	페이지 네비게이션 관련 변수
	***********************************/
	// 한페이지에 보여질 게시물의 수
	int pageSize = 0;	
	// 그룹의 크기
	int groupSize = 0;	
	// 전체 게시물의 개수
	int totalCount = 0;	
	//현재 페이지
	int curPage = 0;	
	// 전체 페이지의 개수
	int pageCount = 0;
	
	if(request.getParameter("pageSize") != null){
		pageSize = Integer.parseInt(request.getParameter("pageSize"));//10
		System.out.println("pageSize >>> : " + pageSize);
	}
	
	if(request.getParameter("groupSize") != null){
		groupSize = Integer.parseInt(request.getParameter("groupSize"));//5
		System.out.println("groupSize >>> : " + groupSize);
	}
	
	if(request.getParameter("curPage") != null){
		curPage = Integer.parseInt(request.getParameter("curPage"));//1
		System.out.println("curPage >>> : " + curPage);
		
	}
	
	if(request.getParameter("totalCount") != null){
		totalCount = Integer.parseInt(request.getParameter("totalCount"));//400
		System.out.println("totalCount >>> : " + totalCount);
	}
	
	// 전체게시물수와 페이지크기를 가지고 전체 페이지 개수를 계산함.
	// 소수점에 따라 계산상의 오류가 없도록 한것임.
	pageCount = (int)Math.ceil(totalCount / (groupSize + 7.0));
	System.out.println("pageCount >>> : " + pageCount);
	//(0/page)
	
	// 현재그룹 설정
	//1-1/5
	int curGroup = (curPage-1) / groupSize;
	System.out.println("curGroup >>> : " + curGroup);
	
	//0*0
	int linkPage = curGroup * groupSize;
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

</style>

<div class=page-num>
<%
	// 첫번째 그룹인 아닌경우
	if(curGroup > 0) {
		
%>
	<a href="<%=url%>?<%=str%>curPage=1">≪</a>&nbsp;&nbsp;
	<a href="<%=url%>?<%=str%>curPage=<%=linkPage%>">＜</a>&nbsp;&nbsp;
<%
	}else{
%>
		<a href="<%=url%>?<%=str%>curPage=1">≪</a>&nbsp;&nbsp;
		<%
		if (curGroup > 0){
		%>
		<a href="<%=url%>?<%=str%>curPage=<%=linkPage%>-1">＜</a>&nbsp;&nbsp;
		<% 
		} else {
		%>
		<a href="<%=url%>?<%=str%>curPage=1">＜</a>&nbsp;&nbsp;
		<% 
		}
		%>
<%
	}
	
	// 다음 링크를 위해 증가시킴
	linkPage++;
	System.out.println("linkPage++ >>> : " + linkPage);
	//1
	
	int loopCount = groupSize;
	System.out.println("loopCount >>> : " + loopCount);
	//5
	
	// 그룹범위내에서 페이지 링크만듬.
	//5>0 && 1<=40
	while((loopCount > 0) && (linkPage <= pageCount)){
		//1==1
		if(linkPage == curPage){
			System.out.println("그룹범위내에서 페이지 링크 if");
		//linkPage :1
%>
	<a class=page> <%=linkPage%> </a>
<%
		}else{
			System.out.println("그룹범위내에서 페이지 링크 else");
%>
	<a class=paging href="<%=url%>?<%=str%>curPage=<%=linkPage%>"><%=linkPage%></a>
<%
		}
		linkPage++;
		loopCount--;
	}

	if(linkPage <= pageCount){
		System.out.println("다음그룹이 있는 경우 linkPage >>> : " + linkPage);
		System.out.println("다음그룹이 있는 경우 pageCount >>> : " + pageCount);
%>
	
	
	&nbsp;<a href="<%=url%>?<%=str%>curPage=<%=linkPage%>">＞</a>&nbsp;&nbsp;
	<a href="<%=url%>?<%=str%>curPage=<%=pageCount%>">≫</a>&nbsp;
<%
	}else{
		System.out.println("다음그룹이 있는 경우 linkPage >>> : " + linkPage);
		System.out.println("다음그룹이 있는 경우 pageCount >>> : " +pageCount);
		System.out.println("다음그룹이 있는 경우 else");
%>
		
		<%
		if (curGroup < pageCount/5){
		%>
		&nbsp;<a href="<%=url%>?<%=str%>curPage=<%=linkPage%>+1">＞</a>&nbsp;&nbsp;
		<% 
		} else {
		%>
		&nbsp;<a href="<%=url%>?<%=str%>curPage=<%=pageCount%>">＞</a>&nbsp;&nbsp;
		<% 
		}
		%>
		<a href="<%=url%>?<%=str%>curPage=<%=pageCount%>">≫</a>&nbsp;
<%
	}
%>

</div>