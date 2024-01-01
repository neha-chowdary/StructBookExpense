<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Finance Management</title>
    <style>
        /* Add your CSS styles here */
        body {
            font-family: Arial, sans-serif;
        }
        h1 {
            color: #333;
        }
        .operation-links {
            margin-top: 20px;
        }
        .operation-links a {
            margin-right: 10px;
            text-decoration: none;
            padding: 5px 10px;
            background-color: #007bff;
            color: #fff;
            border: 1px solid #007bff;
            border-radius: 5px;
        }
        .operation-links a:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>Finance Management</h1>
    
    <div class="operation-links">
        <s:a href="addExpense.jsp">Add Expense</s:a>
        <s:a href="listExpenses.jsp">List Expenses</s:a>
        <s:a href="updateExpense.jsp">Update Expense</s:a>
        
        <s:a href="deleteExpense.jsp">Delete Expense</s:a>
    </div>
</body>
</html>