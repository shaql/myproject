<?xml version="1.0" encoding="UTF-8"?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色管理</title>

<!--<SCRIPT type="text/javascript" src="${pageContext.request.contextPath}/js/user/role.js"></SCRIPT>-->

</head>
<body>
	<table id="gridRloe" ></table>
	<script type="text/javascript">
	$(function(){
		$("form > div").css("margin" , "10px 0px 0px 0px");
		
		datagrid = $('#gridRloe').datagrid({   
		    url:'${pageContext.request.contextPath}/user/roleList',
		    fit:true,
		    fitColumns:true,
		    rownumbers:true,
		    columns:[[   
		        {field:'id',title:'ID',width:'10%',sortable:true},   
		        {field:'name',title:'用户名',width:'15%',sortable:true},   
		        {field:'description',title:'备注',width:'15%'}  
		        
		    ]],
		    toolbar:[
			    {
					text : '增加',
					iconCls : 'icon-add',
					handler : function() {
						append();
					}
				},'-',{
					text : '删除',
					iconCls : 'icon-remove',
					handler : function() {
						remove();
					}
				}, '-', {
					text : '修改',
					iconCls : 'icon-edit',
					handler : function() {
						edit();
					}
				}, '-', {
					text : '取消选中',
					iconCls : 'icon-undo',
					handler : function() {
						datagrid.datagrid('clearSelections');
						datagrid.datagrid('unselectAll');
					}
				}, '-', {
					text : '批量修改用户角色',
					iconCls : 'icon-edit',
					handler : function() {
						editRole();
					}
				}, '-'],
			pagination : true,
			pageSize : 20,
			singleSelect : true
		});  
	});
	
	function append () {
		var row = datagrid.datagrid('getSelected');
		parent.$.modalDialog({   
		    title: '添加用户',   
		    width: 400,   
		    height: 250,
		    minimizable:true,
		    maximizable:true,
		    resizable:true,
		    closed: false,
		    href: '${pageContext.request.contextPath}/user/roleAdd',
		    buttons : [{
				text : '添加',
				handler : function() {
					parent.$.modalDialog.openner_datagrid = datagrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
					var f = parent.$.modalDialog.handler.find('#addRoleForm');
					f.submit();
				}
			}]
		});
	}
	
	function edit () {
		var row = datagrid.datagrid('getSelected');
		if (row) {
			parent.$.modalDialog({   
			    title: '编辑角色',   
			    width: 380,   
			    height: 200,   
			    closed: false,   
			    cache: false,   
			    href: '${pageContext.request.contextPath}/role/roleEdit?id='+row.id,   
			    buttons : [ {
					text : '提交',
					handler : function() {
						parent.$.modalDialog.openner_datagrid = datagrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
						var f = parent.$.modalDialog.handler.find('#addRoleForm');
						f.submit();
					}
				}]
			});   
		}
	}
	
	function remove (){
		debugger
		var row = datagrid.datagrid('getSelected');
		if(row != null){
			$.messager.confirm('询问', '您是否要删除当前资源？', function(b) {
				if (b) {
					$.messager.progress({
						title : '提示',
						text : '数据处理中，请稍后....'
					});
					$.post('${pageContext.request.contextPath}/role/roleRemove', {
						id : row.id
					},function(data){
						debugger
						if (data.success) {
							datagrid.datagrid('reload');
							$.messager.alert('提示',data.msg,'info');
						}else{
							$.messager.alert('提示',data.msg,'error');
						}
						$.messager.progress('close');
					},'JSON');
				}
			});			
		}else {
			$.messager.alert('提示','请选择要删除的记录','error');
			
		}
		
	}
	
	</script>
</body>
</html>