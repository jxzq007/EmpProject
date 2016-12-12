<%@ page pageEncoding="UTF-8"%>
<%--
	实现数据搜索条的控制
<jsp:include page="split_page_plugin_search.jsp">
	<jsp:param name="url" value="<%=url%>"/>
	<jsp:param name="columnData" value="<%=columnData%>"/>
	<jsp:param name="keyWord" value="<%=keyWord%>"/>
	<jsp:param name="column" value="<%=column%>"/>
</jsp:include>
--%>
<%
	request.setCharacterEncoding("UTF-8") ;
	String url = request.getParameter("url") ;
	String columnData = request.getParameter("columnData") ;
	String keyWord = request.getParameter("keyWord") ;
	String column = request.getParameter("column") ;
%>
<div id="searchDiv">
	<form action="<%=url%>" method="post">
		<%
			if (columnData != null) {
		%>
				<select id="col" name="col">
				<%
					String result [] = columnData.split("\\|") ;
					for (int x = 0 ; x < result.length ; x ++) {
						String temp [] = result[x].split(":") ;
				%>
						<option value="<%=temp[1]%>" <%=column.equals(temp[1])?"selected":""%>><%=temp[0]%></option>
				<%
					}
				%>
				</select>
		<%
			}
		%>
		<input type="text" name="kw" id="kw" placeholder="请输入模糊查询关键字" value="<%=keyWord == null ? "" : keyWord%>">
		<input type="submit" value="查询">
	</form>
</div>