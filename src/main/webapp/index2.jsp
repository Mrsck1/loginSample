<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%String errMsg = null; %>
<%if("Post".equalsIgnoreCase(request.getMethod())&& request.getParameter("submit") != null){ %>
<jsp:useBean id="loginBean" class="packt.book.jee_eclipse.ch2.bean.LoginBeans">

<jsp:setProperty name="loginBean" property="*" />

<jsp:setProperty name="loginBean" property="userName" value=" <%= request.getParameter("userName") %> " />
<jsp:setProperty name="loginBean" property="password" value=" <%= request.getParameter("password")%> " />




</jsp:useBean>
<%if(loginBean.isValidUser()){
	
	//Valid user
	out.println("<h2>Welcome admin !</h2>");
	out.println("You are successfully logged in !");
}else{
	errMsg = "Invalid or password. Please trey again";
}

%>

<%} %>
<body>
	<h2>Login:</h2>
	
	<%
		if(errMsg != null){ %>
		<span style="color:red;"> <% out.print(errMsg); %></span>
			
	<%	}%>
	
	<form method="post">
	
	User Name: <input type="text" name="userName"><br>
	Password: <input type="password" name="password"><br>
	<button type="submit" name="submit">Submit</button>
	<button type="reset">Reset</button>
	</form>
	
</body>
</html>