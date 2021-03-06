package filters;

import utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "AuthenticationFilter")
public class AuthenticationFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpSession session = request.getSession();
        boolean auth = (boolean) session.getAttribute("auth");
        if (auth == false) {
            session.setAttribute("retUrl", request.getRequestURI() + "?" + request.getQueryString());
            ServletUtils.redirect("/Account/Login", request, (HttpServletResponse) resp);
            return;
        }
        chain.doFilter(req, resp);
    }
}
