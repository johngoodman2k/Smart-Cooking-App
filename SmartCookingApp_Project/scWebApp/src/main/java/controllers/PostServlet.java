package controllers;

import beans.Post;
import beans.User;
import models.CategoryModel;
import models.PostModel;
import models.UserModel;
import utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@WebServlet(name = "PostServlet", urlPatterns = "/Post/*")
public class PostServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String path = request.getPathInfo();
        switch (path){
            case "/ByCat":
                int catID = Integer.parseInt(request.getParameter("id"));
                List<Post> list = PostModel.findByCatID(catID);
                request.setAttribute("posts",list);
                ServletUtils.forward("/views/vwPost/ByCat.jsp",request,response);
                break;
            case "/Search":
                String postname = "";

                if(request.getParameter("search")!=null)
                {
                    postname = request.getParameter("search");
                }
                List<Post> listPost ;
                listPost = PostModel.SearchPost(postname);

                request.setAttribute("posts",listPost);
                ServletUtils.forward("/views/vwPost/Search.jsp",request,response);

                break;
            case "/Detail":
                HttpSession session = request.getSession();
                User user = (User) session.getAttribute("authUser");
                int postID = Integer.parseInt(request.getParameter("id"));

                Optional<Post> c = PostModel.findByID(postID);
                if (c.isPresent()) {
                    request.setAttribute("posts", c.get());
                    Optional<User> u = UserModel.findByID(c.get().getUserID());
                    request.setAttribute("isWatchList",PostModel.IsOnWatchList(user.getId(), c.get().getId()));
                    request.setAttribute("users",u.get());
                    ServletUtils.forward("/views/vwPost/Detail.jsp", request, response);
                } else {
                    ServletUtils.redirect("/Home", request, response);
                }
            break;
            default:
                ServletUtils.redirect("/NotFound", request, response);
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
