<%-- 
    Document   : Register
    Created on : Oct 28, 2012, 3:15:54 PM
    Author     : Karl
--%>
<%@page import="javabean.TourProgramBean"%>
<%@page import="bo.TourProgramBO"%>
<%-- 
    Document   : index
    Created on : Oct 24, 2012, 2:18:16 PM
    Author     : Karl
--%>

<%@page import="javabean.TourBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.TourBO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javabean.UserBean"%>
<%
    UserBean user = (UserBean) session.getAttribute("userbean");
    if(user==null || !user.getRoleId().equals("1"))
    {
        response.sendRedirect("./AccessDenied.jsp");
    }
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Travel Booking - Danh sách tour</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css" media="screen" />

<script
   type='text/javascript' src="<%=request.getContextPath()%>/javascript/jquery.min.js"></script>
<script
   type='text/javascript' src="<%=request.getContextPath()%>/javascript/scrollto.js"></script>
<script
   type='text/javascript' src="<%=request.getContextPath()%>/javascript/quotable.js"></script>
<!--[if lte IE 6]><style>
.wp-pagenavi a, .wp-pagenavi span.pages, .wp-pagenavi span.current, .wp-pagenavi span.extend {padding: 2px 0; margin: 1px;}
</style><![endif]-->


<link href="<%=request.getContextPath()%>/css/quotable.css" type="text/css" rel="stylesheet" />
</head>

<body>

<!-- wrapper start -->
<div id="wrapper">

<!-- header start -->
	<div id="header">

            <h1 style="color:white">Travel Booking</h1>

<!-- navigation start -->
		<div id="navigation">
		    <ul>
				<li style="list-style: none;"><a href="../">Trang chủ</a></li>
                                
                                <% if(user!=null) {%>             
                                <li style="list-style: none;"><a href="ChangePassword.jsp">Đổi mật khẩu</a></li>
                                <li style="list-style: none;"><a href="../LogoutServlet" >Đăng xuất</a></li>
                                <% } else { %>
                                <li style="list-style: none;"><a href="Register.jsp">Đăng ký</a></li>
                                <li style="list-style: none;"><a href="Login.jsp">Đăng nhập</a></li>
                                <% } %>
			</ul>
		</div>
<!-- navigation end -->

		<div class="endline"></div>

    </div>
<!-- header end -->

<!-- container start -->
	<div id="container">

		<!-- sidebar start -->
		<div id="sidebar">
			<% if(user!=null && user.getRoleId().equals("1")) { %>
                        <%@include file="ControlPanel.jsp" %>
                        <% } else { %>
                        <div id="searchform">
                            <%@include file="Search.jsp" %> 
			</div>
                        <%@include file="Ads.jsp" %>
                        <% } %>
			<div id="sidebar-bottom"></div>
		</div>
<!-- sidebar end -->

<!-- content start -->
		<div id="content">
                    <% TourBO tourBO=new TourBO();
                        ArrayList<TourBean> listTour=tourBO.listAllTour(); %>
                        <div class="display-label">Danh sách tour</div>
                    <a href="CreateTour.jsp"> Tạo Tour mới </a>    
                    <table border="1px" width="600px" >
                        <tr>
                            <th>
                                Mã
                            </th>
                            <th>
                                Tên chương trình
                            </th>
                            <th>
                                Ngày khởi hành
                            </th>
                            <th>
                                Nơi khởi hành
                            </th>
                            <th>
                                Nơi đến
                            </th>
                            <th>
                                Giá (VNĐ)
                            </th>
                            <th>
                                Số chỗ còn nhận
                            </th>
                        </tr>

                    <% if(listTour!=null) {for (int i=0;i< listTour.size();i++) { 
                            TourBean tour=listTour.get(i);
                    %>
                        <tr>
                            <td>
                                <% out.print(tour.getTourId()); %>
                            </td>
                            <td>
                                <% out.print(tour.getTourProgram().getTourProgramName()); %>
                            </td>
                            <td>
                                <% out.print(tour.getStartdate()); %>
                            </td>
                            <td>
                                <% out.print(tour.getStartplace()); %>
                            </td>
                            <td>
                                <% out.print(tour.getEndplace()); %>
                            </td>
                            <td>
                                <% out.print(tour.getBasiccharge()); %>
                            </td>
                            <td>
                                <% out.print(tourBO.freeseats(tour.getTourId())); %>
                            </td>
                            <td>
                                <a href="<%="EditTour.jsp?id="+tour.getTourId()%>"> Chỉnh sửa </a> |
                                <!--<a href="<%//="DeleteTour.jsp?id="+tour.getTourId()%>"> Xóa </a> |-->
                                <a href="<%="TourDetail.jsp?id="+tour.getTourId()%>"> Chi tiết </a> |
                                <a href="<%="ListTravellersofTour.jsp?id="+tour.getTourId()%>"> Danh sách hành khách </a>
                            </td>
                        </tr>
                    <% } } %>

                    </table>

		</div>

<!-- content end -->

		<div class="endline"></div>

	</div>
<!-- container end -->

<!-- footer start -->
	<div id="footer">
                <p>&COPY; Bản quyên Website thuộc về Công ty TNHH du lịch web-dat-tour</p>
		<p>Modified from: <a href="http://themes.rock-kitty.net">Wordpress Themes</a> designed and coded by <a href="http://www.ezwpthemes.com/">EZwpthemes</a> | <a href="http://www.2cuk.co.uk">2cuk</a></p>
</div>
<!-- footer end -->

</div>
<!-- wrapper end -->

<!--<?php wp_footer(); ?>-->

</body>
</html>

