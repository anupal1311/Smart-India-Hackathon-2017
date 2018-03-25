<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>SAIL Transfers</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="http://localhost:8080/SAIL-Transfers/bootstrap/css/bootstrap.min.css ">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="http://localhost:8080/SAIL-Transfers/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="http://localhost:8080/SAIL-Transfers/dist/css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<%@page import="java.sql.*"%>
<%
    Connection con=null;
      try
        {
            Class.forName("com.mysql.jdbc.Driver");
           con= DriverManager.getConnection("jdbc:mysql://localhost:3306/sail","root","project");
      
           
        }
        catch(Exception ex)
        {
            out.print(ex.toString());
        }
    %>

<%
    if(request.getParameter("n") != null) {
        session.setAttribute("empName", request.getParameter("n"));
    }
    if(request.getParameter("e") != null) {
        session.setAttribute("empID", request.getParameter("e"));
    }
    if(request.getParameter("p") != null) {
        session.setAttribute("plantName", request.getParameter("p"));
    }
    
    String userName = (String)session.getAttribute("empName");
    String plantName = (String)session.getAttribute("plantName");
    
    String empId = (String)request.getParameter("st-transferee-id");
   
%>
<%!

 Statement ps=null;
 ResultSet rs=null;

 %>
 
<%

     ps=con.createStatement();
     String id=empId;
     String sql="select * from  transfers , status where transfers.Case_Id = status.Case_Id and transfers.Emp_Id='"+id+"' order by status.Last_Modified desc";
     rs = ps.executeQuery(sql);
 %>
 

<body class="hold-transition skin-blue sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <%@include file="st-logo.jsp" %>    
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">

          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="http://localhost:8080/SAIL-Transfers/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs"><%= userName%></span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="http://localhost:8080/SAIL-Transfers/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                <p>
                  <%= userName%>
                </p>
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <!-- <a href="#" class="btn btn-default btn-flat">Profile</a> -->
                </div>
                <div class="pull-right">
                  <a href="st-logout.jsp" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>
  </header>

  <!-- =============================================== -->

  <%@include file="st-sidebar.jsp" %>

  <!-- =============================================== -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Employee Transfer History
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <!-- left column -->
        <div class="col-md-12">
         <!-- Horizontal Form -->
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Search Employee from <%= plantName%> Plant</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form class="form-horizontal" action="st-transfer-history-report.jsp" method="post">
              <div class="box-body">
                <!-- text input -->
                <div class="form-group">
                  <label for="st-transferee-id" class="col-sm-2 control-label">Employee ID</label>

                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="st-transferee-id" name="st-transferee-id" required placeholder="Employee ID">
                  </div>
                </div>
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                <button type="reset" class="btn btn-default">Cancel</button>
                <button type="submit" id="st-transferee-search-form-submit-button" class="btn btn-info pull-right">Search Employee</button>
              </div>
              <!-- /.box-footer -->
            </form>
          </div>
          <!-- /.box -->           
        </div>
        <!-- right column
        <div class="col-md-6">
            
        </div> -->
      </div>

      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Transfer History of Employee <%= empId%></h3>

            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover">
                <tr>
                  <th>Transferred From</th>
                  <th>Transferred To</th>
                  <th>Transferred On</th>
                  <th>Transferred By</th>
                  <th>Status</th>
                  <th>Reason</th>
                </tr>
                <%
            while(rs.next())
             {
                 out.println("<tr>");
                 out.println("<td>" + rs.getString("Src_Location") + "</td>");
                 out.println("<td>" + rs.getString("Dest_Location") + "</td>");
                 out.println("<td>" + rs.getString("Last_Modified") + "</td>");
                 out.println("<td>" + rs.getString("Modified_By") + "</td>");
                 out.println("<td><span class='label label-success'>" + rs.getString("Status") + "</span></td>");
                 out.println("<td>" + rs.getString("Reason") + "</td>");
                 out.println("</tr>");
             }
            %>
                
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
      </div>
            
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 0.0.1
    </div>
    <strong>Copyright &copy; 2017 <a href="#">UIET_PU_CODEINE1</a>.</strong> All rights
    reserved.
  </footer>

</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="http://localhost:8080/SAIL-Transfers/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="http://localhost:8080/SAIL-Transfers/bootstrap/js/bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="http://localhost:8080/SAIL-Transfers/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="http://localhost:8080/SAIL-Transfers/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="http://localhost:8080/SAIL-Transfers/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="http://localhost:8080/SAIL-Transfers/dist/js/demo.js"></script>
</body>
</html>
