<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FILEBOXX</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- ... Your existing code ... -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="style.css">
</head>
<body>
	<%
		String path = (String)request.getAttribute("path");
		ArrayList<String> files = (ArrayList<String>)request.getAttribute("files");
		ArrayList<String> folders = (ArrayList<String>)request.getAttribute("folders");
		String previous_path = (String)request.getAttribute("previous_path");
		String filestore = "";
	%>



<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
    FileBoxx</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <button class="btn btn-outline-primary mx-1" onclick='window.location.href = "index.jsp"'>Home</button>

        <button class="btn btn-outline-success mx-1" id="create_folder_button">Create Folder</button>
		<button class = "btn btn-outline-danger mx-1" id="delete_folder_button">Delete This Folder</button>
	
    <div id="inputBar" class="hidden">
	    <form action="<%= request.getContextPath()%>/FolderManager" method="get">
			<input type="hidden" name="path" value="${path}">
			<input type="hidden" name="action" value="create">
			<input class="inputbar me-2" type="text" name="folder" placeholder="Enter new folder name">
			<input class="btn btn-outline-success" type="submit" value="Create">
		</form>
    </div>
    <script>
        const create_folder_button = document.getElementById('create_folder_button');
        const inputBar = document.getElementById('inputBar');

        create_folder_button.addEventListener('click', () => {
        	inputBar.classList.toggle('hidden');
        });
        </script>
        <script>
    function showModal(file) {
        var modalTitle = document.getElementById("filemodaltitle");
        modalTitle.innerText = file; // Set modal title to the file name
        //${filestore} = file;
        var myFilestore = document.getElementById('filestore');
        var myFilestore2 = document.getElementById('filestore2');
        myFilestore.value = file;
        myFilestore2.value = file;
        // Trigger modal display
        var myModal = new bootstrap.Modal(document.getElementById('filemodal'));
        myModal.show();
    }
</script>
    
    <div id="inputBar2" class="hidden">
	    <form action="<%= request.getContextPath()%>/FolderManager" method="get">
			<input type="hidden" name="path" value="${path}">
			<input type="hidden" name="action" value="delete">
			<input class="inputbar me-2" type="text" name="folder" placeholder="Enter folder/file name">
			<input class="btn btn-outline-danger" type="submit" value="Delete">
		</form>
    </div>
    <script>
        const delete_folder_button = document.getElementById('delete_folder_button');
        const inputBar2 = document.getElementById('inputBar2');

        delete_folder_button.addEventListener('click', () => {
            inputBar2.classList.toggle('hidden');
        });
    </script>
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
	
	<script>
    function submitForm(file) {
        var formId = "fileform_" + file;
        var form = document.getElementById(formId);
        form.submit();
    }
	</script>
	
	<div id="folder-container" class="mx-3">
	<c:forEach items="${folders}" var="folder">
    <form class="form-inline" id="folderform" action="<%= request.getContextPath() %>/FileManager" method="get">
        <input type="hidden" name="path" value="${path}/${folder}" />
        <input type="hidden" name="previous_path" value="${path}" />
        <button type="submit" class="butn zoom">
        <img id="myimage" alt="folder-image" src="img/folder-img.png">
        <br/>
        ${fn:substring(folder, 0, 10)}${fn:length(folder) > 10 ? '...' : ''}
        </button>
    </form>
	</c:forEach>
	<c:forEach items = "${files}" var="file">
	<form class="form-inline" id="fileform" action="<%= request.getContextPath() %>/DownloadManager" method="get">
		<input type="hidden" name="path" value="${path}" />
		<input type="hidden" name="file" value="${file}" />
		<button type="button" class="butn zoom" onclick="showModal('${file}')">
    	    <img  id="myimage" alt="file-image" src="img/files_icon.png">
        <br/>        
        ${fn:substring(file, 0, 10)}${fn:length(file) > 10 ? '...' : ''}
        </button>
		</form>
	</c:forEach>
	
	</div>
	
	<div id="filemodal" class="modal fade" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 id="filemodaltitle" class="modal-title">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-footer">
      <form id="downloadform" action="<%= request.getContextPath() %>/DownloadManager" method="get">
      	<input type="hidden" name="path" value="${path}" />
		<input id="filestore" type="hidden" name="file" />
        <button type="submit" class="btn btn-success">Download</button>
      </form>
      <form id="deleteform" action="<%= request.getContextPath() %>/FolderManager" method="get">
      	<input type="hidden" name="path" value="${path}" />
		<input type="hidden" name="action" value="delete" />
		<input id="filestore2" type="hidden" name="folder">
        <button type="submit" class="btn btn-danger" value="Delete">Delete</button>
      </form>
      </div>
    </div>
  </div>
</div>


	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    
    <footer class="navbar navbar-expand-lg navbar-dark bg-dark fixed-bottom">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
      	<div id="back-and-path">
		<form action="<%= request.getContextPath() %>/FileManager" method="get">
			<input type="hidden" name="path" value="${previous_path}" />
			<button id="back-button" class="btn btn-primary mx-2" type="submit">
				BACK	
			</button>	
		</form>
		<h4 id="path-txt">Current Folder - <%= path %></h4>
	</div>
      </ul>
      	<c:url value="/UploadManager" var="uploadurl">
		<c:param name="path" value="${path}"></c:param>
		</c:url>
		<form action="${uploadurl}" method="post" enctype="multipart/form-data" class="footer-form">
			<h4 class="select-files">Select files: </h4>
			<input class="btn btn-outline-secondary mx-3" type="file" name="files" multiple/>
			<input class="btn btn-success" type="submit" value="Upload">
		</form>
    </div>
  </div>
    </footer>
</body>
</html>