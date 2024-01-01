<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.vignan.Expense" %>
<%@ page import="com.helper.FactoryProvider" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List Expenses</title>
    <style>
        /* Add your CSS styles here */
        body {
            font-family: Arial, sans-serif;
        }
        h1 {
            color: #333;
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
    <h1>List of Expenses</h1>
    
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
            
            for (Expense expense : expenses) { // Use 'expenses' here instead of 'books'
    %>
                <!-- Your table rows -->
                <tr>
                    <td><%= expense.getId() %></td>
                    <td><%= expense.getName() %></td>
                    <td><%= expense.getDescription() %></td>
                    <td><%= expense.getAmount() %></td>
                    <td><%= expense.getCategory() %></td>
                </tr>
    <%
            }
            session2.getTransaction().commit();
        } finally {
            session2.close();
        }
    %>
        
        <div class="container text-center mt-2">
        	<a href="index.jsp" class="btn btn-primary">Home</a>
        </div>
    </table>
</body>
</html>
