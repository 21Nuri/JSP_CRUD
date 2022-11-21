<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dao.BoardDAO, com.example.bean.BoardVO"%>
<%@ page import="com.example.common.FileUpload" %>
<%
	String sid = request.getParameter("id");
	if (sid != ""){
		int seq = Integer.parseInt(sid);
		BoardVO u = new BoardVO();
		u.setSeq(seq);

		String filename= u.getPhoto();
		if(filename != null) FileUpload.deleteFile(request, filename);

		BoardDAO boardDAO = new BoardDAO();
		boardDAO.deleteBoard(u);
	}
	response.sendRedirect("posts.jsp");
%>