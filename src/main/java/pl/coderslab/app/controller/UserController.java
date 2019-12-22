package pl.coderslab.app.controller;

import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import pl.coderslab.app.entity.User;
import pl.coderslab.app.service.UserService;

@Controller
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping("/register")
    public String createForm(Model model) {
        model.addAttribute("css_class", "register_page");
        model.addAttribute("user", new User());
        return "register";
    }

    @RequestMapping(value = "register", method = RequestMethod.POST)
    public String saveUser(User user) {
        userService.saveUser(user);
        return "redirect:/register";
    }

}

