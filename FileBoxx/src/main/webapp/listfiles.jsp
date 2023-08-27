<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FILEBOXX</title>
</head>
<body>
	<h1>WELCOME</h1>
	<a href="index.jsp">HOME</a>
	<input type="submit" value="DELETE"/>
	<%
		String path = (String)request.getAttribute("path");
		ArrayList<String> files = (ArrayList<String>)request.getAttribute("files");
		ArrayList<String> folders = (ArrayList<String>)request.getAttribute("folders");
		
		
	%>
	<h2>Current Folder - <%= path %></h2>
	<h1>List of Folders</h1>
	<c:forEach items = "${folders}" var="folder">
		<form id="folderform" action ="<%= request.getContextPath() %>/FileManager" method="get">
			<input type="hidden" name="path" value="${path}/${folder}"/>
			<input  type="submit" value="${folder}"/>
		</form>
	</c:forEach>
	<form action="<%= request.getContextPath()%>/FolderManager" method="get">
		<input type="hidden" name="path" value="${path}">
		<input type="hidden" name="action" value="create">
		<input type="text" name="folder" placeholder="Enter new folder name">
		<input type="submit" value="Create Folder">
	</form>
	
	
	
	<h1>List of Files</h1>
	<c:forEach items = "${files}" var="file">
		<c:url value="/DownloadManager" var="downloadurl">
			<c:param name="path" value="${path}"></c:param>
			<c:param name="file" value="${file}"></c:param>
		</c:url>
		<a href="${downloadurl}">"${file}"</a>
	</c:forEach>
	<c:url value="/UploadManager" var="uploadurl">
		<c:param name="path" value="${path}"></c:param>
	</c:url>
	<form action="${uploadurl}" method="post" enctype="multipart/form-data">
		<h1>Select files::</h1><input type="file" name="files" multiple/>
		<input type="submit" value="Upload">
	</form>
</body>
</html>