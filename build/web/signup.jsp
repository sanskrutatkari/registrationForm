<%-- 
    Document   : signup
    Created on : Apr 16, 2022, 9:40:08 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </head>
    <body style="background: url(img/background.jpg); background-size: cover; background-attachment: fixed;">
        <div class="container">
            <div class="row">
                <div class="col m6 offset-m3">
                    <div class="card">
                        <div class="card-content">
                            <h4 style="margin: 0px;" class="center-align">Register here..</h4>
                            <h5 id="message" class="center-align"></h5>
                            <div class="form center-align">
                                <form action="register" method="post" id="myform">
                                    <input type="text" name="user_name" placeholder="Enter your name">
                                    <input type="email" name="user_email" placeholder="Enter your email">
                                    <input type="password" name="user_password" placeholder="Enter your password">
                                    <button class="btn waves-effect waves-light #64b5f6 blue lighten-2" type="submit">Submit</button>

                                </form>
                            </div>
                            <div style="margin-top: 10px; display: none;" class="loader center-align">
                                <div class="preloader-wrapper active">
                                    <div class="spinner-layer spinner-blue-only">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>
                                </div>
                                <h6>Please Wait..</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script 
            src="https://code.jquery.com/jquery-3.6.0.min.js" 
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
            crossorigin="anonymous">
        </script>
        <script>
            $(document).ready(function () {
                console.log("page is ready");

                $("#myform").on('submit', function (event) {
                    event.preventDefault();

                    var f = $(this).serialize();

                    console.log(f);
                    $(".form").hide();
                    $(".loader").show();
                    
                    $.ajax({
                        url: "register",
                        data: f,
                        type: 'POST',
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            console.log("success...");
                            $(".loader").hide();
                            $(".form").show();
                            if(data.trim() === 'Done') {
                                $('#message').html("Successfully Registered !!");
                                $('#message').addClass('green-text');
                            }else {
                                $('#message').html("Something went wrong on server..!!");
                                $('#message').addClass('red-text');
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(data);
                            console.log("error...");
                            $(".loader").hide();
                            $(".form").show();
                            $('#message').html("Something went wrong on server..!!");
                        }
                    })
                })
            })
        </script>
        <
    </body>
</html>
