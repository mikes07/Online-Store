/**
 * Created by michael on 09.09.2015.
 */

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.mystore.DbBean;

public class ControllerServlet extends HttpServlet {

    public void init(ServletConfig config) throws ServletException {

        System.out.println("initializing conroller servlet");

        ServletContext context = config.getServletContext();

        context.setAttribute("base", config.getInitParameter("base"));
        context.setAttribute("imageUrl", config.getInitParameter("imageUrl"));

        DbBean dbBean = new DbBean();

        dbBean.setDbUrl(config.getInitParameter("dbUrl"));
        dbBean.setDbUserName(config.getInitParameter("dbUserName"));
        dbBean.setDbPassword(config.getInitParameter("dbPassword"));

        context.setAttribute("dbBean", dbBean);

        try {
            Class.forName(config.getInitParameter("jdbcDriver"));
        } catch (ClassNotFoundException e) {
            System.out.println(e.toString());
        }

        super.init(config);

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String base = "/jsp/";
        String url = base + "Default.jsp";
        String action = request.getParameter("action");

        if (action != null) {

            if (action.equals("search")) url = base + "SearchResults.jsp";
            else if (action.equals("browseCatalog")) url = base + "BrowseCatalog.jsp";
            else if (action.equals("productDetails")) url = base + "ProductDetails.jsp";
            else if (action.equals("addShoppingItem") || action.equals("updateShoppingItem") || action.equals("deleteShoppingItem") || action.equals("displayShoppingCart")) url = base + "ShoppingCart.jsp";
            else if (action.equals("checkOut")) url = base + "CheckOut.jsp";
            else if (action.equals("order")) url = base + "Order.jsp";

        }

        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher(url);
        requestDispatcher.forward(request, response);

    }

}
