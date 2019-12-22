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
public class AdminController {

    @Autowired
    private PostDao postDao;
    private ProvinceDao provinceDao;
    private CategoryDao categoryDao;

    public AdminController(PostDao postDao, ProvinceDao provinceDao, CategoryDao categoryDao) {
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

    @RequestMapping(path = "/admin/show-all")
    public String allPosts(Model model, HttpSession session){

        if(session.getAttribute("loggedInUser") == null ) {
            return "redirect:/";
        }

        User user = (User) session.getAttribute("loggedInUser");

        model.addAttribute("posts", postDao.getAllByID(user.getId()));
        return "admin/show-all";
    }

    @RequestMapping("/admin/delete/{id}")
    public String deletePost(@PathVariable("id") int id, Model model) {
        Post post = postDao.get(id);
        postDao.delete(post);
        return "redirect:/admin/show-all";
    }

    @RequestMapping("/admin/edit/{id}")
    public String editBook(@PathVariable int id, Model model) {
        Post post = postDao.get(id);
        model.addAttribute("post", post);
        return "admin/edit";
    }

    @RequestMapping(value = "/admin/edit/{id}", method = RequestMethod.POST)
    public String editBook(@PathVariable int id, @ModelAttribute Post post) {
        Post currentPost = postDao.get(id);
        LocalDateTime created = currentPost.getCreateDateTime();
        post.setCreateDateTime(created);

        post.setId(id);

        postDao.update(post);
        return "redirect:/post/" + id;
    }

}
