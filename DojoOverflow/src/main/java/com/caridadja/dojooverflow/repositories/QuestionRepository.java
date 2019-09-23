package com.caridadja.dojooverflow.repositories;

import org.springframework.data.repository.CrudRepository;

import com.caridadja.dojooverflow.models.Question;

public interface QuestionRepository extends CrudRepository<Question, Long> {

}
