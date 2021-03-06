<?xml version="1.0" encoding="UTF-8"?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/demo.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui-util.js"></script>
 </head>
 <body>
	<table id="gridLoan" ></table>
	<script type="text/javascript">
		var datagrid;
		$(function(){
// 			$("form > div").css("margin" , "10px 0px 0px 0px");
			datagrid = $('#gridLoan').datagrid({   
			    url:'${pageContext.request.contextPath}/verify/loanList',
			    fit:true,
			    fitColumns:true,
			    rownumbers:true,
			    columns:[[   
			        {field:'id',title:'ID',width:'12%',sortable:true},   
			        {field:'name',title:'项目名称',width:'15%',sortable:true}, 
			        {field:'userId',title:'项目发起人',width:'10%',sortable:true},
			        {field:'money',title:'借款总金额',width:'10%'}, 
			        {field:'status',title:'项目状态',width:'6%'},
			        {field:'commitTime',title:'项目发起时间',width:'15%',sortable:true,formatter: function(value,row,index){
			        	if (value != null) {
			        		var date = new Date(value);
			        		return date.getFullYear() + '-' + (date.getMonth() + 1) + '-'
			        		+ date.getDate();
			        	}
			        }}
			    ]],
				pagination : true,
				pageSize : 20,
				singleSelect : true
			});  
		});
	</script>
  </body>
</html>
