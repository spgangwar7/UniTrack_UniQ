l
<%@ include file="/WEB-INF/includes/include.jsp"%>

<div class="main_part_outer" id="content">
	<div class="d-flex flex-column w-100 h-100">
		<div class="container-fluid">
			<!--main_tittle-->
			<div class="row">
				<div class="col-md-12">
					<div class="main_tittle d-flex align-items-center">

						<span class="mr-2">Manage Email Details</span><span id="Date">Mon
							, 26 Aug 2019</span><span class="ml-auto"> <span><a
								href="${context}/getmailtemlate"
								class="btn btn-sm btn-outline-danger"><i
									class="fa fa-arrow-left"></i> Back To Email Templates</a></span>
					</div>
					<c:if test="${not empty message}">
						<div class="alert alert-${css} alert-dismissible" role="alert"
							id="message">
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<strong> ${message}</strong>
						</div>
					</c:if>
					<form name="emails" id="emails">
						<input type="hidden" name="id" id="id">
						<div class="row">
							<div class="col-md-12">
								<div class="content_box">
									<div class="box-body">

										<table class="table table-striped table-bordered m-0"
											id="emailTable">
											<thead class="table-head">
												<tr>
													<th>Action</th>
													<th>Email Name</th>
													<th>Email Subject</th>
													<th>Email Body</th>
													<th>Email Finish Subject</th>
													<th>Email Finish Body</th>
													<th>Email Reply Subject</th>
													<th>Email Reply Body</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="temp" items="${emailList}"
													varStatus="counter">
													<tr>
														<td><a href="#"
															onclick="editEmailTemplate(${temp.id});"
															data-toggle="tooltip" data-placement="top" title=""
															data-original-title="Edit Info"><i
																class="fa fa-edit edit-icon"></i></a> <%-- <a href="#"
															onclick="deleteEmail(${temp.id});" data-toggle="tooltip"
															data-placement="top" title=""
															data-original-title="Delete Info"><i
																class="fa fa fa-trash delete-icon"></i></a> --%></td>
														<td>${temp.emailTempName}</td>
														<td>${temp.toSubject}</td>
														<td>${temp.editorData}</td>
														<td>${temp.finishSubject}</td>
														<td>${temp.finishBody}</td>
														<td>${temp.replySubject}</td>
														<td>${temp.replyBody}</td>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!--main_tittle_End-->


			</div>
		</div>
	</div>
</div>