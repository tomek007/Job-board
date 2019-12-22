package pl.coderslab.app.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pl.coderslab.app.entity.User;
import pl.coderslab.app.service.UserService;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showLoginForm() {
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String verifyLogin(@RequestParam String email,
                              @RequestParam String password, HttpSession session, Model model) {

        User user = userService.loginUser(email, password);

        if (user == null) {
            //model.addAttribute("loginError", "Error logging in. Please try again");
            model.addAttribute("loginError", "Błąd podczas logowania. Proszę spróbuj ponownie.");
            return "login";
        }
        session.setAttribute("loggedInUser", user);
        return "redirect:/";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.removeAttribute("loggedInUser");
        return "login";
    }

}
