
<%@ include file="/WEB-INF/includes/include.jsp"%>

<body>
	<form name="Workflow" id="Workflow">

<div class="wrapper">
		<div class="main_part_outer" id="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
					 <c:if test="${not empty message}"> 
					<div id="message" class="alert alert-${css} alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<strong>  ${message}</strong>
					</div>
				</c:if> 
						<div class="row">
							<div class="col-md-12">
								<div class="main_tittle d-flex align-items-center">
									<span class="mr-2">Configure Workflow</span>
									<span class="ml-auto"><label for="currency">Workflow Name : ${WorkflowName}</label></span>
								</div>
							</div>
						</div>
						<div class="content_box">
							<form action="${context}/createWorkFlowRulePage" id="" method="post">
							<div class="box-body">
									<div class="row">
									<div class="col-sm-12 ">
										<!-- Tabs Start-->

										<div class="tabContainer">
											<div class="tabs">

												<ul>
													<li><a href="#">Task Creation</a></li>

													<li><a href="#">Define Rules</a></li>
													<li class="active"><a href="#"><strong>Preview</strong></a></li>

												</ul>

											</div>
										</div>

										<!--tab content  start-->

										<div class="section mt-3" data-section="b">
											<!--tab2 content radio button start-->
											<div class="tab-pad border-1 form-bg col-sm-12 no-lr-pad ">
												<div class="row">
												
												<div class="col-sm-6">
														<div class="task-font2  ">Preview</div>
														<div class="border-3   ">
															<div class="task-height">
																<ol class="tasklist vertical connected-sortable ">
																	<c:forEach var="temp" items="${workflowTaskSeqlist}"
																		varStatus="counter">
																			<li class=""><a style="background-color: ${temp.role.colour};" class=" p ${counter.count}" href="#">${temp.task.taskName}  (Est. : ${temp.tat} Days)</a></li>
																	</c:forEach>
																</ol>
															</div>
														</div>

													</div>

															<div class="col-sm-4 ml-auto ">

																<div class="task-font2 ">Legends</div>
																<div class="row">
																	<c:forEach var="temp" items="${rolelist}"
																		varStatus="counter">

																		<div class="col-6 mb-2 ">
																			<span style="background-color: ${temp.colour};" class="${counter.count} p box-wf "></span>
																			${temp.roleName}
																		</div>



																	</c:forEach>
																</div>
															</div>
														
												</div>
											</div>
										</div>
									</div>
									
									</div>
								
							</div>
							
							<div class="box-footer">
								<div class=" text-right">
										<button type="submit" class="btn btn-danger"
											onclick="WorkflowList()">Back To List</button>  <!--  <a class="flat-btn pull-right" href="/results/jsp/options/workflows/createWorkflowNext.jsp">  Next</a> -->
								</div>
							</div>
							</form>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<!-- <div class="pull-right martop15">
			<div class="clearfix"></div>
		</div> -->
		<!------------add user modal end------------->

		<!-- Modal popup for create new task -->
		<div class="modal fade" id="addtask" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<span class="H2-L1"> Create a new task</span>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<input type="text" class="form-control" id="newTaskId"
							placeholder="Enter Task Name">
					</div>
					<div class="modal-footer">
						<span> <!-- <button type="button" class="btn flat-btn " data-dismiss="modal">Add New Task</button>
        </span> <span> -->
							<button type="button" class="btn flat-btn" data-dismiss="modal"
								onclick="createNewTask()">Save</button>
						</span>
					</div>
				</div>
			</div>
		</div>

		<!------End  popup for create new task------->
		<!--Container-->

<!-- 
		<script>
			$(init);

			function init() {
				$(".droppable-area1, .droppable-area2").sortable({
					connectWith : ".connected-sortable",
					stack : '.connected-sortable ul'
				}).disableSelection();
			}
			function createNewTask() {
				var newTask = document.getElementById("newTaskId").value;
				jQuery.ajax({
					type : "POST",
					cache : false,
					url : '/mpstrak/workflow/addTaskToPool?newTask=' + newTask,
					success : function(data) {
						window.location.reload();
					}
				});
			}
			function getTaskList() {
				var workflowSelectedTaskName = document
						.getElementById("workFlowTaskNameId");
				var ol = document.getElementById("previewId");
				var list = ol.getElementsByTagName("li");
				for (var i = 0; i <= list.length; ++i) {
					var el = document.createElement("option");
					var opt = list[i].innerHTML;
					el.textContent = opt;
					el.value = opt;
					el.selected = true;
					workflowSelectedTaskName.appendChild(el);

				}
			}
			function validateWorkflowName() {
				var workflowSelectedTaskName = document
						.getElementById("workFlowTaskNameId");

			}

			
		</script>
		<script>
			$(document).ready(function() {
				$("#watch-me").click(function() {
					$("#show-me:hidden").show('slow');
					$("#show-me-two").hide();
					$("#show-me-three").hide();
				});
				$("#watch-me").click(function() {
					if ($('watch-me').prop('checked') === false) {
						$('#show-me').hide();
					}
				});

				$("#see-me").click(function() {
					$("#show-me-two:hidden").show('slow');
					$("#show-me").hide();
					$("#show-me-three").hide();
				});
				$("#see-me").click(function() {
					if ($('see-me-two').prop('checked') === false) {
						$('#show-me-two').hide();
					}
				});

				$("#look-me").click(function() {
					$("#show-me-three:hidden").show('slow');
					$("#show-me").hide();
					$("#show-me-two").hide();
				});
				$("#look-me").click(function() {
					if ($('see-me-three').prop('checked') === false) {
						$('#show-me-three').hide();
					}
				});

			});
		</script> -->
		<script>
			setTimeout(function() {
				$('#message').fadeOut('fast');
			}, 2000);
			
			function WorkflowList() {
				document.getElementById("Workflow").action = "workflowList";
				document.getElementById("Workflow").method = "GET";
				document.getElementById("Workflow").submit();
			}
		</script>

<!-- 		<script
			src='https://cdnjs.cloudflare.com/ajax/libs/gsap/1.18.0/TweenMax.min.js'></script>

		drag- drop  script start
		<script
			src='https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>

 -->

	</form>
</body>
</html>
