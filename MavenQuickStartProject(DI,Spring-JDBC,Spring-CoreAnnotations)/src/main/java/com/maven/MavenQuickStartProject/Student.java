package com.maven.MavenQuickStartProject;

public class Student {
	private int studentId;
    private String studentName;
    private double hostelFee;
    private String foodType;
    public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public double getHostelFee() {
		return hostelFee;
	}
	public void setHostelFee(double hostelFee) {
		this.hostelFee = hostelFee;
	}
	public String getFoodType() {
		return foodType;
	}
	public void setFoodType(String foodType) {
		this.foodType = foodType;
	}
	
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

}
