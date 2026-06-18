package com.employee.service;

import com.employee.DAO.EmployeeDAOImpl;
import com.employee.domain.Employee;

public class EmployeeServiceImpl implements EmployeeService {
    private EmployeeDAOImpl employeeDAOImpl;
    
    
    
	public void setEmployeeDAOImpl(EmployeeDAOImpl employeeDAOImpl) {
		this.employeeDAOImpl = employeeDAOImpl;
	}



	@Override
	public int   saveEmployeeData(Employee employee) {
		// TODO Auto-generated method stub
		int status=employeeDAOImpl.saveEmployeeDB(employee);
		
		System.out.println("in method saveEmployeeData");
		
		return status;
	}

}
