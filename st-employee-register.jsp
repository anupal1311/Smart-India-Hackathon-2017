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
        Employee Register
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Employee Register for <%= plantName%> Plant</h3>

            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover">
                <tr>
                  <th>ID</th>
                  <th>Name</th>
                  <th>Department</th>
                  <th>Designation</th>
                  <th>Phone No.</th>
                  <th>Status</th>
                </tr>
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

<script>
    $(document).ready(function(){
            var plantName = "<%= plantName%>";

            //console.log(empId);
            var apiEndPoint;
            
            switch(plantName) {
                case "BHILAI":
                    apiEndPoint = "http://172.16.25.179:3012/BHILAI";
                    break;
                case "BOKARO":
                    apiEndPoint = "http://172.16.25.179:3012/BOKARO";
                    break;
                case "BURNPUR":
                    apiEndPoint = "http://172.16.25.179:3012/BURNPUR";
                    break;
                case "ROURKELA":
                    apiEndPoint = "http://172.16.25.179:3012/ROURKELA";
                    break;
            }
            
            var request = $.ajax({
              url: apiEndPoint,
              method: "GET",
              data: {}
            });

            request.done(function( data ) {
              console.log( data );
              
              if(data.length > 0) {
                  
                var markup;
                
                jQuery.each( data, function( i, val ) {
                    if(data[i].status == "active") {
                      markup += "<tr><td>" + data[i].id + "</td><td>" + data[i].name + "</td><td>" + data[i].department + "</td><td>" + data[i].designation + "</td><td>" + data[i].contact + "</td><td><span class='label label-success'>" + data[i].status + "</span></td></tr>";
                    }
                    else {
                      markup += "<tr><td>" + data[i].id + "</td><td>" + data[i].name + "</td><td>" + data[i].department + "</td><td>" + data[i].designation + "</td><td>" + data[i].contact + "</td><td><span class='label label-danger'>" + data[i].status + "</span></td></tr>";
                    }
                });

                $("table tbody").append(markup);        
                
                  /*
                  $('#error-message').css({'display': 'none'});
                  $('#transferee-info').css({'display': 'inherit'});

                  //$('#st-transferee-id').val(data[0].id);
                  $('#st-transferee-name').val(data[0].name);
                  $('#st-transferee-father-name').val(data[0].father_name);
                  $('#st-transferee-designation').val(data[0].designation);
                  $('#st-transferee-phone-number').val(data[0].contact);
                  $('#st-transferee-email-id').val(data[0].email);
                  $('#st-transferee-department').val(data[0].department);
                  $('#st-transferee-salary').val(data[0].last_drawn_salary);
                  $('#st-transferee-action').val(data[0].disciplinary_actions);
                  $('#st-transferee-cl').val(data[0].leave_casual);
                  $('#st-transferee-ml').val(data[0].leave_medical);
                  $('#st-transferee-el').val(data[0].leave_earned);*/
              
                  //window.location.href = "/SAIL-Transfers/st-dashboard.jsp?p=" + plantName + "&e=" + empId + "&n=" + data[0].name;
              }
              else {
                  //$('#error-message').css({'display': 'block'});
                  //$('#transferee-info').css({'display': 'none'});
              }
            });

            request.fail(function( jqXHR, textStatus ) {
              console.log( "GET Request failed at Employee Register: " + textStatus );
            });

    });
</script>

</body>
</html>
