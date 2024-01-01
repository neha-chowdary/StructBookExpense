package com.actions;

import org.hibernate.Session;

import org.hibernate.Transaction;

import com.helper.FactoryProvider;
import com.opensymphony.xwork2.ActionSupport;
import com.vignan.Expense;

public class AddExpenseAction extends ActionSupport {
	Expense expense = new Expense();

	public String add() {

		Session session = FactoryProvider.getFactory().openSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();
			session.merge(expense);
			tx.commit();
			addActionMessage("Expenses created successfully!");
			return SUCCESS;
		} catch (Exception e) {
			// Rollback the transaction in case of an exception
			if (tx != null && tx.isActive()) {
				tx.rollback();
			}
			// Handle any exceptions that occur during thebookcreation process
			addActionError("Error creating expense: " + e.getMessage());
			return ERROR;
		} finally {
			// Close the Hibernate session
			session.close();
		}
	}

	public Expense getExpense() {
		return expense;
	}

	public void setExpense(Expense expense) {
		this.expense = expense;
	}
}
