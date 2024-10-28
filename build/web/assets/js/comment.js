
(function ($) {
    $.fn.zComment = function (options) {
        var defaults = {
            listComment: "#listcomment",
            itemsPerPage: 5,
            totalcmt: 0
        };
        options = $.extend(defaults, options);
        var listCom = [];
        var list = $(options.listComment);
        var lesson_id = $("#lesson_id").val();
        var account_id_raw = $("#account_id").val();
        var currentPage = 1;
        var showingAll = false;

        init();

        function init() {
            getComment();
            loadComment();
            $("#showmore").click(function () {
                if (showingAll) {
                    // Nếu đang hiển thị tất cả, thì quay trở lại hiển thị số lượng items ban đầu
                    currentPage = 1;
                    showingAll = false;
                } else {
                    currentPage++;
                }
                loadComment();
            });

            $("#showless").click(function () {
                if (currentPage > 1) {
                    currentPage--;
                }
                loadComment();
            });
        }


        // Hàm kiểm tra nội dung vi phạm bằng Google Perspective
        function checkCommentViolation(commentText) {
            var lowerCaseComment = commentText.toLowerCase();

            // Danh sách các từ khoá bị cấm
            var blacklistedWords = ["fucked", "spam", "racism"];

            // Kiểm tra xem commentText có chứa từ khoá cấm không
            for (var i = 0; i < blacklistedWords.length; i++) {
                if (lowerCaseComment.includes(blacklistedWords[i])) {
                    return false; // Comment vi phạm
                }
            }

            return true;
        }
        $(document).ready(function () {
            $("#add-comment-form").click(function (e) {
                e.preventDefault();
                var commentText = $("#lesson_comment").val();
                if (checkCommentViolation(commentText)) {
                    if (commentText !== "") {
                        $.ajax({
                            url: "/holalearn/comment",
                            type: "POST",
                            data: {comment: commentText, lid: lesson_id, action: "add"}
                        }).done(function (response) {
                            listCom = JSON.parse(response.list);
                            $("#lesson_comment").val("");
                            getComment();
                            loadComment();
                        });
                    }
                } else {
                    showErrorMessage("Your comment is violated or spam", "Error");
                }


            });
        });
        function showErrorMessage(message, title) {
            toastr.error(message, title, {showMethod: 'slideDown', hideMethod: 'slideUp'});

        }
        function showSuccessMessage(message, title) {
            toastr.success(message, title, {showMethod: 'slideDown', hideMethod: 'slideUp'});

        }
        function showWarningMessage(message, title) {
            toastr.warning(message, title, {showMethod: 'slideDown', hideMethod: 'slideUp'});

        }
        toastr.options = {
            preventDuplicates: true,
            closeButton: true, // Hiển thị nút đóng thông báo
            progressBar: true, // Hiển thị thanh tiến trình
            positionClass: "toast-top-right", // Vị trí hiển thị thông báo
            timeOut: 2500 // Thời gian tự động ẩn thông báo (2.5 giây)

        };

        list.on("click", ".edit-comment-button", function (e) {
            e.preventDefault();
            // Tìm comment cụ thể mà người dùng muốn chỉnh sửa
            var commentElement = $(this).closest(".comment");
            var commentTextElement = commentElement.find(".comment-text");
            var editInput = commentElement.find(".edit-comment-input");
            var commentId = commentElement.data("comment-id");
            // Ẩn phần tử hiển thị văn bản và hiển thị trường input
            commentTextElement.hide();
            editInput.show();

            // Lắng nghe sự kiện khi người dùng kết thúc chỉnh sửa (ví dụ: nhấn Enter)
            editInput.on("blur keydown", function (e) {
                if (e.type === "blur" || (e.type === "keydown" && e.key === "Enter")) {
                    // Lấy ID của comment cần chỉnh sửa
                    // Lưu nội dung chỉnh sửa
                    var editedCommentText = $(this).val();
                    console.log("Editing comment with ID: " + commentId + editedCommentText);
                    // Gửi yêu cầu chỉnh sửa bằng AJAX
                    if (checkCommentViolation(editedCommentText)) {
                        $.ajax({
                            url: "/holalearn/comment",
                            type: "POST",
                            data: {commentedited: editedCommentText, lid: lesson_id, cmtid: commentId, action: "edit"}
                        }).done(function (response) {
                            listCom = JSON.parse(response.list);
                            getComment();
                            loadComment();
                            if (listCom !== null) {
                                showSuccessMessage("Comment edited successfully", "Success");
                            } else {
                                showErrorMessage("Failed to edite the comment", "Error");
                            }
                        });
                    } else {
                        showErrorMessage("Your comment is violated or spam", "Error");
                    }

                    // Hiển thị lại phần tử hiển thị văn bản và ẩn trường input
                    commentTextElement.show();
                    editInput.hide();
                    var commentPosition = commentElement.offset().top;
                    $(window).scrollTop(commentPosition);
                    console.log(commentPosition);
                }
            });
        });
        list.on("click", ".delete-comment-button", function (e) {
            e.preventDefault();
            var commentElement = $(this).closest(".comment");
            var commentId = commentElement.data("comment-id");

            // Hiển thị hộp thoại xác nhận
            var confirmDelete = window.confirm("Are you sure you want to delete this comment?");

            if (confirmDelete) {
                // Gửi yêu cầu xóa bằng AJAX
                $.ajax({
                    url: "/holalearn/comment",
                    type: "POST",
                    data: {lid: lesson_id, cmtid: commentId, action: "delete"}
                }).done(function (response) {
                    listCom = JSON.parse(response.list);
                    getComment();
                    loadComment();
                    // Hiển thị thông báo xóa thành công hoặc hiển thị lỗi nếu có
                    if (listCom !== null) {
                        showSuccessMessage("Comment deleted successfully", "Success");
                    } else {
                        showErrorMessage("Failed to delete the comment", "Error");
                    }
                });
            }
        });

        list.on("click", ".report-comment-button", function (e) {
            e.preventDefault();
            var commentElement = $(this).closest(".comment");
            var commentId = commentElement.data("comment-id");
            var accountId = commentElement.data("account-id");
            console.log(commentId);
            console.log(accountId);
            $("#reportPopup").modal('show');
            $('#cancel-button').click(function () {
                $('#reportPopup').modal('hide');
            });
            $('#close-button').click(function () {
                $('#reportPopup').modal('hide');
            });
            $("#submitReport").on("click", function () {
                // Kiểm tra trong cơ sở dữ liệu xem người dùng đã báo cáo bình luận này chưa
                var selectedReason = $("input[name='reportReason']:checked").val();
                $.ajax({
                    url: "/holalearn/comment",
                    type: "POST",
                    data: {lid: lesson_id, cmtid: commentId, action: "checkreport"}
                }).done(function (response) {
                    if (response.alreadyReported) {
                        showWarningMessage("Bạn đã báo cáo bình luận này trước đó.", "Lỗi");
                        getComment();
                        loadComment();
                    } else {
                        // Tiếp tục xử lý báo cáo
                        $.ajax({
                            url: "/holalearn/comment",
                            type: "POST",
                            data: {reason: selectedReason, lid: lesson_id, accid: accountId, cmtid: commentId, action: "report"}
                        }).done(function (response) {
                            // Xử lý kết quả báo cáo
                            listCom = JSON.parse(response.list);
                            getComment();
                            loadComment();
                            if (listCom !== null) {
                                showSuccessMessage("Báo cáo bình luận thành công", "Thành công");
                            } else {
                                showErrorMessage("Không thể báo cáo bình luận", "Lỗi");
                            }
                        });
                    }
                });
                $("#reportPopup").modal('hide');
            });
        });
        
        function loadComment() {
            var comment = "";
            var startIndex = 0;
            var endIndex;

            if (showingAll) {
                endIndex = listCom.length;
            } else {
                endIndex = currentPage * options.itemsPerPage;
            }

            if (endIndex > listCom.length) {
                endIndex = listCom.length;
            }

            if (listCom.length !== 0) {
                for (var i = startIndex; i < endIndex; i++) {
                    var c = listCom[i];
                    var account_id = parseInt(account_id_raw);
                    if (c.status === 1) {
                        comment += `<div class="media-body comment" data-account-id="${c.account_id}" data-comment-id="${c.comment_id}">
                        <div class="mar-btm">
                            <img class="rounded-circle shadow-1-strong me-3"
                                src="data:image/jpeg;base64,${c.avatar}" alt="avatar" width="60"
                                height="60" />
                            <span class="btn-link text-semibold media-heading box-inline"> ${c.fullname}.&nbsp;&nbsp; <i class="fa fa-mobile fa-lg"></i> ${c.role_name} - ${c.comment_date}</span>
                        </div>
                        <p class="comment-text">${c.comment}</p>
                        <input class="edit-comment-input" type="text" value="${c.comment}" placeholder="Edit your comment" style="display: none; width: 100%; max-width: 100%;" />
                        <div class="pad-ver">
                        <div class="btn-group">`;
                        if (c.account_id === account_id) {
                            comment += `<a class="btn btn-sm btn-default btn-hover-success edit-comment-button" data-comment-id="${c.comment_id}" href="#">
                                    <i class="fa fa-pencil"></i></a>
                                    <a class="btn btn-sm btn-default btn-hover-success delete-comment-button" data-comment-id="${c.comment_id}" href="#">
                                    <i class="fa fa-trash"></i></a>`;
                        }
                        if (c.account_id !== account_id) {
                            comment += `<a class="btn btn-sm btn-default btn-hover-success report-comment-button"
                                        data-comment-id="${c.comment_id}"
                                        href="#">
                                        <i class="fa fa-warning"></i>
                                        </a>    `;
                        }
                        comment += `</div>
                            <a class="btn btn-sm btn-default btn-hover-primary" href="#">Comment</a>
                        </div>
                        <hr>
                    </div>`;
                    }
                }
                list.html(comment);

                // Ẩn/hiện nút "Show more" và "Show less" dựa trên trạng thái hiển thị
                if (showingAll || endIndex >= listCom.length) {
                    $("#showmore").hide();
                } else {
                    $("#showmore").show();
                }
                if (showingAll || currentPage === 1) {
                    $("#showless").hide();
                } else {
                    $("#showless").show();
                }
            }
        }

        
        function getComment() {
            listCom = [];
            var data = {
                lid: lesson_id
            };
            $.ajax({
                async: false,
                url: "/holalearn/comment",
                type: "GET",
                dataType: "json",
                data: data,
                success: function (response) {
                    options.totalcmt = response.totalofcmt;
                    listCom = JSON.parse(response.list);
                }
            });
        }
    }
    ;
})(jQuery);

$(document).ready(function (e) {
    var obj = {};
    $("#content").zComment(obj);
});
