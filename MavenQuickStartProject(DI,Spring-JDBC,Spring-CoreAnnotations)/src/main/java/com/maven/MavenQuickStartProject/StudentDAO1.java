package com.maven.MavenQuickStartProject;
import java.util.List;
import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
public interface StudentDAO1 {
  
  public List<Student> ListStudents();
  
}
