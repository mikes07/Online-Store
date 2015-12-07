<%
    String base = (String) application.getAttribute("base");
    String imageUrl = (String) application.getAttribute("imageUrl");
%>

<table width="740" cellpadding="0" height="75" cellspacing="0" border="0">

    <tr>

        <td align="left" bgcolor="f6f6f6">
            Store e-Mail
        </td>

        <td align="right" bgcolor="f6f6f6">
            <a href="<%= base %>?action=displayShoppingCart">
                <img border="0" src="<%= (imageUrl + "cart.gif") %>" />
            </a>
        </td>

    </tr>

</table>