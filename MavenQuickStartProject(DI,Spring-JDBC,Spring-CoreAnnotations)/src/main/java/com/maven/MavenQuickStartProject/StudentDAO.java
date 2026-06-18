package com.maven.MavenQuickStartProject;

import java.util.List;
//import org.springframework.jdbc.core.BeanPropertyRowMapper;
//import java.util.Map;

import org.springframework.jdbc.core.JdbcTemplate;

public class StudentDAO {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(
            JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }


    	public void selectAllRows() {

    		 String sql =
    			        "SELECT * FROM hostelstudentinfo";

    			    List<Student> students =
    			        jdbcTemplate.query(
    			            sql,
    			            new StudentRowMapper());

    			    for(Student s : students) {

    			        System.out.println(
    			            s.getStudentId() + " " +
    			            s.getStudentName() + " " +
    			            s.getHostelFee() + " " +
    			            s.getFoodType());
    	}
}
}