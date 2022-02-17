package com.nate.languages.controllers;

import java.util.List;

import javax.validation.Valid;

import com.nate.languages.models.Language;
import com.nate.languages.services.LanguageService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

@Controller
public class LanguageController {
	@Autowired
	LanguageService languageService;

	// ------------------ Retrieve All / Create One ----------------- //
	@GetMapping("/languages")
	public String index(Model model, @ModelAttribute("language") Language language) {
		List<Language> languages = languageService.allLanguages();
		model.addAttribute("languages", languages);
		return "index.jsp";
	}

	// Submit new
	@PostMapping("/languages/submit")
	public String create(@Valid @ModelAttribute("language") Language language, BindingResult result, Model model) {
		if (result.hasErrors()) {
			List<Language> languages = languageService.allLanguages();
			model.addAttribute("languages", languages);
			return "index.jsp";
		} else {
			languageService.createLanguage(language);
			return "redirect:/languages";
		}
	}

	// ------------------ Retrieve One ----------------- //
	@GetMapping("/languages/{id}")
	public String show(Model model, @PathVariable("id") Long id) {
		Language language = languageService.findLanguage(id);
		model.addAttribute("language", language);
		return "show.jsp";
	}

	// ------------------- Update One ------------------ //
	// Create the edit.jsp file
	// Add error JSTL tag and hidden input with put value in edit file
	// Create update routes (the render and the submit)

	@GetMapping("/languages/{id}/edit")
	public String edit(@PathVariable("id") Long id, Model model) {
		Language language = languageService.findLanguage(id);
		model.addAttribute("language", language);
		return "edit.jsp";
	}

	// Submit updates
	@PutMapping("/languages/{id}")
	public String update(@PathVariable("id") Long id, @Valid @ModelAttribute("language") Language language,
			BindingResult result) {
		if (result.hasErrors()) {
			return "edit.jsp";
		} else {
			languageService.updateLanguage(language, id);
			return "redirect:/languages";
		}
	}

	// ------------------- Delete One ----------------- //
	@DeleteMapping("/languages/{id}")
	public String destroy(@PathVariable("id") Long id) {
		languageService.deleteLanguage(id);
		return "redirect:/languages";
	}
}
