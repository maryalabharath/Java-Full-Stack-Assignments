package com.maven.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.employee.domain.Employee;
import com.employee.service.EmployeeServiceImpl;

public class EmployeeSave implements Controller {

    private EmployeeServiceImpl employeeServiceImpl;
    
    
    public void setEmployeeServiceImpl(EmployeeServiceImpl employeeServiceImpl) {
		this.employeeServiceImpl = employeeServiceImpl;
	}


	@Override
    public ModelAndView handleRequest(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        String empId = request.getParameter("empId");
        String empName = request.getParameter("empName");
        String salary = request.getParameter("salary");
        String department = request.getParameter("department");
        Employee employee=new Employee();
        employee.setEmpId(empId);  
        employee.setEmpName(empName);
        employee.setSalary(salary);   
        employee.setDepartment(department);   
        
        ModelAndView mv;
        try {
            int result = employeeServiceImpl.saveEmployeeData(employee);

            if(result == 1) {
                mv = new ModelAndView("employeeResult");

                mv.addObject("empId", empId);
                mv.addObject("empName", empName);
                mv.addObject("salary", salary);
                mv.addObject("department", department);
            } else {
                mv = new ModelAndView("failPage");
            }
        }
        catch(Exception e) {
            mv = new ModelAndView("failPage"); 
        }
		return mv;
  
    }
}