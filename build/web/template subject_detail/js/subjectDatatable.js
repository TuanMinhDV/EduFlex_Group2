$(document).ready(function () {
    $.ajax({
        url: '/holalearn/managesubject_1',
        type: 'GET',
        dataType: 'json',
        success: function (response) {
            var datatableInstance = $("#subjecttable").DataTable({
                data: response,
                scrollY: 500,
                columns: [
                    {data: 'subject_id'},
                    {data: 'subject_name'},
                    {data: 'description',
                        sortable: false,
                        searchable: false,
                        render: function (description, type) {
                            if (type === 'display' && description.length > 50) { // Kiểm tra nếu description dài hơn 50 ký tự
                                return '<p class="description-truncated" data-bind="' + description + '">' + description.substr(0, 50) + '...</p>';
                            } else {
                                return description;
                            }
                        }
                    },
                    {data: 'price',
                        render: function (price) {
                            return "$" + price;
                        }
                    },
                    {data: 'discount'},
                    {data: 'sold'},
                    {data: 'created_date'},
                    {data: 'updated_date'},
                    {data: 'image',
                        sortable: false,
                        searchable: false,
                        render: function (image) {
                            return  '<img src="data:image/jpeg;base64,' + image + '" alt="Image" style="width: 200px; height: auto; border-radius: 5px"/>';

                        }
                    },
                    {
                        // Thêm cột action
                        data: null,
                        sortable: false,
                        searchable: false,
                        render: function (data, type, row) {
                            return '<a href="#editSubject" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>' +
                                    '<a href="#deleteSubject" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>';
                        }
                    }
                ]
            });

            $('.showHideColumn').on('click', function () {
                var tableColumn = datatableInstance.column($(this).attr('data-columnindex'));
                tableColumn.visible(!tableColumn.visible());
            });

            $('.description-truncated').on('click', function () {
                var description = $(this).attr('data-bind');
                $('#descriptionContent').html(description);
                $('#descriptionModal').modal('show');
            });


            $('.update_subject').on('submit', function (event) {
                event.preventDefault();
                alert();
            });
        }
    });
});


