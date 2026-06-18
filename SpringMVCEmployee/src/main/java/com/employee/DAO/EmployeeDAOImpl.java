package com.employee.DAO;

import org.springframework.jdbc.core.JdbcTemplate;

import com.employee.domain.Employee;

public class EmployeeDAOImpl  implements EmployeeDAO
{
	private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(
            JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
	
	public int  saveEmployeeDB(Employee employee) {
		// TODO Auto-generated method stub
		 String sql = "INSERT INTO employeeinfo(emp_id, emp_name, salary, department) VALUES (?, ?, ?, ?)";

	     int status=  jdbcTemplate.update(
	                sql,
	                employee.getEmpId(),
	                employee.getEmpName(),
	                employee.getSalary(),
	                employee.getDepartment()
	        );
	     return status;
	       
	
	}

}
