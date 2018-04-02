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
    
    String sourcePlantName = (String)session.getAttribute("plantName");
    String targetPlantName = (String)request.getParameter("st-target-plant-id");
    String transferReason = (String)request.getParameter("st-transfer-reason");       
    String transferStatus = (String)request.getParameter("st-transfer-status");  
    String managerId = (String)session.getAttribute("empID");
    String transfereeId = (String)request.getParameter("st-transferee-id");
    
%>


       <%!

        Statement ps=null;
        ResultSet rs=null;

        %>


<%
  
   String Id=transfereeId;
   String Src=sourcePlantName;
   String Dest=targetPlantName;
   String Reason=transferReason;
   String Mgr_Id=managerId;
   String Status=transferStatus;
   
 ps=con.createStatement();
 
     
 String sql1="insert into transfers(Emp_Id,Src_Location,Dest_Location,Reason)"
            + "values('"+Id+"','"+Src+"','"+Dest+"','"+Reason+"')";
  ps.executeUpdate(sql1);
String sql2="select Case_Id from transfers where Emp_Id ='"+Id+"' order by Case_Id desc limit 1";
rs = ps.executeQuery(sql2);
        if(rs.next())
        {
            int C_Id=rs.getInt("Case_Id");
            
            String sql4="insert into status(Case_Id,Status,Last_Modified,Modified_By)"
            + "values('"+C_Id+"','"+Status+"',NOW(),'"+Mgr_Id+"')";
            ps.executeUpdate(sql4);
            
        }
 


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
        Employee Transfer
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">

        <h3>Employee HR Record transferred successfully.</h3>
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

<script>
    $(document).ready(function(){
            var sourcePlantName = "<%= sourcePlantName%>";
            var targetPlantName = "<%= targetPlantName%>";
            var employeeStatus = "<%= transferStatus%>";
            var employeeId = "<%= transfereeId%>";
            
            console.log(sourcePlantName);
            console.log(targetPlantName);
            console.log(employeeStatus);
            console.log(employeeId);

            /*****************************************************
             * Update employee record at Source Plant to show him
             * Transferred.
            *****************************************************/
            var apiEndPoint;
            
            switch(sourcePlantName) {
                case "BHILAI":
                    apiEndPoint = "http://172.16.25.179:3012/BHILAI/" + employeeId;
                    break;
                case "BOKARO":
                    apiEndPoint = "http://172.16.25.179:3012/BOKARO/" + employeeId;
                    break;
                case "BURNPUR":
                    apiEndPoint = "http://172.16.25.179:3012/BURNPUR/" + employeeId;
                    break;
                case "ROURKELA":
                    apiEndPoint = "http://172.16.25.179:3012/ROURKELA/" + employeeId;
                    break;
            }
            console.log(apiEndPoint);
            console.log(employeeStatus);
            
            var request = $.ajax({
              url: apiEndPoint,
              method: "PATCH",
              data: { status : employeeStatus }
            });

            request.done(function( sourceData ) {
                /*****************************************************
                 * Update employee record at Target Plant to show him
                 * as new entry.
                *****************************************************/
                console.log( sourceData );

                var apiEndPoint1;

                switch(targetPlantName) {
                    case "BHILAI":
                        apiEndPoint1 = "http://172.16.25.179:3012/BHILAI";
                        break;
                    case "BOKARO":
                        apiEndPoint1 = "http://172.16.25.179:3012/BOKARO";
                        break;
                    case "BURNPUR":
                        apiEndPoint1 = "http://172.16.25.179:3012/BURNPUR";
                        break;
                    case "ROURKELA":
                        apiEndPoint1 = "http://172.16.25.179:3012/ROURKELA";
                        break;
                }
                
                sourceData.status = "active";
                
                var request1 = $.ajax({
                  url: apiEndPoint1,
                  method: "POST",
                  data: sourceData
                });

                request1.done(function( targetData ) {
                  console.log( targetData );
                });

                request1.fail(function( jqXHR, textStatus ) {
                  console.log( "Post Request failed at Employee Transfer: " + textStatus );
                  console.log( "Now Patching..." );
                    var request2 = $.ajax({
                      url: apiEndPoint1 + "/" + sourceData.id,
                      method: "PATCH",
                      data: sourceData
                    });

                    request2.done(function( targetData ) {
                      console.log( targetData );
                    });

                    request2.fail(function( jqXHR, textStatus ) {
                      console.log( "Second PATCH Request failed at Employee Transfer: " + textStatus );
                    });
                });
        
            });

            request.fail(function( jqXHR, textStatus ) {
              console.log( "Patch Request failed at Employee Transfer: " + textStatus );
            });


});
</script>

</body>
</html>
