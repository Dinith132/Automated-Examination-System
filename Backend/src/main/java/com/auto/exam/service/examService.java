package com.auto.exam.service;


import com.auto.exam.Dto.ExamReportAll;
import com.auto.exam.Dto.ExamRequest;
import com.auto.exam.Dto.ExamSave;
import com.auto.exam.Dto.Examevent;
import com.auto.exam.Dto.MarkQuestions;
import com.auto.exam.Dto.ProvideQuestion;
import com.auto.exam.Model.*;
import com.auto.exam.repo.*;
import com.auto.exam.util.SecurityUtil;

import org.springframework.security.core.Authentication;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class examService {
    private examRepo examRepo;
    private courseRegisterRepo courseRegisterRepo;
    private userRepo userRepo;
    private studentDetailsService studentDetailsService;
    private questionRepo questionRepo;
    private attemptRepo attemptRepo;
    private studentRepo studentRepo;
    private examanalysisRepo examanalysisRepo;
    private courseOfferingRepo courseOfferingRepo;

    private long ExamId;
  
    @Autowired
    public examService(examRepo examRepo, courseRegisterRepo courseRegisterRepo,questionRepo questionRepo,
                        userRepo userRepo,studentDetailsService studentDetailsService,attemptRepo attemptRepo,
                        studentRepo studentRepo,examanalysisRepo examanalysisRepo, courseOfferingRepo courseOfferingRepo) {
        this.examRepo=examRepo;
        this.courseRegisterRepo=courseRegisterRepo;
        this.questionRepo = questionRepo;
        this.userRepo = userRepo;
        this.studentDetailsService = studentDetailsService;
        this.attemptRepo = attemptRepo;
        this.studentRepo = studentRepo;
        this.examanalysisRepo = examanalysisRepo;
        this.courseOfferingRepo = courseOfferingRepo;
    }
    
    public List<SendingExam> getExamsUsingDateAndLecture(ExamRequest request){
        UserPrincipal userPrincipal = SecurityUtil.getAuthenticatedUser();

        Date date;
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            date = formatter.parse(request.getDate());
        } catch (ParseException e) {
            return null;
        }

        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        String user_name = userPrincipal.getUsername();
        List<Exam> exams = examRepo.findLectureExamByUser(user_name);
        List<Exam> return_exams=exams.stream().filter(exam -> exam.getStartDateTime().toString().equals(outputFormat.format(date))).toList();
        List<SendingExam> sendingExams = return_exams.stream().map(exam -> new SendingExam(exam.getExamId(), exam.getStartDateTime(), exam.getDuration(), exam.getPassingCriteria(), exam.getType(), exam.getTotalMarks(), exam.getCourseOffering().getCourse().getCourseId(), exam.getCourseOffering().getCourse().getCourseName(), exam.getCourseOffering().getCourse().getCourseCode())).collect(Collectors.toList());

        return sendingExams;
    }
    

    public List<SendingExam> getExamsUsingDateAndStudent(ExamRequest request){
        UserPrincipal userPrincipal = SecurityUtil.getAuthenticatedUser();    

        Date date;
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            date = formatter.parse(request.getDate());
        } catch (ParseException e) {
            return null;
        }
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        String user_name = userPrincipal.getUsername();

        List<Exam> exams = examRepo.findStudentExamByUser(user_name);
        List<Exam> return_exams=exams.stream().filter(exam -> exam.getStartDateTime().toString().equals(outputFormat.format(date))).toList();
        List<SendingExam> sendingExams = return_exams.stream().map(exam -> new SendingExam(exam.getExamId(), exam.getStartDateTime(), exam.getDuration(), exam.getPassingCriteria(), exam.getType(), exam.getTotalMarks(), exam.getCourseOffering().getCourse().getCourseId(), exam.getCourseOffering().getCourse().getCourseName(), exam.getCourseOffering().getCourse().getCourseCode())).collect(Collectors.toList());
        return sendingExams;
    }

    public List<ProvideQuestion> getQuestions(long examID) {
 
        Exam exam = Optional.ofNullable(examRepo.findExamByExamId(examID))
                            .orElseThrow(() -> new IllegalArgumentException("Invalid Exam ID"));
 
        LocalDateTime currentDateTime = LocalDateTime.now();


        LocalDateTime examEndTime = exam.getStartDateTime().plusMinutes(exam.getDuration());
        
        if (currentDateTime.isBefore(exam.getStartDateTime()) || currentDateTime.isAfter(examEndTime)) {
                //throw exception or return an error response
                System.out.println("Exam is not available at this time.");
                //return null;
        }
        
        int examDuration = exam.getDuration();
        
        System.out.println("Exam Duration: " + examDuration + " minutes");
    
        this.ExamId = examID;

        // List<ProvideQuestion> questions = questionRepo.findQuestionById(
    
        System.out.println("///////////////////////Question??????????????????????");
        List<ProvideQuestion> questions = questionRepo.findQuestionById(examID).stream()
        .peek(q -> System.out.println("Question Data: " + q.getAnswer()+ " " + q.getMarks() + " " + q.getQuestionType()+ " " + q.getQuestion()+ " " + q.getMcqOptionsList()))
            .map(q -> new ProvideQuestion(q.getQuestionId(), q.getQuestion(), q.getMarks(), q.getMcqOptionsList()))
            .collect(Collectors.toList());
        System.out.println("///////////////////////Question??????????????????????");


        return questions;
    }

    @Transactional
    public List<MarkQuestions> markQuestions(List<MarkQuestions> markQuestions) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserPrincipal userPrincipal = (UserPrincipal) authentication.getPrincipal();

        int TotalMarks = 0;
        Attempt attempt = new Attempt();

        User user = userRepo.findByUsername(userPrincipal.getUsername());
        Student student = studentRepo.findByUser(user);

        Exam exam = examRepo.findExamByExamId(ExamId);
        int type = exam.getType();

        if (type == 0) {
            
            for (MarkQuestions question : markQuestions) {
                //Verify if the question ID belongs to the current exam
                if (!questionRepo.existsByExamIdAndQuestionId(exam.getExamId(), (long) question.getQuestionId())) {
                    System.out.println("Question ID " + question.getQuestionId() + " does not belong to Exam ID " + exam.getExamId());
                    continue; // Skip this question
                }
               
                // // Verify if the question has already been marked for this student
                 if (examanalysisRepo.existsByStudentAndQuestion(student.getStudentId(), question.getQuestionId())) {
                     System.out.println("Question ID " + question.getQuestionId() + " has already been marked for this student.");
                     continue; // Skip this question
                 }
            
                String correctAnswer = questionRepo.findAnswerByQuestionId((long) question.getQuestionId());
                int retrievedMarks = questionRepo.findMarksByQuestionId((long) question.getQuestionId());
            
                ExamAnalysis examAnalysis = new ExamAnalysis();
                examAnalysis.setExam(exam);
                examAnalysis.setQuestion(questionRepo.findById((long) question.getQuestionId()).orElse(null));
                examAnalysis.setStudentAnswer(question.getAnswer());
            
                if (question.getAnswer().equalsIgnoreCase(correctAnswer)) {
                    question.setMarks(retrievedMarks);
                    examAnalysis.setStudentMarks(retrievedMarks);
                } else {
                    question.setMarks(0);
                    examAnalysis.setStudentMarks(0);
                }
                examanalysisRepo.save(examAnalysis);
                TotalMarks += question.getMarks();
            }
            
            attempt.setMarks(TotalMarks);
            attempt.setExam(exam);
            attempt.setGrade(getGrade(TotalMarks));
            attempt.setStudent(student);
            
            try {
                attemptRepo.save(attempt);
            } catch (Exception e) {
                System.out.println("Cannot Attempt More Than One Time " + e);
            }
            return markQuestions;
        }
        else if (type == 1) {
            //marking criteria for Essay type questions
            for (MarkQuestions question : markQuestions) {
                ExamAnalysis examAnalysis = new ExamAnalysis();
                examAnalysis.setExam(exam);
                examAnalysis.setQuestion(questionRepo.findById((long)question.getQuestionId()).orElse(null));
                examAnalysis.setStudentAnswer(question.getAnswer()); 
                examAnalysis.setStudentId(student.getStudentId());
    
                examanalysisRepo.save(examAnalysis); 
    
            }
               return markQuestions;
        }
        else {
            return null;
           
        }

    }



    public Character getGrade(int totalMarks) {
        if (totalMarks >= 90) return 'A';
        else if (totalMarks >= 80) return 'B';
        else if (totalMarks >= 70) return 'C';
        else if (totalMarks >= 60) return 'D';
        else if (totalMarks >= 50) return 'E';
        else return 'F';
    }

    @Transactional
    public Long addExam(ExamSave payload) {
        // Fetch the CourseOffering entity
        Long offeringId = payload.getCourseOfferingId();
        CourseOffering courseOffering = courseOfferingRepo.findById(offeringId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid Offering_ID"));

        // Create the Exam object
        Exam exam = new Exam();
        exam.setStartDateTime(payload.getStartDateTime());
        exam.setDuration(payload.getDuration());
        exam.setPassingCriteria(payload.getPassingCriteria());
        exam.setType(payload.getType());
        exam.setTotalMarks(payload.getTotalMarks());
        exam.setCourseOffering(courseOffering);

        // Save the Exam object first to generate its ID
        examRepo.save(exam);

        // Handle questions
        if (payload.getQuestions() != null && !payload.getQuestions().isEmpty()) {
            for (Question questionPayload : payload.getQuestions()) {
                Question question = new Question();
                question.setQuestion(questionPayload.getQuestion());
                question.setMarks(questionPayload.getMarks());
                question.setAnswer(questionPayload.getAnswer());
                question.setQuestionType(questionPayload.getQuestionType());
                question.setExam(exam); // Associate the question with the exam

                // Handle MCQ options
                if (questionPayload.getMcqOptionsList() != null && !questionPayload.getMcqOptionsList().isEmpty()) {
                    List<McqOptions> mcqOptionsList = questionPayload.getMcqOptionsList().stream().map(optionPayload -> {
                        McqOptions option = new McqOptions();
                        option.setOptionText(optionPayload.getOptionText());
                        option.setIsCorrect(optionPayload.getIsCorrect());
                        option.setQuestion(question); // Associate the option with the question
                        return option;
                    }).collect(Collectors.toList());
                    question.setMcqOptionsList(mcqOptionsList);
                }

                // Save the question (cascading will save options)
                questionRepo.save(question);
            }
        }

        return exam.getExamId();
    }

    public List<SendingExam> getAllExams() {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        List<Exam> exams = examRepo.findStudentExamByUser(username);
        return exams.stream().map(exam -> new SendingExam(exam.getExamId(), exam.getStartDateTime(), exam.getDuration(), exam.getPassingCriteria(), exam.getType(), exam.getTotalMarks(), exam.getCourseOffering().getCourse().getCourseId(), exam.getCourseOffering().getCourse().getCourseName(), exam.getCourseOffering().getCourse().getCourseCode())).collect(Collectors.toList());
    }

    public List<ExamReportAll> getReports(Map<String, Object> payload) {
        Long ExamId = Long.valueOf(payload.get("Exam_id").toString());
        List<ExamReportAll> exams= attemptRepo.getReports(ExamId);
        return exams;
    }

    public Examevent getAllExamEvents() {
        Examevent event=new Examevent();
        event.setEvents(examRepo.getAllExamEvents());
        return event;
    }

    public Examevent getAllExamEventsforStudent() {
        UserPrincipal userPrincipal = SecurityUtil.getAuthenticatedUser();
        String username = userPrincipal.getUsername();
        Examevent event=new Examevent();
        event.setEvents(examRepo.getAllExamEventsByStudentId(username));
        return event;
        
    }
}
