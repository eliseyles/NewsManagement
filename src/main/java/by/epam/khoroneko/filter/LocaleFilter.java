package by.epam.khoroneko.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Locale;

@WebFilter(filterName = "LocaleFilter", urlPatterns = {"/*"}, dispatcherTypes = {DispatcherType.REQUEST})
public class LocaleFilter extends HttpFilter {
    private static final String ENGLISH = "en";
    private static final String ENCODING = "UTF-8";


    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        request.setCharacterEncoding(ENCODING);
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession(true);
        if (session.getAttribute("language") == null) {
            session.setAttribute("language", ENGLISH);
        }
        String language = req.getParameter("language");
        if (language != null) {
            session.setAttribute("language", new Locale(language));
            resp.sendRedirect(req.getRequestURL().toString());
            return;
        }
        chain.doFilter(request, response);
    }
}
