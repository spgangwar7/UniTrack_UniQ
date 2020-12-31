<style>
table {
	counter-reset: tableCount;
}

.counterCell:before {
	content: counter(tableCount);
	counter-increment: tableCount;
}

.shorting-icon {
	position: absolute;
	right: 10px;
	cursor: pointer;
	oderingPage
}

.avoid-clicks {
	pointer-events: none;
}
</style>
<style>
/* Center the loader */
#loader {
	position: absolute;
	left: 50%;
	top: 50%;
	z-index: 1;
	width: 150px;
	height: 150px;
	margin: -75px 0 0 -75px;
	border: 16px solid #f3f3f3;
	border-radius: 50%;
	border-top: 16px solid #3498db;
	width: 120px;
	height: 120px;
	-webkit-animation: spin 1s linear infinite;
	animation: spin 2s linear infinite;
}

@
-webkit-keyframes spin { 0% {
	-webkit-transform: rotate(0deg);
}

100%
{
-webkit-transform
:
 
rotate
(360deg);
 
}
}
@
keyframes spin { 0% {
	transform: rotate(0deg);
}

100%
{
transform
:
 
rotate
(360deg);
 
}
}

/* Add animation to "page content" */
.animate-bottom {
	position: relative;
	-webkit-animation-name: animatebottom;
	-webkit-animation-duration: 1s;
	animation-name: animatebottom;
	animation-duration: 1s
}

@
-webkit-keyframes animatebottom {from { bottom:-100px;
	opacity: 0
}

to {
	bottom: 0px;
	opacity: 1
}

}
@
keyframes animatebottom {from { bottom:-100px;
	opacity: 0
}

to {
	bottom: 0;
	opacity: 1
}
}
</style>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/pure/1.0.1/pure-min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
<!-- <script src="mindmup-editabletable.js"></script> -->
<link href="resources/css/my_style.css" rel="stylesheet">
<%@ include file="/WEB-INF/includes/include.jsp"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- <script src="resources/static/js/SimpleTableCellEditor.es6.min.js"></script> -->

<div class="wrapper">
	<div class="main_part_outer" id="content">
		<div class="d-flex flex-column w-100 h-100">
			<div class="container-fluid" id="mainhide">
				<!--main_tittle-->
				<c:if test="${not empty message}">
					<div class="alert alert-${css} alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<strong> ${message}</strong>
					</div>
				</c:if>
				<%-- <form name="group" id="group" enctype="multipart/form-data">
					<div class="row">
						<div class="col-md-10">
							<div class="main_tittle d-flex align-items-center">
								<span class="mr-2">Issue Makeup</span> <span id="Date"></span><span
									class="ml-auto"> </span>
							</div>
						</div>

					</div>


					<div class="row" id=hideDiv>
						<div class="col-md-12">
							<div class="">
								<div class=" alert-warning">
									<!--main_tittle_End-->
									<div id='Show-wf' class="mb-2">
										<div class="row">
											<div class="col">
												<div class="">
													<label>Journal</label>
													<form:select path="journallist" id="journalId"
														onchange="getissueData()" name="journalId"
														class="form-control">
														<form:option value="Please Select" labelValue="" />
														<form:options items="${journallist}" itemValue="journalId"
															itemLabel="journalName" />
													</form:select>
												</div>
											</div>
											<div class="col">
												<div class="">
													<label>Choose Issue</label> <select class="form-control"
														name="issueId" id="issueName">
														<option value="">Please Select Journal First</option>
													</select>

												</div>
											</div>


											<div class="col">
												<div class="">
													<label class="d-block">&nbsp;</label>
													<button onclick="searchdata()" class="btn btn-danger mb-2">
														<i class="fa fa-search"></i> Search
													</button>

												</div>
											</div>
											<div class="col">
												<div class="">
													<label class="d-block">&nbsp;</label> <label>Or
														Create New issue :</label>
												</div>
											</div>
											<div class="col">
												<label class="d-block">&nbsp;</label>
												<button type="button" class="btn btn-danger"
													data-toggle="modal" data-target="#addissue">
													<i class="fa fa-plus font-icon "></i> &nbsp;&nbsp;Add New
													Issue
												</button>
											</div>

										</div>
									</div>

								</div>

							</div>
						</div>
					</div>
				</form> --%>
				<c:if test="${issueData ne null}">
					<div class=" alert-info">
						<div class="row">
							<div class="col-sm-6 col-md-6">
								<div class="form-group col">
									<label class="art-left"><spring:message code="book.journal" /> Name </label><input
										type="hidden" value="${journal.journalId}" id="jrId">
									<span class="form-control bg-light title-right title-right">${journal.journalName}</span>
								</div>
							</div>
							<div class="col-sm-6 col-md-6">
								<div class="form-group col">
									<label class="art-left">Workflow Name </label><input
										type="hidden" value="${workflow.id}" id="wrkfId"> <span
										class="form-control bg-light title-right">${workflow.name}</span>
								</div>
							</div>

						</div>
						<div class="row">
							<div class="col-sm-4 col-md-3">
								<div class="form-group col">
									<label class="art-left"><spring:message code="issue.book" /> Title</label><input type="hidden"
										value="${issueData.issue_id}" id="isuId"> <span
										class="form-control bg-light title-right">${issueData.issue_title}</span>
								</div>
							</div>
							<div class="col-sm-4 col-md-3">
								<div class="form-group col">
									<label class="art-left"><spring:message code="book.journal" /> Volume</label> <span
										class="form-control bg-light title-right">${issueData.last_volume_number}</span>
								</div>
							</div>
							<div class="col-sm-4 col-md-3">
								<div class="form-group col">
									<label class="art-left"><spring:message code="issue.book" /> Volume</label><span
										class="form-control bg-light title-right">${issueData.last_issue_number}</span>
								</div>
							</div>

							<div class="col-sm-4 col-md-3">
								<div class="form-group col">
									<label class="art-left">Volume Year</label><span
										class="form-control bg-light title-right">${issueData.volume_year}</span>
								</div>
							</div>


						</div>
					</div>
					<div class="">
						<div class="">
							<div class="task-panel">
								<div class="content_box ">
									<div class="task-font"><spring:message code="chapters.articles" /> Available for Issue</div>

									<div class="task-height editableform-loading min-h-150">
										<!-- articleTable  -->
										<table class="table table-striped table-bordered m-0  "
											id="articleTable">
											<thead
												class="table-head tasklist vertical connected-sortable droppable-area1 ui-sortable ">
												<tr class="avoid-clicks">
													<th>S.no</th>
													<!-- <th>Aid</th> -->
													<th><spring:message code="chapter.article" /> id</th>
													<th><spring:message code="chapter.article" /> title</th>
													<th>Pages</th>
													<th>Color Image</th>
													<th>BW Image</th>
													<th>tbc</th>
													<th>tbc</th>
													<th>Type</th>
													<th><spring:message code="chapter.article" /> DOI</th>
													<th><spring:message code="chapter.article" /> status</th>
													<th><spring:message code="chapter.article" /> Remark</th>


												</tr>
											</thead>

											<tbody
												class="tasklist vertical connected-sortable droppable-area1 ui-sortable">
												<c:forEach var="temp" items="${ArticleDetail}"
													varStatus="counter">
													<tr class="draggable-item ui-sortable-handle">
														<td class="counterCell "><input class="pkid"
															type='hidden' value='${temp.article_id}'></td>
														<%-- <td>${temp.article_id}</td> --%>
														<td>${temp.aid}</td>
														<td>${temp.article_title}</td>
														<td>${temp.article_pages}</td>
														<td class=textEdit>0</td>
														<td class=textEdit>0</td>
														<td class='numericEdit to'>0</td>
														<td class='numericEdit from'>0</td>
														<td>${temp.article_type_cd}</td>
														<td>${temp.article_doi}</td>
														<td>${temp.taskName}</td>
														<td class=textEdit>${temp.articleComment}</td>
													</tr>
												</c:forEach>

											</tbody>
										</table>

									</div>
								</div>
							</div>
						</div>

						<!-- Image loader -->
						<div id='loader' style='display: none;'></div>
						<!-- Image loader -->
						<div class="">
							<div class="">
								<div class=" ">


									<!-- <button type="submit" id="add-service-button">Add File/Pages</button> -->

									<div class="task-height min-h-150">

										<span class="task-font float-left"><spring:message code="chapters.articles" /> Available
											In <spring:message code="issue.book" /> </span>&nbsp;&nbsp; <select id="issueId"
											placeholder="Enter Title Here">
											<!-- <option value="CoverPage">Cover Page</option> -->
											<option value="IssueCover"><spring:message code="issue.book" /> Cover</option>
											<option value="PrintCover">Print Cover</option>
											<option value="Frontmatter">Frontmatter</option>
											<option value="Backmatter">Backmatter</option>
											<option value="IssueLayout"><spring:message code="issue.book" /> Layout</option>
											<option value="IssueText"><spring:message code="issue.book" /> Text</option>
											<option value="PrintText">Print Text</option>
											<option value="Printlayout">Print layout</option>
											<option value="Advertisement">Advertisement Page</option>
											<option value="AdditionalFile">Additional File</option>
											<option value="Add Extra Page In Issue">Add Extra
												Page In <spring:message code="issue.book" /></option>
										</select>
										<!-- <input type="text" id="issueId"
											placeholder="Enter issueId here..." /> -->
										<input type="text" id="issueTitle"
											placeholder="Enter Title Here" />
										<!-- <select id="issueTitle" placeholder="Enter issueTitel here..."><option
												value="CoverPage">Cover Page</option>
											<option value="Advertisement">Advertisement Page</option></select>  -->
										<input type="text" id="pageNo" maxlength=6
											placeholder="Enter Page Number Here" />
										<c:if test="${issSeqLast.to_page ne null}">
									<c:if test="${issueData.isSupplementary eq 'Y'}">
									
										<input type="text" id="enterPage" maxlength=6 value="0"
											 placeholder=" Page Number Here" />
									
									</c:if>
									<c:if test="${issueData.isSupplementary eq 'N'}">
									
										<input type="text" id="enterPage" maxlength=6 value="${issSeqLast.to_page}"
											 placeholder=" Page Number Here" />
									</c:if>
									</c:if>
									<c:if test="${issSeqLast.to_page eq null}">
										<input type="text" id="enterPage" maxlength=6 value="1"
											 placeholder=" Page Number Here" />
									</c:if>
										<%-- <input type="text" id="enterPage" maxlength=6 value="${issSeqLast.to_page}"
											 placeholder=" Page Number Here" /> --%>
									
										<!-- 	<button type="button" class="btn btn-info float-right"
											data-toggle="modal" data-target="#addIssueData">
											<i class="fa fa-plus font-icon "></i> &nbsp;Add File/Pages
											Issue addrow() 
										</button> -->
										<button type="button" id="oderingPage"
											class="btn btn-outline-danger btn-sm  float-right ml-2 oderingPage">
											<i class="fa font-icon "></i> &nbsp;Update Page Range
										</button>
										<button type="button" onclick="downloadExcel()"
											class="btn btn-dark btn-sm float-right ml-2">
											<i class="fa  font-icon "></i> &nbsp;Download Excel
										</button>
										<button type="submit" id="add-service-button"
											class="btn btn-outline-danger btn-sm  float-right">
											<i class="fa fa-plus font-icon "></i> &nbsp;Add Pages
										</button>
										<!-- 	<small  class="btn  float-right" ><input type="checkbox" class="form-check-input"
											id="advancedToggle" checked> <label class="form-check-label"
											for="advancedToggle">Click to edit</label></small> -->
										<form method="POST" enctype="multipart/form-data" id="fileupl">
											<input type="hidden" name="issue_id"
												value="${issueData.issue_id}">
											<table id="service-table"
												class="table table-striped table-bordered m-0 tasklist ui-state-disabled vertical connected-sortable droppable-area2 ui-sortable">
												<!-- 	<thead class="table-head">
													<tr>
														<th>S.no</th>
														<th>Aid</th> 
														<th>Article id</th>
														<th>Article title</th>
														<th>Pages</th>
														<th>Color Image</th>
														<th>BW Image</th>
														<th>From</th>
														<th>To</th>
														<th>Article DOI</th>
														<th>Article status</th>
													</tr>
												</thead> -->
												<thead
													class="table-head ui-state-default ui-state-disabled disabled avoid-clicks">
													<tr id="GridViewPP" class="avoid-clicks">
														<th width="5%" class="position-relative"
															onclick="sortTable(0)">S.no</th>
														<!-- 														<th>Aid</th>  -->
														<th width="7%" class="position-relative"
															onclick="sortTable(1)">Article id</th>
														<th width="35%" class="position-relative"
															onclick="sortTable(2)">Article title</th>
														<th class="position-relative" onclick="sortTable(3)">Pages
														</th>
														<th class="position-relative" onclick="sortTable(4)">Color
															Image</th>
														<th class="position-relative" onclick="sortTable(5)">BW
															Image</th>
														<th class="position-relative" onclick="sortTable(6)">From
														</th>
														<th class="position-relative" onclick="sortTable(7)">To
														</th>
														<th class="position-relative" onclick="sortTable(8)">
															Type</th>
														<th class="position-relative" onclick="sortTable(9)"><spring:message code="chapter.article" />
															DOI</th>
														<th class="position-relative" onclick="sortTable(10)">status
															| File Name</th>
														<th class="position-relative" onclick="sortTable(10)"><spring:message code="chapter.article" />
															Remark</th>
													</tr>
												</thead>
												<!-- <tbody
													class="tasklist vertical connected-sortable droppable-area2 ui-sortable">
 -->
												<tbody
													class="tasklist vertical connected-sortable droppable-area2 ui-sortable">

													<c:forEach var="temp" items="${issueSeq}"
														varStatus="counter">
														<tr class="draggable-item ui-sortable-handle">
															<td class="counterCell "><input type='hidden'
																value='${temp.ispId}'></td>
															<td>${temp.coverArticleId}</td>
															<td>${temp.articletitle}</td>
															<td>${temp.pages}</td>

															<td class=textEdit>${temp.colorimage}</td>
															<td class=textEdit>${temp.bwimage}</td>
															<td class='numericEdit to'>${temp.page_from}</td>
															<td class='numericEdit from'>${temp.to_page}</td>
															<td class=''>${temp.article_type_cd}</td>
															<c:if test="${temp.articleDoi ne 'Remove'}">
																<td>${temp.articleDoi}</td>
															</c:if>
															<c:if test="${temp.articleDoi eq 'Remove'}">
																<td><a class='del-service' href='#'
																	title='Click to remove this entry'>Remove</a></td>
															</c:if>
															<td>${temp.issueFile.fileName} ${temp.taskName}</td>
															<%-- 	<td>${temp.filePath}</td> <input type="hidden" id="fileURL" name="fileURL">
														<button type='button' class=" btn-danger"
																onclick="DownloadFile('C:\\unitouch\\azmj\\33689\\Origin\\AZMJ_39_19_qrc.png')"
																value='Download'>Download</button>--%>
															<td class=textEdit>${temp.articlComment}</td>
														</tr>
													</c:forEach>
												</tbody>
												<!-- </tbody> -->
											</table>
										</form>

									</div>

								</div>

							</div>

							<div class=" pull-right ">
								<button type="button" class="btn btn-danger "
									onclick="saveIssueMakeup()">Save</button>
								<%-- <a type="button" class="btn btn-outline-danger"
												href="${context}/getIssueData">Draft & Exit</a> --%>

								<a type="button" class="btn btn-outline-danger"
									href="${context}/getIssueList">Cancel</a>

							</div>
						</div>


					</div>

				</c:if>



			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="addissue" role="dialog">
	<div class="modal-dialog modal-widt">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Create a new <spring:message code="issue.book" /></h5>

				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>


			<form action="${context}/saveIssue" method="post"
				enctype="multipart/form-data">
				<div class="modal-body">
					<div class="row ">
						<div class="col-md-12 ">
							<div class="content_box">
								<div class="box-body">

									<div class="row">

										<div class="col-md-6">
											<div class="form-group">
												<label for="currency"><spring:message code="issue.book" /> Title</label> <input type="text"
													class="form-control" name="issue_title" id="issue_title"
													placeholder="" autocomplete="off" required>
											</div>
										</div>
										<!--  <div class="col-md-4">
												<div class="form-group">
													<label for="currency">Issue Workflow</label> <input
														type="text" class="form-control" name="issue_workflow"
														id="issue_workflow" placeholder="" autocomplete="off"
														required>
												</div>
											</div> -->
										<div class="col-md-6">
											<div class="form-group">
												<label for="ExpertiseLevel"><spring:message code="book.journal" /> ID </label>
												<form:select path="journallist" id="journalId"
													autocomplete="off" required="required" name="journalId"
													class="form-control">
													<form:option value="" placeholder="Please Select"
														labelValue="" />
													<form:options items="${journallist}" itemValue="journalId"
														itemLabel="journalName" />
												</form:select>
											</div>
										</div>
									</div>

									<div class="row">

										<%--  <div class="col-md-4">
												<div class="form-group">
													<label for="currency">Publisher ID</label>
													<form:select path="publisherList" id="publisher_id"
														name="publisher_id" class="form-control">
														<form:option value="Please Select" labelValue="" />
														<form:options items="${publisherList}"
															itemValue="publisher_id" itemLabel="publisherName" />
													</form:select>
												</div>
											</div> --%>
										<div class="col-md-6">
											<div class="form-group">
												<label for="currency">Current volume number</label> <input
													type="text" class="form-control" name="last_volume_number"
													id="last_volume_number" placeholder="Max length is 3"
													autocomplete="off"
													onkeypress="return this.value.length < 3;"
													oninput="if(this.value.length>=10) { this.value = this.value.slice(0,3); }"
													required>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="currency">Current <spring:message code="issue.book" /> number</label> <input
													type="text" class="form-control" name="last_issue_number"
													id="last_issue_number" placeholder="Max length is 3"
													autocomplete="off"
													onkeypress="return this.value.length < 3;"
													oninput="if(this.value.length>=10) { this.value = this.value.slice(0,3); }"
													required>
											</div>
										</div>
										<!-- <div class="col-md-4">
											<div class="form-group">
												<label for="currency">Upload File <sup class="text-red">&lowast;</sup></label> <input
													type="file" class="form-control" name="attachment" 
													id="filepath" placeholder="" autocomplete="off" required>
											</div>
										</div> -->
									</div>
									<div class="row">
										<div class="col-md-4">
											<!-- <div class="form-group">
												<label for="currency">Volume Year</label> <input type="text"
													class="form-control" name="volume_year" id="volume_year"
													placeholder="" autocomplete="off" required>
											</div> -->
											<div class="form-group">
												<label for="currency">Volume Year</label> <input type="text"
													class="form-control" name="volume_year" id="datepicker"
													onkeypress="return this.value.length < 4;"
													oninput="if(this.value.length>=10) { this.value = this.value.slice(0,4); }"
													placeholder="" autocomplete="off" required>
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label for="currency">Number of Volume per Year</label> <input
													type="text" class="form-control"
													name="number_of_volume_per_year"
													id="number_of_volume_per_year"
													placeholder="Max length is 3"
													onkeypress="return this.value.length < 3;"
													oninput="if(this.value.length>=10) { this.value = this.value.slice(0,3); }"
													onkeypress="return this.value.length < 3;"
													oninput="if(this.value.length>=10) { this.value = this.value.slice(0,3); }"
													autocomplete="off" required>
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label for="currency">Number of <spring:message code="issue.book" /> per Volume</label> <input
													type="text" class="form-control"
													name="number_of_issue_per_year"
													id="number_of_issue_per_year" placeholder="Max length is 3"
													onkeypress="return this.value.length < 3;"
													oninput="if(this.value.length>=10) { this.value = this.value.slice(0,3); }"
													autocomplete="off required">
											</div>
										</div>
									</div>

									<div class="row">
										<!-- <div class="col-md-4">
												<div class="form-group">
													<label for="currency">Annual Page Budget</label> <input
														type="text" class="form-control" name="annual_page_budget"
														id="annual_page_budget" placeholder="" autocomplete="off"
														required>
												</div>
											</div> -->
										<!-- <div class="col-md-4">
												<div class="form-group">
													<label for="currency">Annual Article Budget</label> <input
														type="text" class="form-control"
														name="annual_article_budget" id="annual_article_budget"
														placeholder="" autocomplete="off" required>
												</div>
											</div> -->
										<!-- <div class="col-md-4">
												<div class="form-group">
													<label for="currency">Production Time Target</label> <input
														type="text" class="form-control"
														name="production_time_target" id="production_time_target"
														placeholder="" autocomplete="off" required>
												</div>
											</div> -->

									</div>


									<div class=" mt-3 text-right">
										<a class="btn btn-outline-danger" href="issueMakeup"><i
											class="fa fa-close"></i> Cancel</a> &nbsp; <input type="submit"
											class="btn btn-danger " />
									</div>



								</div>
							</div>
						</div>
					</div>
				</div>
			</form>


		</div>
	</div>
</div>
<div>
	<form method="POST" id="coverFile">
		<div id="issueTable">

			<table class="table  table-bordered" id="showData">
				<thead class="table-head">
					<tr>

						<th><spring:message code="chapter.article" /> Id</th>
						<th>workflow</th>
						<th><spring:message code="chapter.article" /> Title</th>
						<th>Page</th>
						<th><spring:message code="book.journal" /></th>
						<th>Sequence Number</th>
						<th><spring:message code="chapter.article" />  DOI</th>
					</tr>
				</thead>

				<tbody id=appData></tbody>
			</table>
		</div>
	</form>
</div>
<!-- 
<div class="modal fade" id="addIssueData" role="dialog">
	<form method="POST" enctype="multipart/form-data" id="fileUploadForm">
		<div class="modal-dialog">

			Modal content
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title">Add Page</h5>

					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<div class="row ">
						<div class="col-md-12 ">
							<div class="content_box">
								<div class="box-body">
									<div class="form-group">
										<label for="currency">Enter Page Id :</label> <input
											type="text" class="form-control" id="issueId" required
											placeholder="Enter issueId here..." />
									</div>
									<div class="form-group">
										<label for="currency">Select Page Title :</label> <select
											id="issueTitle" class="form-control">
											<option value="CoverPage">Cover Page</option>
											<option value="Advertisement">Advertisement Page</option>
										</select>
											 <input
										type="text" id="issueTitle" class="form-control" required
										placeholder="Enter issueTitle here..." />
									</div>
									<div class="form-group">
										<label for="currency" id="errormsg"> Number of Page:</label> <input
											type="text" id="pageNo" class="form-control" required
											placeholder="Enter Page Number here..." />
									</div>
									<div class="form-group">
										<label for="currency">Upload File <sup
											class="text-red">&lowast;</sup></label> <input type="file"
											class="form-control" name="files1" id="attachmentCover"
											placeholder="" autocomplete="off" required>
									</div>
								</div>
							</div>
							<button type="submit" id="add-service-button"
								class="btn btn-info float-right" onclick="saveCoverPage();">
								<i class="fa fa-plus font-icon "></i> &nbsp;Add File/Pages Issue
							</button>
						</div>
					</div>
				</div>

			</div>
		</div>
	</form>
</div>
 -->
<script>
$(window).on("load", function () {
	$("#showData").hide();
});
	/* function getissueData() {
		debugger;
		var journalId = document.getElementById("journalId").value

		var mappingJSON = {};
		mappingJSON["journalId"] = journalId;

		var mappingInfo = JSON.stringify(mappingJSON);
		$.ajax({
			url : '${context}/issueMakeuplist',
			type : "POST",
			data : mappingInfo,
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			cache : false,
			success : function(result) {

				$('#issueName').empty();
				var issueDetailList = result.payload;
				issueDetailList.forEach(function(x, index) {

					var str = '<option value="'+x.issue_id+'">' + x.issue_title	+ '</option>';
					$('#issueName').append(str);

				});

			},
			error : function(e) {
				console.log(e.message);
			}
		});
	} */
	//  Save IssueList

	/* function validate() {
		var custName = document.getElementById("Issue_Makeup").value;
		if (custName == '') {
			alert("Workflow name is mandatory and It must be an unique value.");
			return false;
		}

		return true;
	} */
	function numberofIssue(){
		var tabel1 = document.getElementById('service-table');
		var rijen = tabel1.rows.length;
	    if(rijen<=2){
	    	alert("Please Drag And Drop at least 2 article in this Issue Area");
	    	return false;
	    }
	    	return true;
	  }
	function saveIssueMakeup() {
		if (numberofIssue()&&confirm("Are you sure you want to save this issue ?")) {
		debugger;
		var taskpre = document.getElementById("service-table");
		//Store HTML Table Values into Multidimensional Javascript Array Object
		var TableData = new Array();
		var values = {};
		var wrkId = document.getElementById("wrkfId").value;
		var jrId = document.getElementById("jrId").value;
		var isuId = document.getElementById("isuId").value;
		//var form = $('#attachmentCover')[0].value;
		 var form = $('#fileupl')[0]; 
		 var data = new FormData(form);
//		 alert(data);
// 		var data = new FormData();    
// 		jQuery.each(jQuery('#group')[0].files, function(i, file) {
// 		    data.append('files-'+i, file);
// 		});
	   // var data = new FormData(form);
				
		//var d=document.getElementById("service-table").childNodes[3].children[1].children[0].childNodes[0].value
	//	alert(d);
		  var tabel = document.getElementById('service-table');
		    var rijen = tabel.rows.length;

		    for (i = 0; i < rijen; i++){
		        var inputs = tabel.rows.item(i).getElementsByTagName("input");
		        var inputslengte = inputs.length;

		        for(var j = 0; j < inputslengte; j++){
		            var inputval = inputs[j].value;                
		          //  alert(inputval);
		        }            
		    } 
		    debugger;
			
		    $('#service-table tr ').each(function(row, tr) {
			debugger;
			var pk=$(this).closest('tr').find('td input').eq(0).val();
			TableData[row] = {
				"pkid"	: pk,
				"artID" : $(tr).find('input:eq(0)').text(),
				"artID" : $(tr).find('input:eq(0)').text(),
				"articleId" : $(tr).find('td:eq(1)').text(),
				"articletitle" : $(tr).find('td:eq(2)').text(),
				"pages" : $(tr).find('td:eq(3)').text(),
				"colorimage" : $(tr).find('td:eq(4)').text(),
				"bwimage" : $(tr).find('td:eq(5)').text(),
				"pageFrom" : $(tr).find('td:eq(6)').text(),
				"pageTo" : $(tr).find('td:eq(7)').text(), 
				"articleType" : $(tr).find('td:eq(8)').text(),
				"articleDOI" : $(tr).find('td:eq(9)').text(),
				"atStatusCoverid" : $(tr).find('td:eq(10)').text(),
				"articleComment" : $(tr).find('td:eq(11)').text(),
 			//	"attachmentCover" :data,
				"jId" : jrId,
				"workflowid" : wrkId,
				"issueId" : isuId
			
				
			}//tableData[row]
		});
	
		TableData.shift(); // first row will be empty - so remove
		debugger;
		//alert(data);
		var Data;
		Data = JSON.stringify(TableData);
//	alert(Data);
// 		var formData = new FormData();
// 		formData.append('file', data);
// 		formData.append('datafile', TableData);
// 		alert(Data);
		//alert(wrkId + " :: " + jrId);
		/*  */
		   event.preventDefault();

        // Get form
//  	   var form = $('#coverFile')[0];

//  	     var data1 = new FormData(form);
//          data1.append("CustomField", "This is some extra data, testing");
//          data1.append("wrkId",wrkId);
 	//	alert(data);
 		data.append('filedata', Data);
 		data.append('jrID', jrId);
 		data.append('issueID', isuId);
		// disabled the submit button
       // $("#add-service-button").prop("disabled", true);
		/*  */
		debugger;
		$.ajax({
			url : '${context}/editeCreateIsserSeq',
			/* type : "POST",
			data : Data,
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			cache : false, */
		    type: 'POST',
            data: data,
            async: false,
            cache: false,
            contentType: false,
            enctype: 'multipart/form-data',
            processData: false,
            beforeSend: function(){
                // Show image container
                $("#loader").show();
               },
			success : function(result) {
			//	$('#hideDiv').hide();
			//	$('#mainhide').hide();
				 $("#loader").hide();
				alert("Issue updated  successfully");
				if(result){
					document.getElementById("coverFile").action = "getIssueList";
					document.getElementById("coverFile").method = "GET";
					document.getElementById("coverFile").submit();
				}else
				{ location.href = "http://unitouch.digiscapetech.com/getIssueList"}
// 				$("#showData").show();
// 				//$('#issueName').empty();
// 				var issueSeqList = result.payload;
// 				//alert(issueSeqList);
// 				//$("#showData").DataTable();
// 				//alert(issueSeqList+" ::::::");
// 				issueSeqList.forEach(function(x, index) {
// 					//'<option value="'+x.issue_id+'">' + x.issue_title	+ '</option>'
// 					var str = '<tr><td>' + x.coverArticleId + '</td>' + '<td>'
// 							+ x.workflows.name + '</td>' + '<td>'
// 							+ x.articletitle + '</td>' + '<td>' + x.pages
// 							+ '</td>' + '<td>' + x.journals.journalName
// 							+ '</td>' + '<td>' + x.sequenceNo + '</td>'
// 							+ '<td>' + x.articleDoi + '</td>' + '</tr>';
// 						alert(str);
// 					$('#appData').append(str);

// 				});

			},
			error : function(e) {
				 $("#loader").hide();
				 alert("Opps Something went wrong , Please refresh the page");
				console.log(e.message);
			}
		});

	}
		}

	function validate() {
		var journalId=document.getElementById("journalId").value;
		var issueid = document.getElementById("issueName").value;

		if(journalId=='Please Select'){
			alert("Journal cannot be blank.");
			return false;
		}
		
		if (issueid == '') {
			alert("Please create new issue than select a issue");
			return false;
		}
		else if((issueid == 'Please select journal first')){
			alert("Choice Issue name cannot be blank.");
			return false;
		}
		
		return true;
	}
	

	// Date Format year
	$(function() {
		  $('#volume_year').datepicker({
		    changeYear: true,
		    showButtonPanel: true,
		    dateFormat: 'yy',
		    onClose: function(dateText, inst) {
		      var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
		      $(this).datepicker('setDate', new Date(year, 1));
		    }
		  });

		  $("#volume_year").focus(function() {
		    $(".ui-datepicker-month").hide();
		    $(".ui-datepicker-calendar").hide();
		  });

		});
	
	function searchdata() {
		if (validate()) {
			document.getElementById("group").action = "getIssueData";
			document.getElementById("group").method = "POST";
			document.getElementById("group").submit();
		}
	}
	function addIssueMakeup() {
		document.getElementById("group").action = "addIssueMakeup";
		document.getElementById("group").method = "POST";
		document.getElementById("group").submit();
	}
	function articalDetails(val) {
		document.getElementById("article_id").value = val;
		document.getElementById("group").action = "startGroupTask";
		document.getElementById("group").method = "POST";
		document.getElementById("group").submit();
	}
</script>

<script>
	function allnumeric(inputtxt) {
		

		var numbers = /^[0-9]+$/;
		if (inputtxt.match(numbers)) {
			document.getElementById("issueId").style.borderColor = "white";
			document.getElementById("pageNo").style.borderColor = "white";
			document.getElementById("issueTitle").style.borderColor = "white";
			
			return true;
		} else {
			//document.getElementById("pageNo").value
			document.getElementById("pageNo").style.borderColor = "red";
			//  $("#errormsg").append("<small style='color:red;'>Please Enter a Number<small>");
			//alert('Please input numeric characters only');
			return false;
		}
	}

	$(function() {
		$("#showData").hide();
		function numberRows($t) {
			var c = 0;
			$t.find("tr").each(function(ind, el) {
				
				$(el).find("td:eq(0)").html(++c + ".");
			});
		}
		//.html("<input type='text'/>")

		$("#add-service-button")
				.click(
						function(e) {
							e.preventDefault();
							var issueid = document.getElementById("issueId").value
							var issueTitle = document
									.getElementById("issueTitle").value
							var pageno = document.getElementById("pageNo").value
							
							
							if (issueid == "") {
								document.getElementById("issueId").style.borderColor = "red";
								//$("#errormsg").append("Please Enter Issue Id  ");
								
							} else if (issueTitle == "") {	
								document.getElementById("issueTitle").style.borderColor = "red";
								alert("Please enter title");
							//	$("#errormsg").append("Please Enter Issue Title ");
								
							}

						/* 	else if (pageno == "") {
								document.getElementById("pageNo").style.borderColor = "red";
								alert("Please enter page number.");
							//	  $("#errormsg").append("<small style='color:red;'>Please Enter a Number<small>");
								

							} */

							else if (true) {
								//allnumeric(pageno)
								
								var $row = $("<tr>");
								$row.append($("<td class='counterCell'>"));
// 								$row.append($("<td>"));
								$row
										.append($("<td>").html(
												$("#issueId").val()));
								$row.append($("<td>").html(
										$("#issueTitle").val()));
								$row.append($("<td class=textEdit>").html($("#pageNo").val()));
								$row.append($("<td class=textEdit>").html($("#pageNo").val()));
								$row.append($("<td class=textEdit>").html($("#pageNo").val()));
								$row.append($("<td class='textEdit to'>").html(0));
								$row.append($("<td class='textEdit from'>").html(0));
								$row.append($("<td >").html(""));
								$row
										.append($("<td>")
												.html(
														"<a class='del-service' href='#' title='Click to remove this entry'>Remove</a>"));
								//$row.append($("<td>").html($("#attachmentCover").val()));
								$row.append($("<td>").html("<input type='file' name='files' id='files' multiple  required>")); 
								$row.appendTo($("#service-table"));
								/*  numberRows($("#service-table")); */
							
								$('#addIssueData').click();
							}

							else {
								//debugger;

								//alert("Please Enter a valid Number "); 		
							}

						});
		$("#form-entry form").submit(function(e) {
			e.preventDefault();
			$("#add-service-button").trigger("click");
		//	alert("from call");
		});
		$("#service-table")
				.on(
						"click",
						".del-service",
						function(e) {
							e.preventDefault();
							var $row = $(this).parent().parent();
							var retResult = confirm("Are you sure you wish to remove this entry?");
							if (retResult) {
								$row.remove();
								/*  numberRows($("#service-table")); */
							}
						});
	});
</script>
<script>
        $(document).ready(function () {

            var logAllEvents = true;


            //Basic editor with no navigation
       /*      var simpleEditor = new SimpleTableCellEditor("service-table", {navigation:false});
            simpleEditor.SetEditableClass("editMe");

            $('#service-table').on("cell:edited", function (event) {
                console.log(`'${event.oldValue}' changed to '${event.newValue}'`);
            }); */


            //Advanced editor
            var advancedEditor = new SimpleTableCellEditor("service-table");
            advancedEditor.SetEditableClass("numericEdit", { validation: $.isNumeric });
            advancedEditor.SetEditableClass("textEdit");
            $("#advancedToggle").on('click', function(e){
                advancedEditor.Toggle($(e.currentTarget).is(':checked'));
            })

            if (logAllEvents) {
                $('table').on("cell:onEditExit", function (event) {
                	var lastnumber = document.getElementById("enterPage").value;
        			var TableData = new Array();
        			
        			 //lastnumber = '${issSeqLast.to_page}'
        				if(lastnumber==null&&lastnumber==0){
        					lastnumber='${issSeqLast.to_page}';
        					}
        					var subTotal = lastnumber;//1;
        					var subTotal2=1;//0;
        				if(lastnumber!=""){
        					subTotal2=parseInt(lastnumber-1);
        					}
//         				if(parseInt(subTotal2) % 2 ==0){
//         					//subTotal2=parseInt(subTotal2)+1;	
//         				}else{			
//         				subTotal2=parseInt(subTotal2)+1;
//         			//	alert(subTotal2);
//         					}	
        			var $data =	$('#service-table tr ').each(function(row, tr) {
            			TableData[row] = {
            				//"artID" : $(tr).find('input:eq(0)').text(),
            				"articleId" : $(tr).find('td:eq(1)').text(),
            				//"articletitle" : $(tr).find('td:eq(2)').text(),
            				"pages" : $(tr).find('td:eq(3)').text(),
            				"from" : $(tr).find('td:eq(6)').text(),
            				"to" : $(tr).find('td:eq(7)').text(),
            			//	"articleDOI" : $(tr).find('td:eq(8)').text(),
            				//"atStatusCoverid" : $(tr).find('td:eq(9)').text(),
            			}//tableData[row]
            			var to = $(tr).find('td:eq(6)').text();
        				var from = $(tr).find('td:eq(7)').text();
        				var remove = $(tr).find('td:eq(9)').text();
        				var page =$(tr).find('td:eq(3)').text();
        				if(remove!="Remove"){
            			if (to!="") {
            				debugger;
        			//	alert("to :"+to);
        			//	alert("from :"+from);
        			//	alert("page :"+page);
        				
        				 subTotal2=parseInt(page)+parseInt(subTotal)-1;
        			//	alert(subTotal2);		
        				
        				$(tr).find('td:eq(6)').empty();
        				$(tr).find('td:eq(6)').append(""+subTotal+"");
        				$(tr).find('td:eq(7)').empty();
            			$(tr).find('td:eq(7)').append("" + subTotal2 + "");
        				}
            			subTotal=subTotal2+1;	
            		}});
            		TableData.shift(); 
	        	 	var Data = JSON.stringify(TableData);
                      		//alert(Data); 

                    console.log('onEditExited event');
                });
            }



        });
    </script>
<script>
$('#last_volume_number').on('input', function() {
    var cursor_pos = $(this).getCursorPosition()
    if(!(/^[0-9]*$/.test($(this).val())) ) {
        $(this).val($(this).attr('data-value'))
        $(this).setCursorPosition(cursor_pos - 1)
        return
    }
    $(this).attr('data-value', $(this).val())
})

 $('#last_issue_number').on('input', function() {
    var cursor_pos = $(this).getCursorPosition()
    if(!(/^[0-9]*$/.test($(this).val())) ) {
        $(this).val($(this).attr('data-value'))
        $(this).setCursorPosition(cursor_pos - 1)
        return
    }
    $(this).attr('data-value', $(this).val())
})

 $('#number_of_volume_per_year').on('input', function() {
    var cursor_pos = $(this).getCursorPosition()
    if(!(/^[0-9]*$/.test($(this).val())) ) {
        $(this).val($(this).attr('data-value'))
        $(this).setCursorPosition(cursor_pos - 1)
        return
    }
    $(this).attr('data-value', $(this).val())
})

 $('#number_of_issue_per_year').on('input', function() {
    var cursor_pos = $(this).getCursorPosition()
    if(!(/^[0-9]*$/.test($(this).val())) ) {
        $(this).val($(this).attr('data-value'))
        $(this).setCursorPosition(cursor_pos - 1)
        return
    }
    $(this).attr('data-value', $(this).val())
})

 $('#datepicker').on('input', function() {
    var cursor_pos = $(this).getCursorPosition()
    if(!(/^[0-9]*$/.test($(this).val())) ) {
        $(this).val($(this).attr('data-value'))
        $(this).setCursorPosition(cursor_pos - 1)
        return
    }
    $(this).attr('data-value', $(this).val())
})

$('#issueTitle').on('input', function() {
   var cursor_pos = $(this).getCursorPosition()
   if(!(/^[a-zA-Z0-9 _]*$/.test($(this).val())) ) {
    $(this).val($(this).attr('data-value'))
    $(this).setCursorPosition(cursor_pos - 1)
    return
  }
  $(this).attr('data-value', $(this).val())
})

/* $('#pageNo').on('input', function() {
    var cursor_pos = $(this).getCursorPosition()
    if(!(/^[0-9]*$/.test($(this).val())) ) {
        $(this).val($(this).attr('data-value'))
        $(this).setCursorPosition(cursor_pos - 1)
        return
    }
    $(this).attr('data-value', $(this).val())
}) */
$.fn.getCursorPosition = function() {
    if(this.length == 0) return -1
    return $(this).getSelectionStart()
}
$.fn.setCursorPosition = function(position) {
    if(this.lengh == 0) return this
    return $(this).setSelection(position, position)
}
$.fn.getSelectionStart = function(){
  if(this.lengh == 0) return -1
  input = this[0]
  var pos = input.value.length
  if (input.createTextRange) {
    var r = document.selection.createRange().duplicate()
    r.moveEnd('character', input.value.length)
    if (r.text == '') 
    pos = input.value.length
    pos = input.value.lastIndexOf(r.text)
  } else if(typeof(input.selectionStart)!="undefined")
  pos = input.selectionStart
  return pos
}
$.fn.setSelection = function(selectionStart, selectionEnd) {
  if(this.lengh == 0) return this
  input = this[0]
  if(input.createTextRange) {
    var range = input.createTextRange()
    range.collapse(true)
    range.moveEnd('character', selectionEnd)
    range.moveStart('character', selectionStart)
    range.select()
  }
  else if (input.setSelectionRange) {
    input.focus()
    input.setSelectionRange(selectionStart, selectionEnd)
  }
  return this
}  
</script>
<script>
function DownloadFile(val) {
	//alert(val);
	document.getElementById("fileURL").value =val;
	document.getElementById("fileupl").action = "dwonload_file";
	document.getElementById("fileupl").method = "GET";
	document.getElementById("fileupl").submit();
}
function downloadExcel() {
	debugger;
   // alert("Cryeae");
	
	document.getElementById("fileupl").action = "issueCreateExcel";
	document.getElementById("fileupl").method = "POST";
	document.getElementById("fileupl").submit();	
}

</script>

<script>
function sortTable(n) {
  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
  table = document.getElementById("service-table");
  switching = true;
  
  dir = "asc";
  
  while (switching) {
   
    switching = false;
    rows = table.rows;
    
    for (i = 1; i < (rows.length - 1); i++) {
     
      shouldSwitch = false;
     
      x = rows[i].getElementsByTagName("TD")[n];
      y = rows[i + 1].getElementsByTagName("TD")[n];
      
      if (dir == "asc") {
        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
          shouldSwitch = true;
          break;
        }
      } else if (dir == "desc") {
        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
          shouldSwitch = true;
          break;
        }
      }
    }
    if (shouldSwitch) {
    
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
     
      switchcount ++;
    } else {
      
      if (switchcount == 0 && dir == "asc") {
        dir = "desc";
        switching = true;
      }
    }
  }
}
</script>


<script>


$( ".oderingPage" ).click(function() {
	var lastnumber = document.getElementById("enterPage").value;
	var TableData = new Array();
	
	 //lastnumber = '${issSeqLast.to_page}'
		if(lastnumber==null&&lastnumber==0){
			lastnumber='${issSeqLast.to_page}';
			}
			var subTotal = lastnumber;//1;
			var subTotal2=1;//0;
		if(lastnumber!=""){
			subTotal2=parseInt(lastnumber-1);
			}
//			if(parseInt(subTotal2) % 2 ==0){
//				//subTotal2=parseInt(subTotal2)+1;	
//			}else{			
//			subTotal2=parseInt(subTotal2)+1;
//		//	alert(subTotal2);
//				}	
	var $data =	$('#service-table tr ').each(function(row, tr) {
		TableData[row] = {
			//"artID" : $(tr).find('input:eq(0)').text(),
			"articleId" : $(tr).find('td:eq(1)').text(),
			//"articletitle" : $(tr).find('td:eq(2)').text(),
			"pages" : $(tr).find('td:eq(3)').text(),
			"from" : $(tr).find('td:eq(6)').text(),
			"to" : $(tr).find('td:eq(7)').text(),
		//	"articleDOI" : $(tr).find('td:eq(8)').text(),
			//"atStatusCoverid" : $(tr).find('td:eq(9)').text(),
		}//tableData[row]
		var to = $(tr).find('td:eq(6)').text();
		var from = $(tr).find('td:eq(7)').text();
		var remove = $(tr).find('td:eq(9)').text();
		var page =$(tr).find('td:eq(3)').text();
		if(remove!="Remove"){
		if (to!="") {
			debugger;
	//	alert("to :"+to);
	//	alert("from :"+from);
	//	alert("page :"+page);
		
		 subTotal2=parseInt(page)+parseInt(subTotal)-1;
	//	alert(subTotal2);		
		
		$(tr).find('td:eq(6)').empty();
		$(tr).find('td:eq(6)').append(""+subTotal+"");
		$(tr).find('td:eq(7)').empty();
		$(tr).find('td:eq(7)').append("" + subTotal2 + "");
		}
		subTotal=subTotal2+1;	
	}});
	// TableData.shift();  // first row will be empty - so remove
 	var Data = JSON.stringify(TableData);
      		//alert(Data); 

    console.log('onEditExited event');
});

</script>

<script>
$("#GridViewPP").click(function(event) {
    //alert("click");
    this.onclick = null;
    event.preventDefault();
    event.returnValue = false;
    return false;
});

$('#GridViewPP').mouseover(function(){
    $(this).css({cursor: 'none'});
    $("#GridViewPP").css("cursor", true );
});
</script>