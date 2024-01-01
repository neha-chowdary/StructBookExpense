package com.actions;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.helper.FactoryProvider;
import com.opensymphony.xwork2.ActionSupport;
import com.vignan.Expense;

public class deleteExpenseAction extends ActionSupport {
    private int id;

    public String delete() {
        Session session = FactoryProvider.getFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            Expense expense = session.get(Expense.class, id); // Change variable name from 'student' to 'expense'

            if (expense != null) {
                // Delete the expense from the database
                session.remove(expense); // Corrected variable name
                tx.commit();
                addActionMessage("Expense deleted successfully!");
                return SUCCESS;
            } else {
                addActionError("Expense with ID " + id + " not found.");
                return ERROR;
            }
        } catch (Exception e) {
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }
            addActionError("Error deleting expense: " + e.getMessage());
            return ERROR;
        } finally {
            session.close();
        }
    }

    // Getter and setter for the ID
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
