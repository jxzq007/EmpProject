<%@ page pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/style.css">
<%-- 
	实现数据的分页显示条的控制
	<jsp:include page="split_page_plugin_bar.jsp">
		<jsp:param name="url" value="<%=url%>"/>
		<jsp:param name="currentPage" value="<%=currentPage%>"/>
		<jsp:param name="lineSize" value="<%=lineSize%>"/>
		<jsp:param name="allRecorders" value="<%=allRecorders%>"/>
		<jsp:param name="keyWord" value="<%=keyWord%>"/>
		<jsp:param name="column" value="<%=column%>"/>
		<jsp:param name="paramName" value="额外参数名称"/>
		<jsp:param name="paramValue" value="额外参数内容"/>
	</jsp:include>
--%>
<%
	int currentPage = 1 ;
	int lineSize = 5 ;
	String url = request.getParameter("url") ;
	int pageSize = 0 ;	// 保存总页数，通过计算得来
	int seed = 3 ;	// 种子数
	int allRecorders = 0 ;	// 保存总记录数
	String column = request.getParameter("column") ;
	String keyWord = request.getParameter("keyWord") ;
	String paramName = request.getParameter("paramName") ;
	String paramValue = request.getParameter("paramValue") ;
%>
<%
	try {
		currentPage = Integer.parseInt(request.getParameter("currentPage")) ;
	} catch (Exception e) {}
	try {
		lineSize = Integer.parseInt(request.getParameter("lineSize")) ;
	} catch (Exception e) {}
	try {
		allRecorders = Integer.parseInt(request.getParameter("allRecorders")) ;
	} catch (Exception e) {}
%>
<%
	// 计算总页数
	if (allRecorders == 0) {
		pageSize = 1 ;
	} else {
		pageSize = (allRecorders + lineSize - 1) / lineSize ;
	}
%>
<div id="splitPageDiv">
<div style="float:left">
	<ul class="pagination"> 
		<%
			if (currentPage == 1) {	// 已经在首页了
		%>
				<li class="disabled"><span>上一页</span></li>
				<li class="active"><span>1</span></li>
		<%
			} else {
		%>
				<li><a href="<%=url%>?cp=<%=currentPage - 1%>&col=<%=column%>&kw=<%=keyWord%>&<%=paramName%>=<%=paramValue%>">上一页</a></li>
				<li><a href="<%=url%>?cp=1&col=<%=column%>&kw=<%=keyWord%>&<%=paramName%>=<%=paramValue%>">1</a></li>
		<%
			}
		%>
		
		<%
			if (pageSize <= seed * 2) {
				for (int x = 2 ; x < pageSize; x ++) {
		%>
					<li class="<%=currentPage == x? "active":""%>"><a href="<%=url%>?cp=<%=x%>&col=<%=column%>&kw=<%=keyWord%>&<%=paramName%>=<%=paramValue%>"><%=x%></a></li>
		<%
				}
			} else {	// 考虑到省略号的问题，6页以后
				if (currentPage > seed * 2) {
		%>
					<li class="disabled"><span>...</span></li>
		<%
					int startPage = currentPage - seed ;
					int endPage = currentPage + seed ;
					for (int x = startPage ; x <= endPage ; x ++) {
						if (x < pageSize) {
		%>
							<li class="<%=currentPage == x? "active":""%>"><a href="<%=url%>?cp=<%=x%>&col=<%=column%>&kw=<%=keyWord%>&<%=paramName%>=<%=paramValue%>"><%=x%></a></li>
		<%				}
					}
					if ((currentPage + seed * 2)-1 <= pageSize) {	// 后面还有内容
		%>
					<li class="disabled"><span>...</span></li>
		<%
					}
				} else {	// 6页以前
					for (int x = 2 ; x <= currentPage + seed ; x ++) {
		%>
						<li class="<%=currentPage == x? "active":""%>"><a href="<%=url%>?cp=<%=x%>&col=<%=column%>&kw=<%=keyWord%>&<%=paramName%>=<%=paramValue%>"><%=x%></a></li>
		<%
					} 
					if ((currentPage + seed * 2) <= pageSize) {
		%>
						<li class="disabled"><span>...</span></li>
		<%
					}
				}
			}
		%>
		
		<%
			if (currentPage == pageSize) {	// 已经在最后一页
		%>
		<%
				if (pageSize != 1) {
		%>
					<li class="active"><span><%=pageSize%></span></li>
		<%
				}
		%>
				<li class="disabled"><span>下一页</span></li>
		<%
			} else {
		%>
				<li><a href="<%=url%>?cp=<%=pageSize%>&col=<%=column%>&kw=<%=keyWord%>&<%=paramName%>=<%=paramValue%>"><%=pageSize%></a></li>
				<li><a href="<%=url%>?cp=<%=currentPage + 1%>&col=<%=column%>&kw=<%=keyWord%>&<%=paramName%>=<%=paramValue%>">下一页</a></li>
		<%
			}
		%>
		</li>
		<li>
			<input type="text" size="5" id="goPage">
			<input type="button" value="跳转" id="goBut" onclick="goButFun()">
		</li>
	</ul>
</div>
<script type="text/javascript">
	function goButFun() {
		window.location = "<%=url%>?cp=" + document.getElementById("goPage").value + "&col=<%=column%>&kw=<%=keyWord%>&<%=paramName%>=<%=paramValue%>" ;
	}
</script>