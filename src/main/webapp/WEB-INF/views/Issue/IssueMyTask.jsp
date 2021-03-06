<%@ include file="/WEB-INF/includes/include.jsp" %>
	<div class="wrapper">
		<div class="main_part_outer" id="content">
			<div class="d-flex flex-column w-100 h-100">
				<div class="container-fluid">
				<c:if test="${not empty message}">
							<div class="alert alert-${css} alert-dismissible" role="alert">
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<strong> ${message}</strong>
							</div>
						</c:if>
					<!--main_tittle-->
					<div class="row">
						<div class="col-md-12">
							<div class="main_tittle d-flex align-items-center">
									<span class="mr-2">My <spring:message code="issue.book" /> Task List</span> <span id="Date"></span><span class="ml-auto">
								</div>
							
						</div> 
					<%-- 		<div class="col-sm-6 col-md-6" >
						<select class="slctbtn " id="multijournal">
							<c:forEach var="journalList" items="${journalList}">
								<option value='${journalList.journalId}'
									onclick="multijournal(${journalList.articleWorkflowId})">${journalList.journalName} ${journalList.articleWorkflowId}</option>
							</c:forEach>
						</select> <label class=" asnButton bg-info fa fa-arrow-circle-left "> Switch Journal</label>
					</div> --%>
					</div>
					<!--main_tittle_End-->

					<form name="groupTask" id="groupTask">
					<input type="hidden" name="flag" id="flag" value="${flag}">
						<div class="row">
							<div class="col-md-12">
									<div class="content_box">
									<div class="box-body">
										<table class="table table-striped table-bordered m-0 filter8" id="issueTable">
											<thead class="table-head">
												<tr>
													<th>S.No.</th>
													<!-- <th>Article ID</th> -->
													<th data-orderable="false"><spring:message code="book.journal" /> Abbreviation </th>
													<th>Title</th>
													<th>Task Name</th>
													<th>Stage</th>
													<th>Schedule Start Date</th>
													<th>Schedule End Date</th>
<!-- 													<th>Actual Start Date</th> -->
													<th>Action</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="temp" items="${taskScheduler}" varStatus="counter"> 
													
													<tr>
														<td align="center">${counter.count}</td>
													<%-- 	<td align="center">${temp.aid}</td> --%>
														<td align="center">${temp.journalAbbrName}</td>
														<td>${temp.issue_title}</td>
														<td>${temp.taskName}</td>
														<td>${temp.taskStatus}</td>
														<td><fmt:formatDate pattern="dd-MM-yyyy" value="${temp.schStartTime}" /></td>
														<td><fmt:formatDate pattern="dd-MM-yyyy" value="${temp.taskEstTimeFrom}" /></td>
<%-- 														<td><fmt:formatDate pattern="dd-MM-yyyy" value="${temp.start_date_time}" /></td> --%>
														<td align="center">
														<input type="hidden" name="article_id_${temp.issueTaskId}" id="article_id" value="${temp.issue_id}">
														<input type="hidden" name="article_task_id" id="article_task_id" value="${temp.issueTaskId}"> 
<%-- 														<input type="hidden" name="journalId" id="journalId" value="${temp.journalId}"> --%>
													  <a href="#" class="btn btn-outline-success btn-sm" onclick="StartMYTask(${temp.issueTaskId})"> Start </a> 
														<!-- <a href="/unitouchLogo" class="btn btn-outline-success btn-sm" > Start </a> -->
														</td>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
	
		<script>
	 function StartMYTask(val) {
		document.getElementById("article_task_id").value = val;
		document.getElementById("groupTask").action = "view-groupTaskIssue";
		document.getElementById("groupTask").method = "POST";
		document.getElementById("groupTask").submit();
	}
	 
	 
 	 function multijournal(wkid){ 
	    	var journalId= $('#multijournal').find('option:selected').val();
	    	//alert(wkid);
				var mappingJSON = {};
				mappingJSON["journal_id"] = journalId;
				mappingJSON["workflow_id"] = wkid;
				var mappingInfo = JSON.stringify(mappingJSON);
				$.ajax({
					url : '${context}/getArticleInMytask',
					type : "POST",
					data : mappingInfo,
					contentType : "application/json; charset=utf-8",
					dataType : "json",
					cache : false,
					success : function(result) {
						var articlePoolList = result.payload;
						var count=1;
						$('.appData').hide();
						articlePoolList.forEach(function(x, index) {
							var str = '<tr class=appData>'+
							'<td>'+ (count++)+'</td>'+
							'<td align="left"><input type="checkbox" class="checkItem" id='+x.article_task_id+'	value='+x.article_task_id+'+></td>'+
							'<td>'+ x.aid+'</td>'+
							'<td>'+ x.journalAbbrName+'</td>'+
							'<td>'+ x.article_title+'</td>'+
							'<td>'+ x.taskName+'</td>'+
							'<td>'+ x.task_status+'</td>'+
							'<td>'+x.sch_start_time+'</td>'+
							'<td>'+ x.sch_end_time+'</td>'+
							'<td >'+
							'<input type="hidden" name="article_id" id="article_id" value='+x.article_id+'>' + 
							'<input type="hidden" name="article_task_id" id="article_task_id" value='+x.article_task_id+'>' +
							'<a href="#" class="btn btn-outline-success btn-sm" onclick="StartGroupTask('+x.article_task_id+','+x.article_id+')">Assign Me</a></td>'+
							'</tr>';	
			
							$('#appData').append(str);
								//alert(str);
						});
					},
					error : function(e) {
						console.log(e.message);
					}
				});
		
	    	} 
	</script>
	
	