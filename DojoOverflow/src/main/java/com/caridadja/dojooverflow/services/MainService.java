package com.caridadja.dojooverflow.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.caridadja.dojooverflow.models.Answer;
import com.caridadja.dojooverflow.models.Question;
import com.caridadja.dojooverflow.models.Tag;
import com.caridadja.dojooverflow.repositories.AnswerRepository;
import com.caridadja.dojooverflow.repositories.QuestionRepository;
import com.caridadja.dojooverflow.repositories.TagRepository;

@Service
public class MainService {
	TagRepository tagRepository;
	QuestionRepository questionRepository;
	AnswerRepository answerRepository;
	
	public MainService(TagRepository tagRepository, QuestionRepository questionRepository,
			AnswerRepository answerRepository) {
		super();
		this.tagRepository = tagRepository;
		this.questionRepository = questionRepository;
		this.answerRepository = answerRepository;
	}
	
	public void addAnswer(Answer answer) {
		answerRepository.save(answer);
	}
	public void addQuestion(Question question) {
		questionRepository.save(question);
	}
	public void addTag(Tag tag) {
		List<Tag> tags = tagRepository.findByName(tag.getName());
		if(tags.size() == 0) {
			tagRepository.save(tag);
		}
	}
	
	public List<Answer> getAnswers(){
		return (List<Answer>) answerRepository.findAll();
	}
	public List<Question> getQuestions(){
		return (List<Question>) questionRepository.findAll();
	}
	public List<Tag> getTags(){
		return (List<Tag>) tagRepository.findAll();
	}
	public Question getQuestionById(Long id) {
		Optional<Question> question = questionRepository.findById(id);
		if(question.isPresent()) {
			return question.get();
		}
		else {
			return null;
		}
	}
}
