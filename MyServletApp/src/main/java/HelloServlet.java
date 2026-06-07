import java.io.*;
import jakarta.servlet.*;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;


//@WebServlet("/Hello2")
public class HelloServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	RequestDispatcher rd = request.getRequestDispatcher("index.html");
        rd.forward(request, response);

//        response.setContentType("text/html");
//        PrintWriter out = response.getWriter();
//        out.println("<h1>Hello, World! this is my servlets program ...</h1>");
    }
}