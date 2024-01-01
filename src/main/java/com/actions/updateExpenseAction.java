package com.actions;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.helper.FactoryProvider;
import com.opensymphony.xwork2.ActionSupport;
import com.vignan.Expense;

public class updateExpenseAction extends ActionSupport {

	private int id;
    private String name;
    private String description;
    private int amount;
    private String category;
    

    public String update() {
        Session session = FactoryProvider.getFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            Expense expense = session.get(Expense.class, id);

            if (expense != null) {
                // Update employee information
            	
               expense.setName(name);
               expense.setDescription(description);
                expense.setAmount(amount);
                expense.setCategory(category);
               
                session.merge(expense);
                tx.commit();
                addActionMessage("expenses updated successfully!");
                return SUCCESS;
            } else {
                addActionError("Book with id " + id + " not found.");
                return ERROR;
            }
        } catch (Exception e) {
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }
            addActionError("Error updating Book: " + e.getMessage());
            return ERROR;
        } finally {
            session.close();
        }
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount=amount;
		
	}
 
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	
}
