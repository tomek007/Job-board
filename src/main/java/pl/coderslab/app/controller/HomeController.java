package pl.coderslab.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import pl.coderslab.app.dao.PostDao;
import pl.coderslab.app.entity.Post;
import pl.coderslab.app.entity.User;
import pl.coderslab.app.repository.UserRepository;
import pl.coderslab.app.service.UserService;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PostDao postDao;

    @RequestMapping("/")
    public String indexAction(Model model) {
        model.addAttribute("css_class", "home_page");

        List<Post> latests_posts = postDao.getLatestsPosts(9);
        model.addAttribute("latests_posts", latests_posts);

        return "index";
    }

    @GetMapping("/about")
    @ResponseBody
    public String aboutAction(Model model) {
        model.addAttribute("css_class", "about_page");
        return "Here you can find some details for logged users";
    }

}
