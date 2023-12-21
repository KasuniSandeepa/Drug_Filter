<%@ page import="lk.mobios.drugfilter.controller.UserController"%>
<%@ page import="lk.mobios.drugfilter.model.User"%>
<%--<%@ page import="Database.*"%>--%>
<%@ page import="lk.mobios.drugfilter.util.MobileNoValidator"%>
<%@page import="java.util.Random"%>
<%@page import="javax.swing.*"%>

<%@ page import="java.sql.SQLException"%><%--
  Created by IntelliJ IDEA.
  User: Prasad
  Date: 3/12/2021
  Time: 9:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%@page import="javax.servlet.http.HttpSession"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%
    String username = request.getParameter("email");
    String password = request.getParameter("password");
    String action = "" + request.getParameter("action");
    String action_resend = "" + request.getParameter("action_resend");





    String name = "" + request.getParameter("name");
    String nic = "" + request.getParameter("nic");
    String address = "" + request.getParameter("address");
    String contactno = "" + request.getParameter("contactno");
    String email = "" + request.getParameter("email");

    String otp1 = ""+request.getParameter("otp1");


    //List<User> _Users = DBUtil.getUsers();

    //System.out.println("uuuuuu" + _Users.toString());

    String page1 = "";

    boolean validUser = false;
    String lan = (String) session.getAttribute("lan");
    if(lan==null){
        lan = "en";
    }

    if (action.equals("login")) {

/* 	for (User user : _Users) {

		if ((user.getEmail().equals(username)) && (user.getPassword().equals(password))) {

		validUser = true;
		HttpSession session1 = request.getSession();
		session1.setAttribute("uid", user.getId());
		session1.setAttribute("name", user.getName());
		break;
	    } else {

			validUser = false;
			}

	}

	if (validUser == true) {
		response.sendRedirect("../search.jsp");
	} else {

		response.sendRedirect("../index.jsp");
	} */

	/*   if(username.equals("admin")&& password.equals("admin@321")){
	      response.sendRedirect("../search.jsp");

	  }else {

	      response.sendRedirect("../index1.jsp");

	  } */


        try {
            final String msisdn = UserController.login(email, password);
            System.out.println(msisdn);
            session.setAttribute("msisdn",msisdn);

            String b= " ";

            if(!msisdn.equals("false")){
//                application.setAttribute("verify" ,"done");
//                UserController.sendOtp(msisdn,lan);
                b = "true";
                session.setAttribute("name",UserController.getUser(msisdn));
                response.sendRedirect("../"+"search.jsp");

                response.setContentType("application/json");
               // out.print(new Gson().toJson(true));

            }else{
                b= "EXE";
                application.setAttribute("error","error");
                response.sendRedirect("../"+"index.jsp");
                JOptionPane.showMessageDialog(null, "Invlid Login , Try Again");

                response.setContentType("application/json");
                //out.print(new Gson().toJson(b));

            }
        } catch (SQLException e) {

            e.printStackTrace();

        }
    }

    if (action.equals("reg")) {
        try {

            Random random = new Random();
            String _Otp = String.valueOf(random.nextInt(100000));
            String b = UserController.registerUser(name, address, contactno, nic, email, password, "en" , _Otp);

            if (b.equals("true")) {

                application.setAttribute("verify", "done");
                session.setAttribute("msisdn", MobileNoValidator.getValidNumber(contactno));
                UserController.sendOtp(MobileNoValidator.getValidNumber(contactno),lan , _Otp );

                response.setContentType("application/json");
              //  out.print(new Gson().toJson(true));
            } else {
                response.setContentType("application/json");
              //  out.print(new Gson().toJson(b));
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.setContentType("application/json");
           //System.out.print(new Gson().toJson(false));
        }
    }else if(action.equals("otp")){
        String msisdn = (String)session.getAttribute("msisdn");
        //String msisdn = "94752917442";
        System.out.print("number : "+msisdn);
        if(msisdn==null) {
            request.setCharacterEncoding("utf8");
            response.setCharacterEncoding("utf8");
            response.setContentType("application/json");
            System.out.print("exp");
            return;
        }else {

            System.out.println("eee"+msisdn);
            System.out.println("rrr"+otp1);

            msisdn = msisdn.substring(0, 11);
            boolean b = UserController.checkOtp(msisdn,otp1.trim());
            if(b){
                session.setAttribute("name",UserController.getUser(msisdn));
                response.setContentType("application/json");
                //System.out.print(new Gson().toJson(true));
                response.sendRedirect("../"+"sucessRegister.jsp");
            }
            else{
                JOptionPane.showMessageDialog(null, "Invlid OTP , Resend It again");
                response.setContentType("application/json");
                response.sendRedirect("../"+"sendOtp1.jsp");
               // out.print(new Gson().toJson(b));

            }
            request.setCharacterEncoding("utf8");
            response.setCharacterEncoding("utf8");
            response.setContentType("application/json");
          //  out.print(b);
            return;
        }
    }else if(action.equals("otpPasswordReset")){
        User user = (User)session.getAttribute("user");
        //String msisdn = "94752917442";
        System.out.print("number : "+user);
        if(user==null) {
            request.setCharacterEncoding("utf8");
            response.setCharacterEncoding("utf8");
            response.setContentType("application/json");
            System.out.print("exp");
            return;
        }else {



            String msisdn = user.getMobileNo();
            boolean b = UserController.checkOtp(msisdn,otp1.trim());
            if(b){
                session.setAttribute("user",user);
                response.setContentType("application/json");
//                System.out.print(new Gson().toJson(true));
                response.sendRedirect("../"+"resetPassword.jsp");
            }
            else{
                JOptionPane.showMessageDialog(null, "Invlid OTP , Resend It again");
                response.setContentType("application/json");
                response.sendRedirect("../"+"resetPasswordOtp.jsp");
                //System.out.print(new Gson().toJson(b));

            }
            request.setCharacterEncoding("utf8");
            response.setCharacterEncoding("utf8");
            response.setContentType("application/json");
            System.out.print(b);
            return;
        }
    }

    else if(action.equals("mail")){

        String email1 = "chamilabiyanvila@gmail.com";
//	UserController.sendEmail(email1);

    }else if(action.equals("resend_otp")){
        String msisdn = (String)session.getAttribute("msisdn");
        //String msisdn = "94752917442";
        System.out.print("number : "+msisdn);
        if(msisdn==null) {
            request.setCharacterEncoding("utf8");
            response.setCharacterEncoding("utf8");
            response.setContentType("application/json");
            System.out.print("exp");
            return;
        }else {

            System.out.println(msisdn);
            //System.out.println(otp1);

            Random random = new Random();
            String _Otp = String.valueOf(random.nextInt(100000));
            String forgetPass = "no";

            int result = UserController.updateOtpByMobileNumber(msisdn, _Otp , forgetPass);

            if(result>0){

                UserController.sendOtp(msisdn,lan , _Otp );

                session.setAttribute("name",UserController.getUser(msisdn));
                response.sendRedirect("../"+"sendOtp1.jsp");
            }else{
                int input =    JOptionPane.showOptionDialog(null,"Onlt two times are allowed to resend OTP", "Failed Attempt" , JOptionPane.OK_CANCEL_OPTION , JOptionPane.INFORMATION_MESSAGE, null , null , null);

                if(input == JOptionPane.OK_OPTION){
                    response.sendRedirect("../"+"register.jsp");
                    UserController.removeUser(msisdn);
                }else if(input == JOptionPane.CANCEL_OPTION){
                    response.sendRedirect("../"+"sendOtp1.jsp");
                }

				/* 	response.setContentType("application/json");
			        	  response.sendRedirect("../"+"test.jsp");
			        	out.print(new Gson().toJson(result)); */
            }



            System.out.println("Resend");
        }
    }else if(action.equals("resend_otp1")){


        String  msisdn="94716525135";
        //System.out.println(otp1);

        Random random = new Random();
        String _Otp = String.valueOf(random.nextInt(100000));

        String forgetPass = "no";
        int result = UserController.updateOtpByMobileNumber(msisdn, _Otp , forgetPass);

        //	UserController.sendOtp(msisdn,lan , _Otp );

        //  session.setAttribute("name",UserController.getUser(msisdn));
        if(result>0){
            response.sendRedirect("../"+"test.jsp");
        }else{
            int input =    JOptionPane.showOptionDialog(null,"Onlt two times are allowed to resend OTP", "Failed Attempt" , JOptionPane.OK_CANCEL_OPTION , JOptionPane.INFORMATION_MESSAGE, null , null , null);

            if(input == JOptionPane.OK_OPTION){
                UserController.removeUser(msisdn);
                response.sendRedirect("../"+"register.jsp");

            }else if(input == JOptionPane.CANCEL_OPTION){
                response.sendRedirect("../"+"test.jsp");
            }

		/* 	response.setContentType("application/json");
	        	  response.sendRedirect("../"+"test.jsp");
	        	out.print(new Gson().toJson(result)); */
        }



        System.out.println("Resend test");

    }if (action.equals("searchAccount")) {
    try {



        String b = UserController.getUserByEmail(email);



        if (b.equals("true")) {


            User user = UserController.getUserEmail(email);
            application.setAttribute("verify", "done");
            session.setAttribute("user", user);

            response.setContentType("application/json");
            //System.out.print(new Gson().toJson(true));
        } else if(b.equals("false")){



            response.setContentType("application/json");
            //System.out.print(new Gson().toJson(b));
        }

    } catch (Exception e) {
        e.printStackTrace();
        response.setContentType("application/json");
     //   System.out.print(new Gson().toJson(false));
    }
}if (action.equals("sendEmailOtp")) {




    User user = (User)session.getAttribute("user");
    String otp = UserController.generateOtp();
    UserController.sendEmailOtp(user, otp);
    String forgetPass = "yes";
    UserController.updateOtpByMobileNumber(user.getMobileNo(), otp , forgetPass);
    System.out.println(user.getMobileNo());


    response.sendRedirect("../"+"resetPasswordOtp.jsp");


}if (action.equals("resetSMSOtp")) {




    User user = (User)session.getAttribute("user");
    String otp = UserController.generateOtp();
    UserController.sendOtp(user.getMobileNo(), lan, otp);
    String forgetPass = "yes";
    UserController.updateOtpByMobileNumber(user.getMobileNo(), otp , forgetPass);
    response.sendRedirect("../"+"resetPasswordOtp.jsp");

}if (action.equals("resetPassword")) {




    User user = (User)session.getAttribute("user");

    System.out.println(user.getName());
    System.out.println(password);
    try {



        String b = " ";

        int rows = UserController.resetPassword(user.getMobileNo(), password);

        if(rows>0){
            b = "true";
        }else{
            b = "false";
        }



        if (b.equals("true")) {



            application.setAttribute("verify", "done");
            //session.setAttribute("user", user);

            response.setContentType("application/json");
       //     System.out.print(new Gson().toJson(true));
        } else if(b.equals("false")){



            response.setContentType("application/json");
         //   System.out.print(new Gson().toJson(b));
        }

    } catch (Exception e) {
        e.printStackTrace();
        response.setContentType("application/json");
        //System.out.print(new Gson().toJson(false));
    }


}else if(action.equals("logout")){

    session.invalidate();
    System.out.println("Session detroy");
    response.sendRedirect("../"+"index.jsp");


}

    if (action.equals("login1")) {

/* 	for (User user : _Users) {

		if ((user.getEmail().equals(username)) && (user.getPassword().equals(password))) {

		validUser = true;
		HttpSession session1 = request.getSession();
		session1.setAttribute("uid", user.getId());
		session1.setAttribute("name", user.getName());
		break;
	    } else {

			validUser = false;
			}

	}

	if (validUser == true) {
		response.sendRedirect("../search.jsp");
	} else {

		response.sendRedirect("../index.jsp");
	} */

	/*   if(username.equals("admin")&& password.equals("admin@321")){
	      response.sendRedirect("../search.jsp");

	  }else {

	      response.sendRedirect("../index1.jsp");

	  } */


        try {
            final String msisdn = UserController.login(email, password);
            System.out.println(msisdn);
            session.setAttribute("msisdn",msisdn);

            String b= " ";

            if(!msisdn.equals("false")){
//                application.setAttribute("verify" ,"done");
//                UserController.sendOtp(msisdn,lan);
                b = "true";
                session.setAttribute("name",UserController.getUser(msisdn));

                response.setContentType("application/json");
          //      System.out.print(new Gson().toJson(true));

            }else{
                b= "EXE";
                application.setAttribute("error","error");



                response.setContentType("application/json");
            //    System.out.print(new Gson().toJson(b));

            }
        } catch (SQLException e) {

            e.printStackTrace();

        }
    }

%>
