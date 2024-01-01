j<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Expense</title>
    <style>
        /* Add your CSS styles here */
        body {
            font-family: Arial, sans-serif;
        }
        h1 {
            color: #333;
        }
        form {
            max-width: 400px;
            margin: 0 auto;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>Add Expense</h1>
    
    <s:form action="/expense/AddExpenseAction.action">
         <s:textfield label="id" name="expense.id" required="true"/>
        <s:textfield label="Name" name="expense.name" required="true"/>
        <s:textfield label="Description" name="expense.description" required="true"/> 
         <s:textfield label="Amount" name="expense.amount" required="true"/> 
        <s:textfield label="Category" name="expense.category" required="true"/> 
         
            
        <s:submit value="Add Finance" cssClass="submit-button"/>
    </s:form>
</body>
</html>

