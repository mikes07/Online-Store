<%@ page import="com.mystore.Product" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="dbBean" scope="application" class="com.mystore.DbBean" />

<% String base = (String) application.getAttribute("base"); %>

<html>

<head>
    <title>Browse Catalog</title>
</head>

<body>

<table>

    <tr>
        <td colspan="2">
            <jsp:include page="Header.jsp" flush="true" />
        </td>
    </tr>

    <tr>

        <td>
            <jsp:include page="Menu.jsp" flush="true" />
        </td>

        <td valign="top">

            <%
                String categoryId = request.getParameter("categoryId");

                if (categoryId != null && !categoryId.trim().equals("")) {
            %>

            <table>

                <tr>
                    <td><b>Name</b></td>
                    <td><b>Description</b></td>
                    <td><b>Price</b></td>
                    <td><b>Details</b></td>
                </tr>

                <%

                    ArrayList products = dbBean.getProductsInCategory(categoryId);

                    Iterator iterator = products.iterator();

                    while (iterator.hasNext()) {
                        Product product = (Product) iterator.next();

                %>

                <tr>
                    <td><%= product.name %></td>
                    <td><%= product.description %></td>
                    <td><%= product.price %></td>
                    <td><a href="<%= base %>?action=productDetails&productId=<%= product.id %>">Details</a></td>
                </tr>

                <%

                        }
                    }
                    else out.println("Invalid category.");

                %>

            </table>

        </td>

    </tr>

</table>

</body>

</html>