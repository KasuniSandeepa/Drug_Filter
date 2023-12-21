<%--
  Created by IntelliJ IDEA.
  User: Prasad
  Date: 3/15/2021
  Time: 9:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Signin | Gull Admin Template</title>
    <link
            type="text/css"
            href="vendor/@fortawesome/fontawesome-free/css/all.min.css"
            rel="stylesheet"
    />

    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet">
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet">
    <link href="dist-assets/css/swipe.css" rel="stylesheet">
    <link rel="stylesheet" href="dist-assets/css/plugins/sweetalert2.min.css" />



</head>
<body>
<%
    StringBuffer sb=new StringBuffer();
    for(int i=1;i<=5;i++)
    {
        sb.append((char)(int)(Math.random()*79+23+7));
    }
    String cap=new String(sb);
%>

<script type="text/javascript">

    function generateCapture(){
        let alphabets = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz";
        let first = alphabets[Math.floor(Math.random() * alphabets.length)];
        let second = Math.floor(Math.random() * 10);
        let third = Math.floor(Math.random() * 10);
        let fourth = alphabets[Math.floor(Math.random() * alphabets.length)];
        let fifth = alphabets[Math.floor(Math.random() * alphabets.length)];
        let sixth = Math.floor(Math.random() * 10);
        let captcha = first.toString()+second.toString()+third.toString()+fourth.toString()+fifth.toString()+sixth.toString();
        console.log(captcha);

        document.getElementById('generated-captcha').innerHTML = captcha;


        document.getElementById('realCap').value = captcha;



    }

</script>
<div class="auth-layout-wrap" >
    <div class="auth-content">
        <div class="card o-hidden">

            <div class="col-md-6 ml-auto mr-auto">

                <div class="row gx-0 align-items-center justify-content-between">
                    <div class="col-12 ">
                        <div class="text-center text-md-center mb-4 mt-md-0">
                            <img class="pt-2" src="dist-assets/images/dlf.pt-plus-sign-png-110969.png" style="width: 15%"
                                 id="logo-sprig" alt=""/>
                            <h1 class="mb-0 h3">Create an account</h1>
                        </div>

                        <form id="form_reg" name="regFrom" action="#">
                            <!-- Form -->
                            <div class="form-group mb-2">
                                <div class="input-group">
                          <span class="input-group-text" id="basic-addon3"
                          ><span class="fas fa-user"></span
                          ></span>
                                    <input onkeydown="removeValidation()"
                                           type="text"
                                           class="form-control"
                                           placeholder="Full Name"
                                           id="name"
                                           name="name"
                                           required
                                    />
                                </div>
                            </div>
                            <!-- End of Form -->
                            <!-- Form -->
                            <div class="form-group mb-2">
                                <div class="input-group">
                          <span class="input-group-text" id="basic-addon3"
                          ><span class="fas fa-map-marker-alt"></span
                          ></span>
                                    <input onkeydown="removeValidation()"
                                           type="text"
                                           class="form-control"
                                           placeholder="Address"
                                           id="address"
                                           name="address"
                                           required
                                    />
                                </div>
                            </div>
                            <!-- End of Form -->
                            <!-- Form -->
                            <div class="form-group mb-2">
                                <div class="input-group">
                          <span class="input-group-text" id="basic-addon3"
                          ><span class="fas fa-address-card"></span
                          ></span>
                                    <input onkeydown="removeValidation()"
                                           type="text"
                                           class="form-control"
                                           placeholder="NIC"
                                           id="nic"
                                           name="nic"
                                           required
                                           minlength="10"
                                           maxlength="12"
                                    />
                                </div>
                            </div>
                            <!-- End of Form -->
                            <!-- Form -->
                            <div class="form-group mb-2">
                                <div class="input-group">
                          <span class="input-group-text" id="basic-addon3"
                          ><span class="fas fa-phone-square"></span
                          ></span>
                                    <input onkeydown="removeValidation()"
                                           type="tel"
                                           class="form-control"
                                           placeholder="Contact Number"
                                           id="contactno"
                                           name="contactno"
                                           required
                                           pattern="[0-9]{10}"
                                    />
                                </div>
                            </div>
                            <!-- End of Form -->
                            <!-- Form -->
                            <div class="form-group mb-2">
                                <div class="input-group">
                          <span class="input-group-text" id="basic-addon3"
                          ><span class="fas fa-envelope"></span
                          ></span>
                                    <input onkeydown="removeValidation()"
                                           type="email"
                                           class="form-control"
                                           placeholder="Email"
                                           id="email"
                                           name="email"
                                           required
                                    />
                                </div>
                            </div>
                            <!-- End of Form -->
                            <div class="form-group">
                                <!-- Form -->
                                <div class="form-group mb-2">
                                    <div class="input-group">
                            <span class="input-group-text" id="basic-addon4"
                            ><span class="fas fa-lock"></span
                            ></span>
                                        <input
                                                type="password"
                                                placeholder="Password"
                                                class="form-control"
                                                id="password"
                                                name="password"
                                                pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                                                title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
                                                required
                                        />
                                    </div>
                                </div>
                                <!-- End of Form -->
                                <!-- Form -->
                                <div class="form-group mb-2">
                                    <div class="input-group">
                            <span class="input-group-text" id="basic-addon5"
                            ><span class="fas fa-lock"></span
                            ></span>
                                        <input onkeydown="removeValidation()"
                                               type="password"
                                               placeholder="Confirm Password"
                                               class="form-control"
                                               id="repassword"
                                               name="repassword"
                                               required
                                        />
                                    </div>
                                </div>
                                <!-- End of Form -->
                                <div class="form-check mb-2">
                                    <input onclick="removeValidation()"
                                           class="form-check-input"
                                           type="checkbox"
                                           value=""
                                           placeholder="check"
                                           id="checkboxter"
                                    />
                                    <label class="form-check-label" for="checkboxter">
                                        I agree to the
                                        <a href="#" class="text-primary font-weight-bold"
                                        >terms and conditions</a
                                        >
                                    </label>
                                </div>

                                <br>
                                <div>
                                    <table border="0">
                                        <tbody>
                                        <tr>
                                            <td>
                                                <center><h2><s><i><font face="casteller" color="#FFFFF"><div style="background-color: BlueViolet" id="generated-captcha" ><%=cap%></div></font></i></s></h2></center>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><input type="text" name="cap1" value="" placeholder="Capture the Code" id="userCap"/></td>
                                            <td><input type="hidden" name="cap2" value='<%=cap%>' readonly="readonly" placeholder="realCap" id="realCap"/> </td>

                                            <td><input type="button" value="Reset" onclick="generateCapture()"/>  </td>
                                        </tr>
                                        </tbody>
                                    </table>

                                </div>
                                <br>
                                <button id="subBtn" type="button" class="btn btn-block btn-primary">
                                    Register
                                </button>
                                <%--                               ss?--%>
                                <div style="padding-bottom: 25px !important;" id="loader" class='d-none contain'>
                                    <svg height='80' viewBox='-30 0 255 80' width='255'>
                                        <ellipse cx='25' cy='20' fill='none' rx='10' ry='10'></ellipse>
                                    </svg>
                                    <svg height='80' viewBox='-30 0 255 80' width='255'>
                                        <ellipse cx='25' cy='20' fill='none' rx='10' ry='10'></ellipse>
                                    </svg>
                                    <svg height='80' viewBox='-30 0 255 80' width='255'>
                                        <ellipse cx='25' cy='20' fill='none' rx='10' ry='10'></ellipse>
                                    </svg>
                                    <svg height='80' viewBox='-30 0 255 80' width='255'>
                                        <ellipse cx='25' cy='20' fill='none' rx='10' ry='10'></ellipse>
                                    </svg>
                                    <svg height='80' viewBox='-30 0 255 80' width='255'>
                                        <ellipse cx='25' cy='20' fill='none' rx='10' ry='10'></ellipse>
                                    </svg>
                                    <svg height='80' viewBox='-30 0 255 80' width='255'>
                                        <ellipse cx='25' cy='20' fill='none' rx='10' ry='10'></ellipse>
                                    </svg>
                                    <svg height='80' viewBox='-30 0 255 80' width='255'>
                                        <ellipse cx='25' cy='20' fill='none' rx='10' ry='10'></ellipse>
                                    </svg>
                                    <svg height='80' viewBox='-30 0 255 80' width='255'>
                                        <ellipse cx='25' cy='20' fill='none' rx='10' ry='10'></ellipse>
                                    </svg>
                                    <svg height='80' viewBox='-30 0 255 80' width='255'>
                                        <ellipse cx='25' cy='20' fill='none' rx='10' ry='10'></ellipse>
                                    </svg>
                                    <svg height='80' viewBox='-30 0 255 80' width='255'>
                                        <ellipse cx='25' cy='20' fill='none' rx='10' ry='10'></ellipse>
                                    </svg>
                                </div>

                                <%--                               ss?--%>
                        </form>

                        <div
                                class="d-flex justify-content-center align-items-center mt-4"
                        >
                            <%--                      <span class="font-weight-normal">--%>
                            <%--                        Already have an account?--%>
                            <%--                        <a--%>
                            <%--                                href="sign-in.jsp"--%>
                            <%--                                class="font-weight-bold"--%>
                            <%--                        >Sign-in here</a--%>
                            <%--                        >--%>
                            <%--                      </span>--%>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="dist-assets/js/swipe.js"></script>
<script src="dist-assets/js/plugins/bootstrap.bundle.min.js"></script>
<script src="dist-assets/js/plugins/perfect-scrollbar.min.js"></script>
<script src="dist-assets/js/scripts/script.min.js"></script>
<script src="dist-assets/js/scripts/sidebar.large.script.min.js"></script>
<script src="dist-assets/js/plugins/sweetalert2.min.js"></script>
<script src="dist-assets/js/scripts/sweetalert.script.min.js"></script>

<script>

    var pass;
    var repass;

    var userCap;
    var realCap;

    var isM = false;
    var isE = false;
    var isN = false;
    var isP = false;
    var isPS = false;
    var isP1 = false;
    var isT = false;
    var isPass = false;
    var isCap = false;



    $('#subBtn').click(function () {


        var x = document.forms["regFrom"];
        // console.log(x);
        $.each(x, function (i, sx) {

            if (sx.value.trim() == '') {
                if (sx.placeholder == 'check') {
                    if (!sx.checked) {
                        $(sx).addClass('is-invalid');
                        isT = false;
                    } else {
                        isT = true;
                    }
                } else {
                    $(sx).addClass('is-invalid');
                }


            } else {


                if (sx.placeholder == 'Email') {
                    console.log("EMAIL "+ sx.value);
                    if (!validateEmail(sx.value)) {
                        $(sx).addClass('is-invalid');

                        isE = false;
                    } else {
                        isE = true;
                    }
                }
                if (sx.placeholder == 'Contact Number') {

                    if (!validateMobile(sx.value)) {
                        $(sx).addClass('is-invalid');

                        isM = false;
                    } else {
                        isM = true;
                    }
                }

                if (sx.placeholder == 'NIC') {



                    if (!validateNIC(sx.value)) {
                        $(sx).addClass('is-invalid');
                        isN = false;
                    } else {
                        isN = true;

                    }
                }

                if (sx.placeholder == 'Password') {

                    if (!validatePassword(sx.value)) {
                        $(sx).addClass('is-invalid');
                        isPass = false;
                    } else {
                        isPass = true;
                    }
                }

                // if (sx.placeholder == 'Password') {
                //     console.log(sx.value.length);
                //     pass = sx.value;
                //     if (!(sx.value.length >= 6)) {
                //         $(sx).addClass('is-invalid');
                //         isPS = false;
                //     } else {
                //         isPS = true;
                //     }
                // }
                // if (sx.placeholder == 'Confirm Password') {
                //     console.log(sx.value.length);
                //     repass = sx.value;
                //     if (!(sx.value.length >= 6)) {
                //         $(sx).addClass('is-invalid');
                //         isP1 = false;
                //     } else {
                //         isP1 = true;
                //     }
                // }

                if(sx.placeholder == 'Password'){
                    pass = sx.value;
                }

                if(sx.placeholder == 'Confirm Password'){
                    repass = sx.value;
                }

                if(sx.placeholder == 'Capture the Code'){
                    userCap = sx.value;
                }

                if(sx.placeholder == 'realCap'){
                    realCap = sx.value;
                }



                /*  if (((sx.placeholder == 'Password') === (sx.placeholder == 'Confirm Password'))) {
                     $('#repassword').addClass('is-invalid');
                     $('#password').addClass('is-invalid');

                     isP = true;
                 } else {
                     isP = false;
                 }


  */
            }

        });





        if (!(pass === repass)) {
            $('#repassword').addClass('is-invalid');
            $('#password').addClass('is-invalid');

            isP = false;
        } else {
            isP = true;
        }

        if (!(userCap === realCap)) {
            $('#userCap').addClass('is-invalid');
            $('#realCap').addClass('is-invalid');

            isCap = false;
        } else {
            isCap = true;
        }



        console.log(isE)
        console.log(isM)
        console.log(isN)
        console.log(isP)
        console.log(isP1)
        console.log(isPS)
        console.log(isT)
        console.log(isCap)

        console.log("rrrr"+realCap);



        if (!($('#name').val() == '') && !($('#address').val() == '')  && isE && isM && isN && isP && isT && isPass && isCap) {

            $('#subBtn').hide();
            $('#loader').removeClass('d-none');
            $('#loader').show();

            $.ajax({
                url: 'controller/LoginController.jsp?action=reg',
                type: 'GET',
                processData: false,
                contentType: false,
                cache: false,
                data: $('#form_reg').serialize(), // added data type
                success: function (data) {

                    check(data);

                },
                error: function (e) {

                }
            });
        }else{

            if(!isE){
                swal({
                    type: 'error',
                    title: 'Registration Failed!',
                    text: 'Please enter a valid email address',
                    buttonsStyling: false,
                    confirmButtonClass: 'btn btn-lg btn-success'
                });

            }else if(!isM){
                swal({
                    type: 'error',
                    title: 'Registration Failed!',
                    text: 'Please enter 10 digit valid contact number',
                    buttonsStyling: false,
                    confirmButtonClass: 'btn btn-lg btn-success'
                });
            }else if(!isN){
                swal({
                    type: 'error',
                    title: 'Registration Failed!',
                    text: 'Please enter a valid NIC number',
                    buttonsStyling: false,
                    confirmButtonClass: 'btn btn-lg btn-success'
                });
            }else if(!isP){
                swal({
                    type: 'error',
                    title: 'Registration Failed!',
                    text: 'Password and Confirm passwords are mismatched',
                    buttonsStyling: false,
                    confirmButtonClass: 'btn btn-lg btn-success'
                });
            }else if(!isPass){
                swal({
                    type: 'error',
                    title: 'Registration Failed! Weak Password',
                    text: 'Password Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters',
                    buttonsStyling: false,
                    confirmButtonClass: 'btn btn-lg btn-success'
                });
            }else if(!isT){
                swal({
                    type: 'error',
                    title: 'Registration Failed!',
                    text: 'Please accept the terms and conditions',
                    buttonsStyling: false,
                    confirmButtonClass: 'btn btn-lg btn-success'
                });
            }else if(!isCap){
                swal({
                    type: 'error',
                    title: 'Registration Failed!',
                    text: 'Please enter the captcha code correctly',
                    buttonsStyling: false,
                    confirmButtonClass: 'btn btn-lg btn-success'
                });
            }
        }

    });

    $('#name').on('keypress', function (event) {
        var regex = new RegExp("^[a-z A-Z]+$");
        var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
        if (!regex.test(key)) {
            swal({
                type: 'warning',
                title: 'Registration Failed!',
                text: 'Already Registered User',
                buttonsStyling: false,
                confirmButtonClass: 'btn btn-lg btn-success'
            });
            event.preventDefault();

            return false;
        }
    });


    $('#nic').on('keypress', function (event) {
        var regex = new RegExp("^[0-9-vVxX]");
        var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
        if (!regex.test(key)) {
            event.preventDefault();
            return false;
        }
    });

    $('#tel').on('keypress', function (event) {
        var regex = new RegExp("^[0-9]");
        var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
        if (!regex.test(key)) {
            event.preventDefault();
            return false;
        }
    });




    function check(data) {
        console.log('res ' + data);


        if (data == 'EXE') {
            render('#140202', 'User Already Exist');
            // window.location.href = 'sign-in.jsp';
        } else {
            if (data) {
                render('#140202', 'Registration Success');
            } else {
                render('#140202', 'Registration Failed');
                // window.location.href = 'sign-in.jsp';
            }
        }

        setTimeout(function () {
            $('#loader').hide();

            if (data == 'EXE') {
                $('#subBtn').show();
                swal({
                    type: 'warning',
                    title: 'Registration Failed!',
                    text: 'Already Registered User',
                    buttonsStyling: false,
                    confirmButtonClass: 'btn btn-lg btn-success'
                });
            } else {
                if (data) {
                    //
                    /*   swal({
                          type: 'success',
                          title: 'Registration Success!',
                          text: 'We will Contact you soon',
                          buttonsStyling: false,
                          confirmButtonClass: 'btn btn-lg btn-success'
                      });
                      $('#subBtn').show(); */

                    window.location.href = 'sendOtp1.jsp';


                } else {
                    $('#subBtn').show();
                }
            }
        }, 500);
    }

    function validateEmail(email) {
        const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(String(email).toLowerCase());
    }

    function validateNIC(nic) {
        const re = /^(?:19|20)?\d{2}[0-9]{10}|[0-9]{9}[x|X|v|V]$/;
        return re.test(String(nic));
    }

    function validateMobile(msisdn) {
        const re = /^(?:0|94|\+94)?(?:(11|21|23|24|25|26|27|31|32|33|34|35|36|37|38|41|45|47|51|52|54|55|57|63|65|66|67|81|912)(0|2|3|4|5|7|9)|7(0|1|2|5|6|7|8)\d)\d{6}$/;
        return re.test(String(msisdn));
    }

    function removeValidation() {
        var x = document.forms["regFrom"];
        $.each(x, function (i, sx) {
            $(sx).removeClass('is-invalid');
        });
    }


    function validatePassword(msisdn) {
        const re = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;
        return re.test(String(msisdn));
    }


</script>




