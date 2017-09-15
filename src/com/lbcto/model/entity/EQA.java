package com.lbcto.model.entity;

public class EQA {

	private String status;
	private String question;
	private String answer;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public EQA(String status, String question, String answer) {
		super();
		this.status = status;
		this.question = question;
		this.answer = answer;
	}
	public EQA() {
		super();
	}
	
	
}
