<html>
<%@ page language="java" import="javazoom.upload.*,java.util.*" %>
<%@ page errorPage="ExceptionHandler.jsp" %>

<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
  <jsp:setProperty name="upBean" property="folderstore" value="C:/Users/TATARAO/Documents/NetBeansProjects/JspFileUpload/web/uploads" />
</jsp:useBean>

<head>
<title>Samples : Simple Upload</title>
<style TYPE="text/css">
.style1 {
	font-size: 12px;

}
#submit
{
 height: 24px;
 width: 65px;
font: bold 11px tahoma;
text-align: center;
color: white;
 background:#296CAC;
 border: 1px solid #296CAC;
 cursor:pointer;
 padding: 4px 4px 4px 4px;
 font-weight: bold;
 -webkit-border-radius: 12px;
    -moz-border-radius: 2px;
     border-radius: 10px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="#FFFFFF" text="#000000">
<center>
<ul class="style1">
<%
      if (MultipartFormDataRequest.isMultipartFormData(request))
      {
         // Uses MultipartFormDataRequest to parse the HTTP request.
         MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
         String todo = null;
         if (mrequest != null) todo = mrequest.getParameter("todo");
	     if ( (todo != null) && (todo.equalsIgnoreCase("upload")) )
	     {
                Hashtable files = mrequest.getFiles();
                if ( (files != null) && (!files.isEmpty()) )
                {
                    UploadFile file = (UploadFile) files.get("uploadfile");
                    if (file != null) out.println("<li>Form field : uploadfile"+"<BR> Uploaded file : "+file.getFileName()+" ("+file.getFileSize()+" bytes)"+"<BR> Content Type : "+file.getContentType());
                    // Uses the bean now to store specified by jsp:setProperty at the top.
                    upBean.store(mrequest, "uploadfile");
                }
                else
                {
                  out.println("<li>No uploaded files");
                }
	     }
         else out.println("<BR> todo="+todo);
      }
%>
</ul>
<br>
<br>
<form method="post" action="index.jsp" name="upform" enctype="multipart/form-data">
<table border="1" width="100%" height="22%">
<tr>
<td align="center">
  <table width="50%" border="0" cellspacing="1" cellpadding="1" class="style1">
    <tr>
      <td align="right"><b>Select a file to upload :</b></td>
      <td>
        <input type="file" name="uploadfile" size="50">
      </td>
    </tr>
    <tr>
      <td colspan="2" align="center">
		<input type="hidden" name="todo" value="upload">
        <input type="submit" id="submit" name="Submit" value="Upload">
        <input type="reset" id="submit" name="Reset" value="Cancel">
        </td>
    </tr>
  </table>
  </td>
  </tr>
  </table>
  </form>
  </center>
</body>
</html>
