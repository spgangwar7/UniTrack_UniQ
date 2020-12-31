<html>
<head>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

</head>
<body>

	<div class="container">

		<div class="row">

			<div class="col-lg-6">

				<div class="card">

					<div class="card-header">Basic editable table</div>

					<div class="card-body">

						<table id="simpleEditableTable"
							class="table table-dark table-striped" style="width: 100%;">
							<thead>
								<tr>
									<th>Editable cell is beneath</th>
									<th>Some column header</th>
									<th>Another column header</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="editMe">Editable text</td>
									<td>Uneditable text</td>
									<td>Uneditable text</td>
								</tr>
								<tr>
									<td class="editMe">Editable text</td>
									<td>Uneditable text</td>
									<td>Uneditable text</td>
								</tr>
							</tbody>
						</table>

					</div>

					<div class="card-footer bg-transparent border-success">
						<div class="form-check">
							<input type="checkbox" class="form-check-input" id="basicToggle"
								checked> <label class="form-check-label"
								for="basicToggle">Toggled</label>
						</div>
					</div>


				</div>


			</div>

			<div class="col-lg-6">

				<div class="card">

					<div class="card-header">Advanced editable table</div>

					<div class="card-body">

						<table id="advancedEditableTable"
							class="table table-dark table-striped" style="width: 100%;">
							<thead>
								<tr>
									<th>Numeric only</th>
									<th>Numeric x 100</th>
									<th>Custom renderer</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="numericEdit">41</td>
									<td class="numericTimes100">5</td>
									<td class="customRenderer">Pain au chocolat</td>
								</tr>
								<tr>
									<td class="numericEdit">37</td>
									<td class="numericTimes100">6</td>
									<td class="customRenderer">Pain au chocolat</td>
								</tr>
							</tbody>
						</table>

					</div>

					<div class="card-footer bg-transparent border-success">
						<div class="form-check">
							<input type="checkbox" class="form-check-input"
								id="advancedToggle" checked> <label
								class="form-check-label" for="advancedToggle">Toggled</label>
						</div>
					</div>

				</div>


			</div>

		</div>



	</div>


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="resources/static/js/SimpleTableCellEditor.es6.min.js"></script>

	<script>
        $(document).ready(function () {

            var logAllEvents = true;


            //Basic editor with no navigation
            var simpleEditor = new SimpleTableCellEditor("simpleEditableTable", {navigation:false});
            simpleEditor.SetEditableClass("editMe");

            $('#simpleEditableTable').on("cell:edited", function (event) {
                console.log(`'${event.oldValue}' changed to '${event.newValue}'`);
            });


            //Advanced editor
            var advancedEditor = new SimpleTableCellEditor("advancedEditableTable");
            advancedEditor.SetEditableClass("numericEdit", { validation: $.isNumeric });
            advancedEditor.SetEditableClass("numericTimes100", { validation: $.isNumeric, formatter: (val) => { return val * 100; } });
            advancedEditor.SetEditableClass("customRenderer", {
                internals: {
                    renderEditor: (elem, oldVal) => {
                        $(elem).html(`<select>
                                        <option>Pain au chocolat</option>
                                        <option>Chocolatine</option>
                                    </select>`);

                        $("select option").filter(function () {
                            return $(this).val() == oldVal;
                        }).prop('selected', true);
                    
                    },
                    extractEditorValue: (elem) => { return $(elem).find('select').val(); },

                }
            });

            //Toggling checkboxes
            $("#basicToggle").on('click', function(e){
                simpleEditor.Toggle($(e.currentTarget).is(':checked'));
            })

            $("#advancedToggle").on('click', function(e){
                advancedEditor.Toggle($(e.currentTarget).is(':checked'));
            })



            if (logAllEvents) {

                $('table').on("cell:onEditEnter", function (event) {
                    console.log('onEditEnter event');
                });

                $('table').on("cell:onEditEntered", function (event) {
                    console.log('onEditEntered event');
                });

                $('table').on("cell:onEditExit", function (event) {
                    console.log('onEditExit event');
                });

                $('table').on("cell:onEditExited", function (event) {
                    console.log('onEditExited event');
                });
            }



        });
    </script>

</body>
</html>