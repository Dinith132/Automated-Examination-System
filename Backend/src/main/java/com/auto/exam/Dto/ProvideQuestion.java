package com.auto.exam.Dto;

import java.util.List;

import com.auto.exam.Model.McqOptions;

public class ProvideQuestion {
    private long questionId;
    private String question;
    private Integer marks;
    private List<McqOptions> mcqOptions;

    public ProvideQuestion(long questionId, String question, Integer marks, List<McqOptions> mcqOptions) {
        this.questionId = questionId;
        this.question = question;
        this.marks = marks;
        this.mcqOptions = mcqOptions;
    }

    public ProvideQuestion(Long questionId2, String question2, Integer marks2, List<McqOptions> mcqOptionsList) {
        //TODO Auto-generated constructor stub
    }

    public long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(long questionId) {
        this.questionId = questionId;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public Integer getMarks() {
        return marks;
    }

    public void setMarks(Integer marks) {
        this.marks = marks;
    }
    public List<McqOptions> getMcqOptions() {
        return mcqOptions;
    }
    public void setMcqOptions(List<McqOptions> mcqOptions) {
        this.mcqOptions = mcqOptions;
    }

}
