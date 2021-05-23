package controllers;

import beans.User;
import models.PostModel;
import utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "PostServlet", urlPatterns = "/Post/*")
public class PostServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path){
            case "/Detail":
                HttpSession session = request.getSession();
                User user = (User) session.getAttribute("authUser");
                int postID = Integer.parseInt(request.getParameter("id"));
                List<Map<String,Object>> list = PostModel.GetByID(postID);
                request.setAttribute("isWatchList",PostModel.IsOnWatchList(user.getId(),(Integer) list.get(0).get("id")));
                request.setAttribute("posts",list);
                ServletUtils.forward("/views/vwPost/Detail.jsp", request, response);
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
