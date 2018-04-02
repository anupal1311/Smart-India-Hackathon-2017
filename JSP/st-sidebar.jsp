  <!-- Left side column. contains the sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="http://localhost:8080/SAIL-Transfers/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p><%= userName%></p>
        </div>
      </div>
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header">MAIN ACTIVITY</li>
        <li class="treeview">
          <a href="st-dashboard.jsp">
            <i class="fa fa-dashboard"></i> <span>Dashboard</span>
          </a>
        </li>
        <li class="treeview">
          <a href="st-transfer-s1.jsp">
            <i class="fa fa-share"></i> <span>Transfer Employee</span>
          </a>
        </li>
        <li class="treeview">
          <a href="st-employee-register.jsp">
            <i class="fa fa-book"></i> <span>Employee Register</span>
          </a>
        </li>
        <li class="header">MIS REPORTS</li>
        <li><a href="st-transfer-history-report.jsp"><i class="fa fa-circle-o text-aqua"></i> <span>Transfer History</span></a></li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
