package controllers;

import beans.Post;
import beans.User;
import beans.Watchlist;
import models.PostModel;
import models.UserModel;
import utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet(name = "UserServlet", urlPatterns="/User/*")
@MultipartConfig(
        fileSizeThreshold = 50 * 1024 * 1024,
        maxFileSize = 100 * 1024 * 1024,
        maxRequestSize = 100 * 1024 * 1024
)
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("authUser");
        Date date = Calendar.getInstance().getTime();
        if(!user.getOffice().equals("user"))
        {

            ServletUtils.redirect("/Home",request,response);
            return;
        }
        switch(path){
            case"/Index":
                List<Post>posts = PostModel.getAll();
                List<Post> wl = UserModel.FindWatchListByUserID(user.getId());
                request.setAttribute("posts",posts);
                request.setAttribute("wl",wl);
                ServletUtils.forward("/views/vwUser/Index.jsp",request,response);
                break;
            case"/AddWatchList":
                int idPost = Integer.parseInt(request.getParameter("id"));
                Watchlist wladd = new Watchlist(-1,user.getId(),idPost,date);
                UserModel.add(wladd);
                ServletUtils.redirect("/Post/Detail?"+request.getQueryString(),request,response);
                break;
            case"/DeleteWatchList":
                int idCourseDelete = Integer.parseInt(request.getParameter("id"));
                Watchlist wldelete = new Watchlist(-1,user.getId(),idCourseDelete,date);

                UserModel.delete(wldelete);
                ServletUtils.redirect("/Post/Detail?"+request.getQueryString(),request,response);
                break;
            default:
                ServletUtils.forward("/NotFound",request,response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path){
            case "/UpdateEmail":
                doPostUpdateEmail(request,response);
                break;
            case "/UpdateName":
                doPostUpdateName(request,response);
                break;
            case "/UpdatePassword":
                doPostUpdatePassword(request,response);
                break;
            case "/UpdateDOB":
                doPostUpdateDOB(request,response);
                break;
            case "/AddPost":
                doPostAddPost(request,response);
                ServletUtils.redirect("/User/Index",request,response);
                break;
            case "/DeletePost":
                doPostDeletePost(request,response);
                ServletUtils.redirect("/User/Index",request,response);
                break;
            case "/UpdatePostname":
                doPostUpdatePostname(request,response);
                ComeBack(request,response);
                break;
            case "/UpdateTinyDes":
                doPostUpdateTinyDes(request,response);
                ComeBack(request,response);
                break;
            case "/UpdateFullDes":
                doPostUpdateFullDes(request,response);
                ComeBack(request,response);
                break;
            case "/UpdatePostCategory":
                doPostUpdatePostCategory(request,response);
                ComeBack(request,response);
                break;
            case "/UpdateImage":
                doPostUpdateImage(request,response);
                ComeBack(request,response);
                break;
            default:
                ServletUtils.redirect("/NotFound",request,response);
                break;
        }
    }

    private void ComeBack(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        String url = request.getHeader("referer");
        if(url == null) url="/Home/Index";
        ServletUtils.redirect(url,request,response);
    }
    private void updateAuthUser(HttpServletRequest request,HttpServletResponse response)
    {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("authUser");
        session.setAttribute("authUser", UserModel.findByID(user.getId()).get());
    }
    private  void  doPostUpdatePassword(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("authUser");
        int ID = user.getId();
        String password = request.getParameter("newPassword");
        UserModel.updatePassword(ID,password);
        updateAuthUser(request,response);
        ServletUtils.redirect("/User/Index",request,response);
    }
    private  void  doPostUpdateName(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("authUser");
        int ID = user.getId();
        String name = request.getParameter("newName");
        UserModel.updateName(ID,name);
        updateAuthUser(request,response);

        ServletUtils.redirect("/User/Index",request,response);
    }
    private  void  doPostUpdateEmail(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("authUser");
        int ID = user.getId();
        String email = request.getParameter("newEmail");
        UserModel.updateEmail(ID,email);
        updateAuthUser(request,response);
        ServletUtils.redirect("/User/Index",request,response);
    }
    private void doPostUpdateDOB(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("authUser");
        int ID = user.getId();

        Date dob = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        try {
            dob = formatter.parse(request.getParameter("newDOB"));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        UserModel.updateDOB(ID,dob);
        updateAuthUser(request,response);

        ServletUtils.redirect("/User/Index",request,response);
    }
    private void doPostAddPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User authUser = (User) session.getAttribute("authUser");
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaa");
        String postname = request.getParameter("postName");
        String tinydes = request.getParameter("tinyDes");
        String fulldes = request.getParameter("fullDes");
        int catid = Integer.parseInt(request.getParameter("catID"));
        int userid = authUser.getId();
        Date updateDate = Calendar.getInstance().getTime();
        PostModel.add(new Post(-1,userid,catid,postname,tinydes,fulldes,"true",updateDate));
        for (Part part : request.getParts()) {
            String contentDisp = part.getHeader("content-disposition");
            String[] items = contentDisp.split(";");
            for (String s : items) {
                String tmp = s.trim();
                if (tmp.startsWith("filename")) {
                    int idx = tmp.indexOf('.') + 1;
                    String filename = tmp.substring(idx, tmp.length() - 1);

                    String targetDir = this.getServletContext().getRealPath("public/image");
                    File dir = new File(targetDir);
                    if (!dir.exists()) {
                        dir.mkdir();
                    }
                    List<Map<String,Object>> list = PostModel.getMaxID();
                    String destination = targetDir + "/" + list.get(0).get("maxid") +"."+filename;

                    part.write(destination);
                }
            }
        }
    }
    private  void doPostDeletePost(HttpServletRequest request,HttpServletResponse response)
    {
        int id =Integer.parseInt(request.getParameter("postID"));
        PostModel.delete(id);
    }
    private void doPostUpdatePostname(HttpServletRequest request,HttpServletResponse response)
    {
        int id = Integer.parseInt(request.getParameter("postID"));
        String postname = request.getParameter("newPostName");
        Post post =PostModel.findByID(id).get();
        post.setUpdateDate(Calendar.getInstance().getTime());
        post.setPostname(postname);
        PostModel.Update(id,post);
    }
    private void doPostUpdateTinyDes(HttpServletRequest request,HttpServletResponse response)
    {
        int id = Integer.parseInt(request.getParameter("postID"));
        String tinydes = request.getParameter("newTinyDes");
        Post post =PostModel.findByID(id).get();
        post.setUpdateDate(Calendar.getInstance().getTime());
        post.setTinyDes(tinydes);
        PostModel.Update(id,post);
    }
    private void doPostUpdateFullDes(HttpServletRequest request,HttpServletResponse response)
    {
        int id = Integer.parseInt(request.getParameter("postID"));
        String fulldes = request.getParameter("newFullDes");
        Post post =PostModel.findByID(id).get();
        post.setUpdateDate(Calendar.getInstance().getTime());
        post.setTinyDes(fulldes);
        PostModel.Update(id,post);
    }
    private void doPostUpdatePostCategory(HttpServletRequest request,HttpServletResponse response)
    {
        int id = Integer.parseInt(request.getParameter("postID"));
        String newCatID = request.getParameter("newCatID");
        Post post =PostModel.findByID(id).get();
        post.setCatID(Integer.parseInt(newCatID));
        post.setUpdateDate(Calendar.getInstance().getTime());
        PostModel.Update(id,post);
    }
    private void doPostUpdateImage(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        String postID = request.getParameter("postID");
        Post post =PostModel.findByID(Integer.parseInt(postID)).get();
        post.setUpdateDate(Calendar.getInstance().getTime());
        PostModel.Update(Integer.parseInt(postID),post);
        for (Part part : request.getParts()) {
            String contentDisp = part.getHeader("content-disposition");
            String[] items = contentDisp.split(";");
            for (String s : items) {
                String tmp = s.trim();
                if (tmp.startsWith("filename")) {
                    int idx = tmp.indexOf('.') + 1;
                    String filename = tmp.substring(idx, tmp.length() - 1);

                    String targetDir = this.getServletContext().getRealPath("public/image");
                    File dir = new File(targetDir);
                    if (!dir.exists()) {
                        dir.mkdir();
                    }
                    List<Map<String,Object>> list = PostModel.getMaxID();
                    String destination = targetDir + "/" + postID +"."+filename;

                    part.write(destination);
                }
            }
        }
    }
}
