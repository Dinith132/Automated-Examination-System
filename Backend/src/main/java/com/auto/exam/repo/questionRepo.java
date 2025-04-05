package com.auto.exam.repo;

import com.auto.exam.Model.Question;
import jakarta.persistence.criteria.CriteriaBuilder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface questionRepo extends JpaRepository<Question, Long> {

    @Query("SELECT q FROM Question q WHERE q.exam.id = :examID")
    List<Question> findQuestionById(@Param("examID") long examID);
    
    @Query("SELECT q.marks FROM Question q WHERE q.questionId = :questionId")
    int findMarksByQuestionId(Long questionId);

    // Get the correct answer for a specific question
    @Query("SELECT q.answer FROM Question q WHERE q.questionId = :questionId")
    String findAnswerByQuestionId(Long questionId);

    @Query("SELECT CASE WHEN COUNT(q) > 0 THEN true ELSE false END FROM Question q WHERE q.exam.id = :examId AND q.questionId = :questionId")
   boolean existsByExamIdAndQuestionId(@Param("examId") Long examId, @Param("questionId") long questionId);



}
