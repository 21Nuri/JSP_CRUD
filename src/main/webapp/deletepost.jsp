<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dao.BoardDAO, com.example.bean.BoardVO"%>
<%@ page import="com.example.common.FileUpload" %>
<%
	String seq = request.getParameter("seq");
	if (seq != ""){
		int sq = Integer.parseInt(seq);
		BoardVO u = new BoardVO();
		BoardDAO boardDAO = new BoardDAO();
		String filename= boardDAO.getPhotoFilename(sq);

		if(filename != null) FileUpload.deleteFile(request, filename);
		u.setSeq(sq);
		boardDAO.deleteBoard(u);
	}
	response.sendRedirect("posts.jsp");
%>