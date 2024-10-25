

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="model.Account" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>OCMS - Your profile</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"
                integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
        crossorigin="anonymous"></script>   
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">

        <style type="text/css">
            body{
                background: #f5f5f5;
                margin-top:20px;
            }
            #image_profile{
                cursor: pointer;
            }
            #overlay {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.7);
                z-index: 9999;
            }
            #imageModal {
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                z-index: 10000;
            }
            .error {
                color: red;
                display: none;
                font-size: 12px;
            }

            .ui-w-80 {
                width: 80px !important;
                height: auto;
            }

            .ui-w-140 {
                width: 140px !important;
                height: auto;
            }

            .btn-default {
                border-color: rgba(24,28,33,0.1);
                background: rgba(0,0,0,0);
                color: #4E5155;
            }

            label.btn {
                margin-bottom: 0;
            }

            .btn-outline-primary {
                border-color: #26B4FF;
                background: transparent;
                color: #26B4FF;
            }

            .btn {
                cursor: pointer;
            }

            .text-light {
                color: #babbbc !important;
            }

            .btn-facebook {
                border-color: rgba(0,0,0,0);
                background: #3B5998;
                color: #fff;
            }

            .btn-instagram {
                border-color: rgba(0,0,0,0);
                background: #000;
                color: #fff;
            }

            .card {
                background-clip: padding-box;
                box-shadow: 0 1px 4px rgba(24,28,33,0.012);
            }

            .row-bordered {
                overflow: hidden;
            }

            .account-settings-fileinput {
                position: absolute;
                visibility: hidden;
                width: 1px;
                height: 1px;
                opacity: 0;
            }
            .account-settings-links .list-group-item.active {
                font-weight: bold !important;
            }
            html:not(.dark-style) .account-settings-links .list-group-item.active {
                background: transparent !important;
            }
            .account-settings-multiselect ~ .select2-container {
                width: 100% !important;
            }
            .light-style .account-settings-links .list-group-item {
                padding: 0.85rem 1.5rem;
                border-color: rgba(24, 28, 33, 0.03) !important;
            }
            .light-style .account-settings-links .list-group-item.active {
                color: #4e5155 !important;
            }
            .material-style .account-settings-links .list-group-item {
                padding: 0.85rem 1.5rem;
                border-color: rgba(24, 28, 33, 0.03) !important;
            }
            .material-style .account-settings-links .list-group-item.active {
                color: #4e5155 !important;
            }
            .dark-style .account-settings-links .list-group-item {
                padding: 0.85rem 1.5rem;
                border-color: rgba(255, 255, 255, 0.03) !important;
            }
            .dark-style .account-settings-links .list-group-item.active {
                color: #fff !important;
            }
            .light-style .account-settings-links .list-group-item.active {
                color: #4E5155 !important;
            }
            .light-style .account-settings-links .list-group-item {
                padding: 0.85rem 1.5rem;
                border-color: rgba(24,28,33,0.03) !important;
            }



        </style>
    </head>

    <body>
        <div class="container light-style flex-grow-1 container-p-y">
            <h4 class="font-weight-bold py-2 mb-2">
                Your Profile
            </h4>
            <div class="card overflow-hidden">
                <div class="row no-gutters row-bordered row-border-light">
                    <div class="col-md-2 pt-0">
                        <div class="list-group list-group-flush account-settings-links">
                            <a class="list-group-item list-group-item-action active" data-toggle="list" href="#account-general">General</a>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="tab-content">
                            <div class="tab-pane fade active show" id="account-general">
                                <form action="profile" id="profileForm" method="post"  enctype="multipart/form-data">
                                    <div class="card-body media align-items-center">
                                        <div style="height: 140px; width: 140px; overflow: hidden">
                                            <img src="" alt="Image" class="d-block ui-w-140 rounded" id="image_profile" style="width: 100%; height: 100%; object-fit: cover"/>
                                        </div>
                                        <div class="media-body ml-4" id="profile_div" style="display: none">
                                            <label class="btn btn-outline-primary">
                                                Change avatar
                                                <input type="file" name="image" id="changeProfile_button" class="account-settings-fileinput">
                                            </label> &nbsp;
                                        </div>
                                    </div>
                                    <hr class="border-light m-0">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="row">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label class="form-label">Username</label>
                                                        <input class="form-control" type="text" name="username" value="" readonly id="username">
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label class="form-label">E-mail</label>
                                                        <input class="form-control email" type="email" name="email" value="" readonly id="email"> 
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label class="form-label">Full name</label>
                                                        <input class="form-control" type="text" name="fullname" value="" id="fullname" disabled="disabled">
                                                        <span id="fullnameError" class="error"></span><br>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label class="form-label">Birthday</label>
                                                        <input class="form-control" type="date" name="birthday" placeholder="" value="" id="birthdate" disabled="disabled">
                                                        <span id="birthdateError" class="error"></span><br>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label class="form-label">Phone</label>
                                                        <input class="form-control" type="number" name="phone" disabled="disabled" value="" id="phone">
                                                        <span id="phoneError" class="error"></span><br>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="text-center mt-2 mb-4">
                                                <button type="button" class="btn btn-default md-btn-flat text-lg-left" id="reset_profile" style="float: left; display: none">Reset</button>
                                                <input type="submit" id="save_profile" class="btn btn-primary text-lg-left" style="float: left; display: none" value="Save">&nbsp;
                                                <input type="button" id="update_profile" class="btn btn-primary text-lg-left" style="float: left" value="Update">&nbsp;
                                                <a href="home" class="btn btn-default text-lg-right" style="float: right;">Back to Homepage</a>
                                            </div>
                                        </div>
                                    </div>
                                </form> 
                                <!--Thieu dong the form-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="overlay"></div>
        <div id="imageModal">
            <img src="" id="full_avatar" alt="Ảnh lớn">
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
            <%
             Account acc = (Account) session.getAttribute("account");
             String jsonProfile = new Gson().toJson(acc);
            %>
                var profile1 = '<%= jsonProfile%>';
                profile1 = JSON.parse(profile1);
                $('img#image_profile').attr('src', 'data:image/jpeg;base64,' + profile1.avatar);
                $('input[id="username"]').val(profile1.username);
                $('input[id="email"]').val(profile1.email);
                $('input[id="fullname"]').val(profile1.fullname);
                $('input[id="birthdate"]').val(profile1.dob);
                $('input[id="phone"]').val(profile1.phone);


                function validateBirthdate(birthdate) {
                    var present = new Date();
                    return (present.getFullYear() - birthdate.getFullYear()) >= 5;
                }

                function validatePhoneNumber(phoneNumber) {
                    var phoneNumberPattern = /^\d{1,11}$/;
                    return phoneNumberPattern.test(phoneNumber);
                }

                function validateFullname(fullname) {
                    return (fullname !== null && fullname.trim() !== '');
                }

                function validateInput(inputElement, errorElement, isValid, errorMessage) {
                    if (isValid) {
                        inputElement.css('border-color', '');
                        errorElement.text('').hide();
                    } else {
                        inputElement.css('border-color', 'red');
                        errorElement.text(errorMessage).show();
                    }
                }

                function validateForm() {
                    var birthdate = new Date($('#birthdate').val());
                    var phoneNumber = $('#phone').val();
                    var fullname = $('#fullname').val();

                    var isBirthdateValid = validateBirthdate(birthdate);
                    var isPhoneNumberValid = validatePhoneNumber(phoneNumber);
                    var isFullnameValid = validateFullname(fullname);

                    validateInput($('#birthdate'), $('#birthdateError'), isBirthdateValid, 'Your birthday must be greater or equal 5.');
                    validateInput($('#phone'), $('#phoneError'), isPhoneNumberValid, 'Your phone number must not exceed 11 digits.');
                    validateInput($('#fullname'), $('#fullnameError'), isFullnameValid, 'Your full name can\'t be empty.');

                    $('#save_profile').prop('disabled', !(isBirthdateValid && isPhoneNumberValid && isFullnameValid));
                }

                $('#birthdate, #phone, #fullname').on('input', function () {
                    validateForm();
                });

                $('#reset_profile').click(function () {
                    $('#birthdate, #phone, #fullname').css('border-color', '');
                    $('#birthdateError, #phoneError, #fullnameError').text('').hide();
                    $('#save_profile').prop('disabled', false);
                    $('img#image_profile').attr('src', 'data:image/jpeg;base64,' + profile1.avatar);
                    $('input[id="fullname"]').val(profile1.fullname);
                    $('input[id="birthdate"]').val(profile1.dob);
                    $('input[id="phone"]').val(profile1.phone);
                });

                $('#update_profile').click(function () {
                    $('#save_profile, #reset_profile, #profile_div').show();
                    $('#update_profile').hide();
                    $('#fullname, #birthdate, #phone').removeAttr('disabled');

                });

                $('#save_profile').click(function (e) {
                    e.preventDefault();
                    var formData = new FormData($('#profileForm')[0]);

                    $.ajax({
                        url: '/EduFlex_Demo3_1_1/profile',
                        type: 'POST',
                        dataType: 'json',
                        data: formData,
                        processData: false,
                        contentType: false,
                        success: function (response) {
                            var profile = JSON.parse(response.profile);
                            profile1 = JSON.parse(response.profile);
                            //profile = JSON.parse(response.profile);
                            var status = JSON.parse(response.status);
                            //Update
                            $('img#image_profile').attr('src', 'data:image/jpeg;base64,' + profile.avatar);
                            $('input[id="username"]').val(profile.username);
                            $('input[id="email"]').val(profile.email);
                            $('input[id="fullname"]').val(profile.fullname);
                            $('input[id="birthdate"]').val(profile.dob);
                            $('input[id="phone"]').val(profile.phone);
                            //Hien Thi ??
                            //profile1 = profile;
                            $('#save_profile, #reset_profile, #profile_div').hide();
                            $('#update_profile').show();
                            $('#fullname, #birthdate, #phone').attr('disabled', 'disabled');
                            if (status === 'success') {
                                showSuccessMessage("Cap nhat thanh cong", "Thanh cong");
                            } else if (status === 'failed') {
                                showErrorMessage("Cap nhat that bai", "That bai");
                            }
                        }
                    });
                });

                $('#changeProfile_button').on('change', function () {
                    let reader = new FileReader();

                    // Lấy danh sách các tệp đã chọn
                    let files = $('#changeProfile_button').prop('files');

                    if (files.length > 0) {
                        // Đọc tệp đầu tiên trong danh sách
                        reader.readAsDataURL(files[0]);

                        // Xử lý sự kiện khi tệp đã được đọc
                        reader.onload = () => {
                            $('#image_profile').attr('src', reader.result);
                        };

                        $('#image_profile').click(function () {
                            $('#full_avatar').attr('src', reader.result);
                            $("#overlay").show();
                            $("#imageModal").show();
                        });

                    }
                });

                $('#image_profile').click(function () {
                    $('#full_avatar').attr('src', 'data:image/jpeg;base64,' + profile1.avatar);
                    $("#overlay").show();
                    $("#imageModal").show();
                });

                $("#overlay").click(function () {
                    $("#overlay").hide();
                    $("#imageModal").hide();
                });



                function showSuccessMessage(message, title) {
                    toastr.success(message, title, {showMethod: 'slideDown',
                        hideMethod: 'slideUp'});
                }

                function showErrorMessage(message, title) {
                    toastr.error(message, title, {showMethod: 'slideDown',
                        hideMethod: 'slideUp'});
                }

                function showWarningMessage(message, title) {
                    toastr.warning(message, title, {showMethod: 'slideDown',
                        hideMethod: 'slideUp'});
                }

                toastr.options = {
                    preventDuplicates: false,
                    closeButton: true, // Hiển thị nút đóng thông báo
                    progressBar: true, // Hiển thị thanh tiến trình
                    positionClass: "toast-top-right", // Vị trí hiển thị thông báo
                    timeOut: 2500 // Thời gian tự động ẩn thông báo (2.5 giây)
                };

            });
        </script>
    </body>
</html>
