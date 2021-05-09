package controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import beans.User;
import models.UserModel;
import utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;

@WebServlet(name = "AccountServlet", urlPatterns = "/Account/*")
public class AccountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/Register":
                ServletUtils.forward("/views/vwAccount/Register.jsp", request, response);
                break;
            case "/Login":
                request.setAttribute("hasError", false);
                ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
                break;
            case "/Profile":
                ServletUtils.forward("/views/vwAccount/Profile.jsp", request, response);
                break;
            case "/Edit":
                int id = Integer.parseInt(request.getParameter("id"));
                Optional<User> u = UserModel.findById(id);
                if (u.isPresent()) {
                    request.setAttribute("user", u.get());
                    ServletUtils.forward("/views/vwAccount/Edit.jsp", request, response);
                } else {
                    ServletUtils.redirect("/Account/Profile", request, response);
                }
                break;
            case "/ChangePassword":
                request.setAttribute("hasError", false);
                ServletUtils.forward("/views/vwAccount/ChangePassword.jsp", request, response);
                break;
            case "/IsAvailable":
                String username = request.getParameter("user");
                Optional<User> user = UserModel.findByUserName(username);
                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                out.print(!user.isPresent());
                out.flush();
                break;
            default:
                ServletUtils.redirect("/NotFound", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/Register":
                postRegister(request, response);
                break;
            case "/Login":
                postLogin(request, response);
                break;
            case "/Logout":
                postLogout(request, response);
                break;
            case "/Update":
                postUpdate(request, response);
            case "/ChangePassword":
                postChangePassword(request, response);
            default:
                ServletUtils.redirect("/NotFound", request, response);
                break;
        }
    }
    private void postRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String password = request.getParameter("password");
        String bcryptHashString = BCrypt.withDefaults().hashToString(12, password.toCharArray());

        Date dob = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        try {
            dob = formatter.parse(request.getParameter("dob"));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        int permission = 0;
        User user = new User(-1, username, bcryptHashString, name, email, dob, permission);
        UserModel.add(user);
        ServletUtils.redirect("/Account/Login", request, response);
    }
    private void postLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Optional<User> user = UserModel.findByUserName(username);
        if (user.isPresent()) {
            BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user.get().getPassword());
            if (result.verified) {

                HttpSession session = request.getSession();
                if(user.get().getPermission() != -1) {
                    session.setAttribute("auth", true);
                    session.setAttribute("authUser", user.get());
                    session.setAttribute("per", user.get().getPermission());

                    String url = (String) session.getAttribute("retUrl");
                    if (url == null) url = "/Home";
                    ServletUtils.redirect(url, request, response);
                }
                else
                {
                    request.setAttribute("hasError", true);
                    request.setAttribute("errorMessage", "Invalid password.");
                    ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
                }
            } else {
                request.setAttribute("hasError", true);
                request.setAttribute("errorMessage", "Invalid password.");
                ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
            }
        } else {
            request.setAttribute("hasError", true);
            request.setAttribute("errorMessage", "Invalid login.");
            ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
        }
    }

    private void postLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("auth", false);
        session.setAttribute("authUser", new User());
        session.setAttribute("per", 0);

        String url = request.getHeader("referer");
        if (url == null) url = "/Home";
        ServletUtils.redirect(url, request, response);
    }

    private void postUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("ID"));
        String username = request.getParameter("UserName");
        String password = request.getParameter("Password");
        String name = request.getParameter("Name");
        String email = request.getParameter("Email");
        Date dob = null;
        try {
            dob = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("DOB"));
        } catch (ParseException e) {
            e.printStackTrace();
            ServletUtils.redirect("/Account/Profile", request, response);
        }
        int permission = Integer.parseInt(request.getParameter("Permission"));
        User user = new User(id, username,password,name,email,dob,permission);
        UserModel.updateInfomation(user);
        ServletUtils.redirect("/Account/Profile", request, response);
    }
    private void postChangePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String newpassword = request.getParameter("newpassword");


        Optional<User> user = UserModel.findByUserName(username);
        if (user.isPresent()) {
            BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user.get().getPassword());
            if (result.verified ) {
                if(!password.equals(newpassword))
                {
                    int id = Integer.parseInt(request.getParameter("id"));
                    String name = request.getParameter("name");
                    String email = request.getParameter("email");
                    password = newpassword;
                    String bc = BCrypt.withDefaults().hashToString(12, password.toCharArray());
                    Date dob = new Date();
                    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
                    try {
                        dob = formatter.parse(request.getParameter("dob"));
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    int permission = Integer.parseInt(request.getParameter("permission"));
                    User newuser = new User(id, username, bc, name, email, dob, permission);
                    UserModel.updateInfomation(newuser);

                    HttpSession session = request.getSession();
                    String url = (String) session.getAttribute("retUrl");
                    if (url == null) url = "/Home";
                    ServletUtils.redirect(url, request, response);
                }
                else
                {
                    request.setAttribute("hasError", true);
                    request.setAttribute("errorMessage", "Invalid new password.");
                    ServletUtils.forward("/views/vwHome/Index.jsp", request, response);
                }
            } else {
                request.setAttribute("hasError", true);
                request.setAttribute("errorMessage", "Invalid current password.");
                ServletUtils.forward("/views/vwAccount/vwHome/Index.jsp", request, response);
            }
        } else {
            request.setAttribute("hasError", true);
            request.setAttribute("errorMessage", "Invalid login.");
            ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
        }
    }
}
