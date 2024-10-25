
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <link rel="icon" type="image/x-icon" href="https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Manchester_United_FC_crest.svg/1200px-Manchester_United_FC_crest.svg.png"/>
        <style>
            .mainDiv {
                display: flex;
                min-height: 100%;
                align-items: center;
                justify-content: center;
                background-color: #f9f9f9;
                font-family: 'Open Sans', sans-serif;
            }
            .cardStyle {
                width: 500px;
                border-color: white;
                background: #fff;
                padding: 36px 0;
                border-radius: 4px;
                margin: 30px 0;
                box-shadow: 0px 0 2px 0 rgba(0,0,0,0.25);
            }
            #signupLogo {
                max-height: 100px;
                margin: auto;
                display: flex;
                flex-direction: column;
            }
            .formTitle{
                font-weight: 600;
                margin-top: 20px;
                color: #2F2D3B;
                text-align: center;
            }
            .inputLabel {
                font-size: 12px;
                color: #555;
                margin-bottom: 6px;
                margin-top: 24px;
            }
            .inputDiv {
                width: 70%;
                display: flex;
                flex-direction: column;
                margin: auto;
            }
            input {
                height: 40px;
                font-size: 16px;
                border-radius: 4px;
                border: none;
                border: solid 1px #ccc;
                padding: 0 11px;
            }
            input:disabled {
                cursor: not-allowed;
                border: solid 1px #eee;
            }
            .buttonWrapper {
                margin-top: 40px;
            }
            .submitButton {
                width: 70%;
                height: 40px;
                margin: auto;
                display: block;
                color: #fff;
                background-color: #065492;
                border-color: #065492;
                text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.12);
                box-shadow: 0 2px 0 rgba(0, 0, 0, 0.035);
                border-radius: 4px;
                font-size: 14px;
                cursor: pointer;
            }
            .submitButton:disabled,
            button[disabled] {
                border: 1px solid #cccccc;
                background-color: #cccccc;
                color: #666666;
            }

            #loader {
                position: absolute;
                z-index: 1;
                margin: -2px 0 0 10px;
                border: 4px solid #f3f3f3;
                border-radius: 50%;
                border-top: 4px solid #666666;
                width: 14px;
                height: 14px;
                -webkit-animation: spin 2s linear infinite;
                animation: spin 2s linear infinite;
            }

            @keyframes spin {
                0% {
                    transform: rotate(0deg);
                }
                100% {
                    transform: rotate(360deg);
                }
            }
        </style>
    </head>
    <body>
        <div class="mainDiv">
            <div class="cardStyle">
                <form action="changepassword" name="signupForm" method="post">
                    <input type="hidden" value="${sessionScope.account.username}" name="username"/>
                    <input type="hidden" value="${sessionScope.account.password}" name="curPass"/>
                    <img src="" id="signupLogo"/>

                    <h2 class="formTitle">
                        Change your Password
                    </h2>
                    <div class="inputDiv">
                        <label class="inputLabel">Your Username</label>
                        <input readonly value="${sessionScope.account.username}">
                    </div>
                    <div class="inputDiv">
                        <label class="inputLabel" for="password">Old Password</label>
                        <input type="password" id="password" name="oldPassword" required>
                    </div>
                    <div class="inputDiv">
                        <label class="inputLabel" for="password">New Password</label>
                        <input type="password" id="password" name="newPassword" required>
                    </div>

                    <div class="inputDiv">
                        <label class="inputLabel" for="confirmPassword">Confirm Password</label>
                        <input type="password" id="confirmPassword" name="confirmPassword">
                    </div>

                    <div class="buttonWrapper">
                        <button type="submit" id="submitButton" class="submitButton pure-button pure-button-primary">
                            <span>SAVE</span>
                        </button>
                    </div>
                    <div class="text-center p-t-12">
                        <span class="txt1">
                            <ul style="color: red; text-align: center;">
                                <c:forEach var="error" items="${errors}">
                                    <li style="color: red; text-align: center; width: 400px" class="text-danger">${error}</li>
                                    </c:forEach>
                            </ul>
                        </span>
                    </div>

                </form>
                <div class="buttonWrapper">
                    <a href="home"><button  id="submitButton" class="submitButton pure-button pure-button-primary">
                            <span>RETURN HOME</span>
                        </button></a>
                </div>
            </div>
        </div>
    </body>

</html>
