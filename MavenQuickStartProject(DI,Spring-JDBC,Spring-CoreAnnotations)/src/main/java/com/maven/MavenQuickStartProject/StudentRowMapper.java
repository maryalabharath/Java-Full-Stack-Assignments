package com.maven.MavenQuickStartProject;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class StudentRowMapper
implements RowMapper<Student> {


public Student mapRow(ResultSet rs,
                  int rowNum)
                  throws SQLException {

Student s = new Student();

s.setStudentId(rs.getInt("student_id"));
s.setStudentName(rs.getString("student_name"));
s.setHostelFee(rs.getDouble("hostel_fee"));
s.setFoodType(rs.getString("food_type"));

return s;
}
}
