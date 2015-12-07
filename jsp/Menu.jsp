<%@ page import="java.util.*" %>

<jsp:useBean id="dbBean" scope="application" class="com.mystore.DbBean" />

<% String base = (String) application.getAttribute("base"); %>

<table cellspacing="0" cellpadding="5" width="150" border="0">

    <tr>
        <td bgcolor="f6f6f6">

            Search

            <form>
                <input type="hidden" name="action" value="search" />
                <input type="text" name="keyword" size="10" />
                <input type="submit" value="Go" />
            </form>

        </td>
    </tr>

    <tr>
        <td bgcolor="f6f6f6">Categories:</td>
    </tr>

    <tr valign="top">
        <td bgcolor="f6f6f6">
            <%
                Hashtable categories = dbBean.getCategories();

                Enumeration categoryIds = categories.keys();

                while (categoryIds.hasMoreElements()) {

                    Object categoryId = categoryIds.nextElement();

                    out.println("<a href=" + base + "?action=browseCatalog&categoryId=" + categoryId.toString() + ">" + categories.get(categoryId) + "</a><br>");

                }
            %>
        </td>
    </tr>

</table>