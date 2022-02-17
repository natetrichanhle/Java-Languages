package com.nate.languages.services;

import java.util.List;
import java.util.Optional;

import com.nate.languages.models.Language;
import com.nate.languages.repos.LanguageRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LanguageService {

	@Autowired
	LanguageRepository languageRepository;

	// returns all the languages
	public List<Language> allLanguages() {
		return languageRepository.findAll();
	}

	// creates a language
	public Language createLanguage(Language b) {
		return languageRepository.save(b);
	}

	// retrieves a language
	public Language findLanguage(Long id) {
		Optional<Language> optionalLanguage = languageRepository.findById(id);
		if (optionalLanguage.isPresent()) {
			return optionalLanguage.get();
		} else {
			return null;
		}
	}

	public Language updateLanguage(Language language, Long id) {
		Optional<Language> optionalLanguage = languageRepository.findById(id);
		if(optionalLanguage.isPresent()) {
			return languageRepository.save(language);
		} else {
			return null;
		}
	}

	public void deleteLanguage(Long id) {
		Optional<Language> optionalLanguage = languageRepository.findById(id);
		if(optionalLanguage.isPresent()) {
			languageRepository.deleteById(id);			
		}
	}
}
