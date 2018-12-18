<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>To Do List</title>
	<!-- Bootstrap Core CSS -->
    <link href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/dist/css/sb-admin-2.css" rel="stylesheet">
	<!-- Custom Fonts -->
    <link href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
</head>
<body onload="load();">
	<div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Online To do List</a>
            </div>
            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="index.html"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
		<div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Online To Do List</h1>
                    </div>
                </div>
				<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            To Do List for Current Week
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                         <input type="hidden" id="id">
							<div class="col-lg-6">
								<div class="form-group">
									<label>Task Name</label>
									<input class="form-control" type="text" id="task_name" required="required" name="task_name">
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group">
									<label>Task Day</label>
									<select class="form-control" id="task_date" name="task_date">
                                         <option value="Monday">Monday</option>
                                         <option value="Tuesday">Tuesday</option>
                                         <option value="Wednesday">Wednesday</option>
                                         <option value="Thursday">Thursday</option>
                                         <option value="Friday">Friday</option>
                                         <option value="Saturday">Saturday</option>
                                         <option value="Sunday">Sunday</option>
                                     </select>
								</div>
							</div>
							<p><button type="button" class="btn btn-primary" style="margin-left: 1000px;" onclick="submit();">Submit</button></p>
                            <table width="100%" class="table table-striped table-bordered table-hover" id="table">
                                <thead>
                                    <tr>
                                        <th>Task Name</th>
                                        <th>Task Day</th>
                                        <th>Edit</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
				</div>
            </div>
        </div>
    </div>
	<script type="text/javascript">
	data = "";
	submit = function(){
			$.ajax({
				url:'saveOrUpdate',
				type:'POST',
				data:{user_id:$("#id").val(),task_name:$('#task_name').val(),task_date:$('#task_date').val()},
				success: function(response){
						alert(response.message);
						load();		
				}				
			});			
	}
	
	delete_ = function(id){		 
		 $.ajax({
			url:'delete',
			type:'POST',
			data:{id:id},
			success: function(response){
					alert(response.message);
					load();
			}				
		});
	}

	edit = function (index){
		$("#id").val(data[index].id);
		$("#task_name").val(data[index].task_name);
		$("#task_date").val(data[index].task_date);
	}
	
	load = function(){	
		$.ajax({
			url:'list',
			type:'POST',
			success: function(response){
					data = response.data;
					$('.tr').remove();
					for(i=0; i<response.data.length; i++){					
						$("#table").append("<tr class='tr'> <td> "+response.data[i].task_name+" </td> <td> "+response.data[i].task_date+" </td> <td> <a href='#' onclick= edit("+i+");> Edit </a>  </td> </td> <td> <a href='#' onclick='delete_("+response.data[i].id+");'> Delete </a>  </td> </tr>");
					}			
			}				
		});
	}
	</script>
</body>
</html>