package term.project.homerental.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {


   @RequestMapping(value = "/login", method = RequestMethod.GET)
   public String login(ModelMap model) {

       Authentication auth= SecurityContextHolder.getContext().getAuthentication();
       String username=auth.getName();
       model.addAttribute("username",username);
      return "login";
   }
}
