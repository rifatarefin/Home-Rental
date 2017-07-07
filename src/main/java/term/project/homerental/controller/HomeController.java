package term.project.homerental.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class HomeController {

	@RequestMapping
	public String welcome(Model model) {

		Authentication auth= SecurityContextHolder.getContext().getAuthentication();
		String username=auth.getName();
		model.addAttribute("username",username);

		model.addAttribute("greeting", "Welcome!");
		model.addAttribute("tagline", "Choose Your Apartment");

		return "welcome";
	}
}
