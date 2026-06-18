package com.maven.MavenQuickStartProject;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

public  class StudentJDBCTemplate implements StudentDAO1 {
	   
	   private JdbcTemplate jdbcTemplate;

	    public void setJdbcTemplate(
	            JdbcTemplate jdbcTemplate) {
	        this.jdbcTemplate = jdbcTemplate;
	    }

	   // set the datasource and jdbctemplate 
	   

	   // get all the students from the database
	   public List<Student> ListStudents(){
	      String SQL = "select * from  hostelstudentinfo";
	      List <Student> students = jdbcTemplate.query(SQL, new StudentRowMapper());
	      return students;
	   }

}
