<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="org.hibernate.SessionFactory"%>
<%@ page import="org.hibernate.Session"%>
<%@ page import="com.vignan.Expense"%>
<%@ page import="com.helper.FactoryProvider"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Finance</title>
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

input[type="text"] {
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

table {
	width: 80%;
	margin: 20px auto;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ccc;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}
</style>
</head>
<body>
	<h1>Update Expense</h1>

	<h2>List of Expenses</h2>
	<table>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Description</th>
			<th>Amount</th>
			
			<th>Category</th>
				
		</tr>

		<%
    Session session2 = FactoryProvider.getFactory().openSession();
    try {
        session2.beginTransaction();
        List<Expense> expenses = session2.createQuery("from Expense").getResultList();
        
        for (Expense expense : expenses) { // Iterate over 'expenses' list
%>
            <tr>
                <td><%= expense.getId() %></td>
                <td><%= expense.getName() %></td>
                <td><%= expense.getDescription() %></td>
                <td><%= expense.getAmount() %></td>
                <td><%= expense.getCategory() %></td>
                <!-- Add additional columns if needed -->
            </tr>
<%
        }
        session2.getTransaction().commit();
    } finally {
        session2.close();
    }
%>
        %>
	</table>

	<h2>Update Book</h2>
	<s:form action="/expense/updateExpenseAction.action" >
		<label for="Id">Expense ID:</label>
		<s:textfield label="Expense ID" name="id" required="true" />

		<label for="Name">Name:</label>
		<s:textfield label="Name" name="name" required="true" />

		<label for="Description">Description:</label>
		<s:textfield label="Description" name="description" required="true" />
		
		<label for="Amount">Amount:</label>
		<s:textfield label="Amount" name="amount" required="true" />
		
	<label for="Category">Category:</label>
		<s:textfield label="Category" name="category" required="true" />
		
			
		
		
		
		


		<s:submit value="Update Expense" />
	</s:form>
</body>
</html>
