<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="text/javascript" src="/js/algorithmsSettingGA.js"></script>
		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<!-- Bootstrap -->
		<%--<link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">--%>
		<link rel="stylesheet" type="text/css" href="/css/algorithmsSetting.css" />
		<link rel="stylesheet" href="/layui/css/layui.css">
		<title></title>
	</head>
	<body>
		<div class="main">
			<div class="left" >
				<ul class="top">
				<li><span style="font-weight:bold;">Algorithms</span></li>
				<li><span>MinMin</span></li>
				<li><span>MaxMin</span></li>
				<li><span>FCFS</span></li>
				<li><span>RoundRobin</span></li>
				</ul>
				<ul class="nav nav-pills nav-stacked bottom">
				  <li role="presentation" ><a href="/algorithmsSetting/PSO">PSO</a></li>
				  <li role="presentation" class="active"><a>GA</a></li>
				</ul>
				<div class="button">
				<button type="button" class="btn btn-primary">Add Algorithm</button>
				</div>
			</div>
			<div class="right">
				<div style="font-weight:bold;margin:15px 20px;font-size: 1.2em;">GA Algorithm Parameter Settings</div>
				<form id="inputForm">
					<table class="top">
						<tr>
							<td style="width: 150px;">Population Size:</td>
							<td><input class="form-control" name="Population_Size" value="${ga.population_Size}" placeholder=""></td>
						</tr>
						<tr>
							<td>Number of Iterations:</td>
							<td><input class="form-control" name="Number_of_Iterations" value="${ga.number_of_Iterations}" placeholder=""></td>
						</tr>
						<tr>
							<td>Cross Rate:</td>
							<td><input class="form-control" name="Cross_Rate" value="${ga.cross_Rate}" placeholder=""></td>
						</tr>
						<tr>
							<td>Mutation Rate:</td>
							<td><input class="form-control" name="Mutation_Rate" value="${ga.mutation_Rate}" placeholder=""></td>
						</tr>
						<tr>
							<td>Repeated Experiment:</td>
							<td><input class="form-control" name="Repeated_experiment" value="${ga.repeated_experiment}" placeholder=""></td>
						</tr>
					</table>
				</form>
				<div class="bottom">
					<button type="button" onclick="settingOK()" class="btn btn-primary">setting OK</button>
				</div>
				<form id="fileForm" enctype='multipart/form-data'>
					<div class="form-group bottom">
						<input type="file" style="margin-left: 50px;" name="file" id="file">
					</div>
					<div class="bottom">
						<button type="button" onclick="download()" class="btn btn-primary">Export</button>
						<button type="button" onclick="upload()" class="btn btn-primary">Import</button>
					</div>
				</form>
			</div>
		</div>
		<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
		<%--<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>--%>
		<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
		<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>--%>
	</body>
	<style>
		body{
			/*background-color: #ddd;*/
			margin:0;
			padding:0;
		}
	</style>
</html>
