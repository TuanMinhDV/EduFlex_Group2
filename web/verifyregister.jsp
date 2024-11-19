

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>OTP Verification</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.16/dist/tailwind.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/remixicon@14.0.0/fonts/remixicon.css">
    </head>
    <body class="bg-blue-500 h-screen py-20 px-3">
        <div class="container mx-auto">
            <div class="max-w-sm mx-auto md:max-w-lg">
                <div class="w-full">
                    <div class="bg-white h-70 py-3 rounded text-center">
                        <h1 class="text-2xl font-bold">OTP Verification</h1>
                        
                        <div class="flex flex-col mt-4">
                            <span>Enter the OTP you received at</span>
                            <span class="font-bold">your email</span>
                        </div>
                        <form action="verifyregister" method="post">
                            <!--data from register-->
                            <input type="hidden" name="username" value="${username}">
                            <input type="hidden" name="password" value="${password}">
                            <input type="hidden" name="fullname" value="${fullname}">
                            <input type="hidden" name="dob" value="${dob}">
                            <input type="hidden" name="email" value="${email}">
                            <input type="hidden" name="address" value="${address}">
                            <input type="hidden" name="otp" value="${otp}">
                            <input type="hidden" id="count" name="count" value="${count}"> 
                            <div name="otp" class="flex flex-row justify-center text-center px-2 mt-5">
                                <input class="m-2 border h-10 w-70 text-center form-control rounded" type="text" name="otpInput" maxlength="6" /> 
                            </div>
                            <input type="submit" class="btn-success" value="VERIFY"/>
                            <p><h2 class="text-danger">${mess}</h2></p>
                            <div class="flex justify-between text-center mt-5">
                                <a href="verifyregister" class="flex items-center text-silver hover:text-blue-900 cursor-pointer"><i class="ri-arrow-left-line text-xl mr-1"></i><span class="font-bold">Back</span></a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
