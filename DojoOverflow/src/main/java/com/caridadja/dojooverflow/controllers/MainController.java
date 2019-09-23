package com.caridadja.dojooverflow.controllers;

import javax.validation.Valid;

import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.caridadja.dojooverflow.models.Tag;
import com.caridadja.dojooverflow.services.MainService;

@Controller
@RequestMapping("")
public class MainController {
	private MainService mainService;

	public MainController(MainService mainService) {
		super();
		this.mainService = mainService;
	}
	@RequestMapping("")
	public String index(Model model) {
		model.addAttribute("questions", mainService.getQuestions());
		return "index.jsp";
	}
	}
