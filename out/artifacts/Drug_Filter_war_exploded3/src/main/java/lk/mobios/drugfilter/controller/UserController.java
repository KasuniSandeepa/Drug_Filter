package lk.mobios.drugfilter.controller;

import lk.mobios.drugfilter.db.DBConnection;
import lk.mobios.drugfilter.model.User;
import lk.mobios.drugfilter.util.MobileNoValidator;

import javax.mail.PasswordAuthentication;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;




public class UserController {

    public static String registerUser(String name, String address, String contactno, String nic, String email, String password, String lan , String  _Otp) throws SQLException {


        String re = "";
        boolean emails = false;
        boolean mobile = false;

        ResultSet query1 = DBConnection.getInstance().query("SELECT * FROM users WHERE email='" + email + "'");
        ResultSet query2 = DBConnection.getInstance().query("SELECT * FROM users WHERE mobileNo='" + MobileNoValidator.getValidNumber(contactno) + "'");

        mobile = query2.next();
        emails= query1.next();

        if(mobile|| emails){
            re = "EXE";
        }else {
            //   int query = DBConnection.getInstance().insert("INSERT INTO users (name,address,mobileNo,nic,email,nic,password) VALUES('" + email
            //    + "','" + password
            //    + "','ACTIVE','" + name + "','" + address + "','" + nic + "','" + MobileNoValidator.getValidNumber(contactno) + "','" + lan + "',NOW())");
            int query = DBConnection.getInstance().insert("insert into users(id,name,address,mobileNo,nic,email,password ,otp) values (0,'" + name
                    + "','" + address + "','" + MobileNoValidator.getValidNumber(contactno) + "','" + nic + "','" + email + "','" + password + "','"+ _Otp +   "')");
            if(query>0){
                re ="true";
            }
        }

        return re;
    }

    public static String login(String email, String password) throws SQLException {

        final ResultSet query = DBConnection.getInstance().query("SELECT * FROM users WHERE email='" + email + "' AND password='" + password + "'");

        String verified = "Verified";
        while (query.next()) {
            if (email.equals(query.getString("email")) && password.equals(query.getString("password")) && verified.equals(query.getString("verfied"))) {
                return query.getString("mobileNo");
            }
            return "false";
        }

        return "false";
    }


    public static User getUser(String msisdn) {
        User user = new User();
        try {
            ResultSet query = DBConnection.getInstance().query("SELECT * FROM users WHERE mobileNo='" + msisdn + "'");

            if (query.next()) {
                user.setId(query.getString("id"));
                user.setName(query.getString("name"));
                user.setEmail(query.getString("email"));
                user.setAddress(query.getString("address"));
                user.setNic(query.getString("nic"));
                user.setMobileNo(query.getString("mobileNo"));
                user.setOtpUpdateCount(query.getInt("otpUpdateCount"));
                // user.setLan(query.getString("lan"));
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;

    }

    public static User getUserEmail(String email) {
        User user = new User();
        try {
            ResultSet query = DBConnection.getInstance().query("SELECT * FROM users WHERE email='" +email + "'");

            if (query.next()) {
                user.setId(query.getString("id"));
                user.setName(query.getString("name"));
                user.setEmail(query.getString("email"));
                user.setAddress(query.getString("address"));
                user.setNic(query.getString("nic"));
                user.setMobileNo(query.getString("mobileNo"));
                user.setOtpUpdateCount(query.getInt("otpUpdateCount"));
                // user.setLan(query.getString("lan"));
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;

    }

    public static String getUserByEmail(String email) {
        User user = new User();
        String result = " ";
        try {
            ResultSet query = DBConnection.getInstance().query("SELECT * FROM users WHERE email='" + email + "'");

            System.out.println("qqqqqqqqq"+query);
            if (query.next()) {
                user.setId(query.getString("id"));
                user.setName(query.getString("name"));
                user.setEmail(query.getString("email"));
                user.setAddress(query.getString("address"));
                user.setNic(query.getString("nic"));
                user.setMobileNo(query.getString("mobileNo"));
                user.setOtpUpdateCount(query.getInt("otpUpdateCount"));
                // user.setLan(query.getString("lan"));

                result = "true";

            }else {

                result = "false";


            }


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;


    }

    public static boolean checkOtp(String msisdn, String otp) {
        try {
            ResultSet query = DBConnection.getInstance().query("SELECT otp FROM users WHERE mobileNo='" + msisdn + "'");
            String otp1 = "";
            if (query.next()) {
                otp1 = query.getString("otp");
            }

            if (otp.equals(otp1)) {

                verifyUser(msisdn,otp);
                User user = getUser(msisdn);
                sendEmail(user.getEmail() , user);

                return true;
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;

    }

    public static void sendOtp(String msisdn, String lan , String otpKey) throws SQLException {
        String msg = null;

        String characters = "0123456789";


        if (lan.equals("en")) {
            msg = "Your OTP Code is " + otpKey;
        } else if (lan.equals("si")) {
            msg = "ඔබගේ OTP රහස් අංකය " + otpKey;
        } else if (lan.equals("ta")) {
            msg = "Your OTP Code is " + otpKey;
        }
        //updateOtpByMobileNumber(msisdn, otpKey);
        sendSMS(msisdn,msg);
    }

    public static String sendSMS(String msisdn, String msg) {

        String encode = null;
        String converted_response = "";

        final String SMS_USERNAME = "mobios_alert";
        final String SMS_SRC = "MobiOsOTP";
        final String SMS_PASSWORD = "Mo321Ar";
        final String SMS_ACTION = "bulk_put";
        final String SMS_CAMP = "bulk";
        try {
            encode = URLEncoder.encode(msg, "UTF-8");
            System.out.print("encode"+encode);

            String url = "http://220.247.201.241:5000/sms/send_sms.php?username=mobios_alert&password=Mo321Ar&src=MobiOsOTP&dst=" + msisdn + "&msg=" + encode + "&dr=1&lan=u";

            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            StringBuffer response = null;


            // optional default is GET
            con.setRequestMethod("GET");

            int responseCode = con.getResponseCode();
            System.out.println("\nSending 'GET' request to URL : " + url);
            System.out.println("Response Code : " + responseCode);

            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;
            response = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }

            in.close();

            converted_response = response.toString();

            System.out.println("response :"+converted_response);

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (ProtocolException e) {
            e.printStackTrace();
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        // print result

        return converted_response;

    }

    public static int verifyUser(String mobile, String otp) throws SQLException {

        PreparedStatement statement = null;

        int row = 0;

        String SQL = "UPDATE users SET verfied = ? where mobileNo = ?";
        try {
            statement = DBConnection.getInstance().getConnection().prepareStatement(SQL);
            statement.setString(1, "Verified");
            statement.setString(2, mobile);
            row = statement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return row;
    }


    public static String sendEmail(String email , User user) {


        // Sender's email ID needs to be mentioned
        String from = "ksandeepa.kuruppu@gmail.com";

        // Recipient's email ID needs to be mentioned.
        String to = email;
        //String to = "chamilabiyanvila@gmail.com";

        //User's full name
        String fullName = user.getName();


        // Assuming you are sending email from through gmails smtp
        String host = "smtp.gmail.com";

        // Get system properties
        Properties properties = System.getProperties();

        // Setup mail server
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");

        // Get the Session object.// and pass username and password
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

            protected PasswordAuthentication getPasswordAuthentication() {

                return new PasswordAuthentication("ksandeepa.kuruppu@gmail.com", "ksandeepa123");

            }

        });

        // Used to debug SMTP issues
        session.setDebug(true);

        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // Set Subject: header field
            message.setSubject("Welcome to Drug Application , " + fullName);

            // Now set the actual message
            message.setText("We’re here to help you manage drug items  faster by making it easier to find and connect  Click this link for login "
                    + "http://localhost:8080/Drug/index.jsp");

            System.out.println("sending...");
            // Send message
            Transport.send(message);
            System.out.println("Sent message successfully....");
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }

        return null;

    }


    public static void sendEmail1() {

        String to = "kadkskuruppuarachchi@gmail.com";
        String password = "ksandeepa123*";
        String sub = "hello javatpoint";
        String msg = "Test";
        String from = "ksandeepa.kuruppu@gmail.com";

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        //get Session
        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(from,password);
                    }
                });
        //compose message
        try {
            MimeMessage message = new MimeMessage(session);
            message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
            message.setSubject(sub);
            message.setText(msg);
            //send message
            Transport.send(message);
            System.out.println("message sent successfully");
        } catch (MessagingException e) {throw new RuntimeException(e);}




    }

    public static int updateOtpByMobileNumber(String mobile, String otp , String forgotPass) throws SQLException {


        User user = getUser(mobile);

        int otpUpdateCount = user.getOtpUpdateCount();

        if(forgotPass.equals("no")) {
            if(otpUpdateCount<2) {


                otpUpdateCount++;
                PreparedStatement statement = null;

                int row = 0;

                String SQL = "UPDATE users SET otp = ? , otpUpdateCount = ? where mobileNo = ?";
                try {
                    statement = DBConnection.getInstance().getConnection().prepareStatement(SQL);
                    statement.setString(1, otp);
                    statement.setLong(2,  otpUpdateCount);
                    statement.setString(3, mobile);
                    row = statement.executeUpdate();

                } catch (Exception e) {
                    e.printStackTrace();
                }
                return row;

            }

            else {
                return 0;
            }
        }else {

            PreparedStatement statement = null;

            int row = 0;

            String SQL = "UPDATE users SET otp = ? , otpUpdateCount = ? where mobileNo = ?";
            try {
                statement = DBConnection.getInstance().getConnection().prepareStatement(SQL);
                statement.setString(1, otp);
                statement.setLong(2,  otpUpdateCount);
                statement.setString(3, mobile);
                row = statement.executeUpdate();

            } catch (Exception e) {
                e.printStackTrace();
            }
            return row;
        }




    }

    public static void removeUser(String mobile) throws SQLException {


        User user = getUser(mobile);
        System.out.println("In remove method");

        try {
            int query1 = DBConnection.getInstance().delete("DELETE  FROM users WHERE mobileNo='" + mobile + "'");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static String generateOtp()  {

        Random random = new Random();
        String _Otp = String.valueOf(random.nextInt(100000));

        return _Otp;
    }


    public static String sendEmailOtp( User user , String otp) {


        // Sender's email ID needs to be mentioned
        String from = "ksandeepa.kuruppu@gmail.com";

        // Recipient's email ID needs to be mentioned.
        String to = user.getEmail();
        //String to = "chamilabiyanvila@gmail.com";

        //User's full name
        String fullName = user.getName();


        // Assuming you are sending email from through gmails smtp
        String host = "smtp.gmail.com";

        // Get system properties
        Properties properties = System.getProperties();

        // Setup mail server
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");

        // Get the Session object.// and pass username and password
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

            protected PasswordAuthentication getPasswordAuthentication() {

                return new PasswordAuthentication("ksandeepa.kuruppu@gmail.com", "ksandeepa123");

            }

        });

        // Used to debug SMTP issues
        session.setDebug(true);

        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // Set Subject: header field
            message.setSubject("Welcome to Drug Application , " + fullName);

            // Now set the actual message
            message.setText("We’re here to help you manage drug items  faster by making it easier to find and connect/n "
                    + "Your reset Password code is : "+otp);

            System.out.println("sending...");
            // Send message
            Transport.send(message);
            System.out.println("Sent message successfully....");
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }

        return null;

    }

    public static int resetPassword(String mobile, String password) throws SQLException {


        User user = getUser(mobile);








        PreparedStatement statement = null;

        int row = 0;

        String SQL = "UPDATE users SET password = ? where mobileNo = ?";
        try {
            statement = DBConnection.getInstance().getConnection().prepareStatement(SQL);
            statement.setString(1, password);
            statement.setString(2, mobile);
            row = statement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return row;








    }




}







