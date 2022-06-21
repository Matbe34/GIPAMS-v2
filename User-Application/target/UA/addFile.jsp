<%@page import="Utils.Utils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% if(!Utils.checkAuth(request)){System.out.println("Permission denied!");response.sendRedirect("sso/login");return;} %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add File</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>
<body>
<nav>
    <div class="nav-wrapper blue darken-1">
        <ul id="nav-mobile" class="left hide-on-med-and-down">
            <li><a href="home.jsp">Home</a></li>
            <li><a href="addFile.jsp" class="collection-item">Add file</a></li>
            <li><a href="ownFiles.jsp">Own files</a></li>
            <li><a href="searchDatasetGroup.jsp">Search Dataset Group</a></li>
            <li><a href="searchDataset.jsp">Search Dataset</a></li>
        </ul>
        <ul id="nav-mobile2" class="right hide-on-med-and-down">
            <li><a href="logout">Logout</a></li>
        </ul>
    </div>
</nav>

<div class="container">
    <h1>Create new file</h1>
    <div class="row">
        <form  method="post" action="addFile" class="col s12">
            <div class="input-field">
                <input placeholder="File name" name="file_name" type="text">
                <label>File name</label>
            </div>
            <br>
            <div class="input-field">
                <button class="btn waves-effect waves-light" type="submit">
                    <i class="material-icons dp48">file_upload</i> Create file
                </button>
            </div>
        </form>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>