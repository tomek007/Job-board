package pl.coderslab.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.app.dao.CategoryDao;
import pl.coderslab.app.dao.PostDao;
import pl.coderslab.app.dao.ProvinceDao;
import pl.coderslab.app.entity.Category;
import pl.coderslab.app.entity.Post;
import pl.coderslab.app.entity.Province;
import pl.coderslab.app.entity.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Controller
public class PostController {

    @Autowired
    private PostDao postDao;
    private ProvinceDao provinceDao;
    private CategoryDao categoryDao;

    public PostController(PostDao postDao, ProvinceDao provinceDao, CategoryDao categoryDao) {
        this.postDao = postDao;
        this.provinceDao = provinceDao;
        this.categoryDao = categoryDao;
    }

    @ModelAttribute("provinces")
    public List<Province> provincesList() {
        List<Province> provinces = provinceDao.getAll();
        return provinces;
    }

    @ModelAttribute("categories")
    public List<Category> categoriesList() {
        List<Category> categories = categoryDao.getAll();
        return categories;
    }

    @RequestMapping(value = "/post/add", method = RequestMethod.GET)
    public String addPost(Model model, HttpSession session) {

        if(session.getAttribute("loggedInUser") == null ) {
            return "redirect:/";
        }

        Post post = new Post();
        model.addAttribute("post", post);
        return "post/add";
    }

    @RequestMapping(value = "/post/add", method = RequestMethod.POST)
    public String addPost(@ModelAttribute("post") @Valid Post post, BindingResult result) {

        if( result.hasErrors() ) {
            return "post/add";
        }

        postDao.save(post);
        return "post/add";
    }

    @RequestMapping(path = "/post/show-all")
    public String allPosts(Model model){
        model.addAttribute("posts", postDao.getAll());
        return "post/show-all";
    }

    @RequestMapping(path = "post/search")
    public String searchAction(Model model, @RequestParam String post_search){
        List<Post> posts = postDao.search(post_search);
        model.addAttribute("posts", posts);
        model.addAttribute("post_search", post_search);
        return "post/search-results";
    }

    @RequestMapping(path = "post/{id}")
    public String get(Model model, @PathVariable("id") int id){
        Post post = postDao.get(id);
        model.addAttribute("post", post);
        return "post/show";
    }

}