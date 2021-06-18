package controllers;

import beans.Category;
import beans.Post;
import beans.User;
import models.CategoryModel;
import models.PostModel;
import models.UserModel;
import org.sql2o.Connection;
import utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminServlet", urlPatterns = "/Admin/*")
public class AdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("authUser");
        if(!user.getOffice().equals("admin"))
        {
            ServletUtils.redirect("/Home",request,response);
            return;
        }
        switch (path)
        {
            case "/Index":
//                List<Post> list = PostModel.getAll();
                String username = "";
                int catid = 0;
                if(request.getParameter("categorySearch")!=null)
                {
                    catid =Integer.parseInt(request.getParameter("categorySearch"));
                }
                if(request.getParameter("userSearch")!=null)
                {
                    username = request.getParameter("userSearch");
                }
                List<Post> list ;
                if(catid !=0 && CategoryModel.findByID(catid).get().getParentCat() == 0)
                {
                    list = PostModel.SearchByUserAndCat(username,catid);
                }
                else {
                    list = PostModel.SearchByUserAndSubCat(username,catid);
                }
                request.setAttribute("posts",list);
                List<User> users = UserModel.getAllUsersByOffice("user");
                request.setAttribute("users",users);
                ServletUtils.forward("/views/vwAdmin/Index.jsp",request,response);
                break;
            default:
                ServletUtils.redirect("/NotFond",request,response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String path = request.getPathInfo();
        switch (path) {
            case "/AddCategory":
                doPostAddCat(request, response);
                break;
            case "/DeleteCategory":
                doPostDeleteCat(request, response);
                break;
            case "/UpdateNameCategory":
                doPostUpdateNameCategory(request, response);
                break;
            case "/DeletePost":
                doPostDeletePost(request,response);
                break;
            case "/UpdateEnablePost":
                doPostEnablePost(request,response);
                break;
            case "/UpdateDisablePost":
                doPostDisablePost(request,response);
                break;
            case"/DeleteUser":
                doPostDeleteUser(request,response);
                break;
            case "/UpdateEnableUser":
                doPostEnableUser(request,response);
                break;
            case "/UpdateDisableUser":
                doPostDisableUser(request,response);
                break;
            default:
                ServletUtils.redirect("/NotFound",request,response);
                break;
        }
    }
    private void goBack(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        String url = request.getHeader("referer");
        if(url == null) url="/Admin/Index";
        ServletUtils.redirect(url,request,response);
    }
    private void doPostAddCat(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("catName");
        int id = Integer.parseInt( request.getParameter("catOrParentID"));

        CategoryModel.add(new Category(-1,id,name));
        ServletUtils.redirect("/Admin/Index",request,response);
    }
    private void doPostDeleteCat(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("deleteCatID"));
        CategoryModel.delete(id);
        ServletUtils.redirect("/Admin/Index",request,response);
    }
    private void doPostUpdateNameCategory(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("catName");
        int id = Integer.parseInt( request.getParameter("catOrParentID"));
        CategoryModel.updateName(id,name);
        ServletUtils.redirect("/Admin/Index",request,response);
    }
    private void doPostDeletePost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("postDeleteID"));
        PostModel.delete(id);
        ServletUtils.redirect("/Admin/Index",request,response);
    }
    private void doPostEnablePost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("postID"));
        Post post= PostModel.findByID(id).get();
        post.setEnable("true");
        PostModel.Update(id,post);
        goBack(request,response);
    }
    private void doPostDisablePost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("postID"));
        Post post= PostModel.findByID(id).get();
        post.setEnable("false");
        PostModel.Update(id,post);
        goBack(request,response);
    }
    private void doPostDeleteUser(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("userDeleteID"));
        UserModel.delete(id);
        ServletUtils.redirect("/Admin/Index",request,response);
    }
    private void doPostEnableUser(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        int id =Integer.parseInt( request.getParameter("userID"));
        UserModel.Enable(id);
        goBack(request,response);
    }
    private void doPostDisableUser(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        int id =Integer.parseInt( request.getParameter("userID"));
        UserModel.Disabled(id);
        goBack(request,response);
    }
}
