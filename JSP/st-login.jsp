
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>login</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/iCheck/square/blue.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  </head>

				
<body  background="sail.jpg" style="background-repeat-x:no-repeat; background-size:cover;" >
<div>
<img src="SAIL.png" align="left" class="img-responsive" height="100" width="100" style="position:absolute;top:0px;"  />

<img src="Emblem.png" align="right" class="img-responsive" height="60" width="60" style="position:absolute;top:0px; right:0"/>
</div>
<div class="login-box" style="position:relative;top:100px;left:40px; width:470px">
  
  <!-- /.login-logo -->
  <div class="login-box-body" >
  <div class="login-logo">
    <b>Welcome to SAIL India</b>
  </div>
    <div id="error-message" style="display: none;" class="alert alert-danger alert-dismissible">
     <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
     <h4><i class="icon fa fa-ban"></i> Oops!!!</h4>
     Incorrect Userid or Password. Please try again.
    </div>    
   
    <form id="st-login-form" action="st-dashboard.jsp" method="post">
      <div class="form-group has-feedback">
        <input required id="st-emp-id" name="st-emp-id" type="text" class="form-control" placeholder="Sail ID">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input required id="st-emp-pwd" name="st-emp-pwd" type="password" class="form-control" placeholder="Password">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
    <div class="form-group">
      <label>SAIL Plant</label>
      <select required id="st-plant-id" name="st-plant-id" class="form-control">
        <option value="BHILAI">Bhilai</option>
        <option value="BOKARO">Bokaro</option>
        <option value="BURNPUR">Burnpur</option>
        <option value="ROURKELA">Rourkela</option>
      </select>
    </div>
      <div class="row">
        <div class="col-xs-8">

        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button id="st-login-form-submit-button" type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

    
    

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="plugins/iCheck/icheck.min.js"></script>
<script>
    $(document).ready(function(){

        $("#st-login-form-submit-button").click(function(e) {
            e.preventDefault();

            var plantName = $("#st-plant-id").val();
            var empId = $("#st-emp-id").val();
            var password = $("#st-emp-pwd").val();
            //console.log(plantName);
            

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
              data: { id : empId, password : password }
            });

            request.done(function( data ) {
              console.log( data.length );
              
              if(data.length > 0) {
                  //console.log();
                  window.location.href = "/SAIL-Transfers/st-dashboard.jsp?p=" + plantName + "&e=" + empId + "&n=" + data[0].name;
              }
              else {
                  $('#error-message').css({'display': 'block'});
              }
            });

            request.fail(function( jqXHR, textStatus ) {
              console.log( "Login Request failed: " + textStatus );
            });
            
        }); 
    });
</script>
</body>
</html>
