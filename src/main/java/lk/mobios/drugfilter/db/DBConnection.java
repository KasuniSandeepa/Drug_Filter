package lk.mobios.drugfilter.db;

//import com.mysql.cj.jdbc.exceptions.CommunicationsException;

import java.sql.*;

public class DBConnection {

    private Statement statement;
    private static DBConnection instance;
    private Connection connection;

    private String url = "jdbc:mysql://localhost:3306/";
    private String driver = "com.mysql.cj.jdbc.Driver";
    private String userName = "root";

    //  private static String url = "jdbc:mysql://localhost:3306/drug_db?autoReconnect=true&useSSL=false";
//	private static String UserName = "root";
//	private static String Password = "kasuni123*";

    //database name "drug_db"
    private String dbName = "drug_db?autoReconnect=true&useSSL=false";
    //password name "mysql password"
//    private String password = "Iyartitl1";
    private String password = "kasuni123*";
//    private String password = "h8AW@ePfE75PGUrhv";

    private DBConnection() throws SQLException {
        try {
            Class.forName(driver).newInstance();
            this.connection = DriverManager.getConnection(url + dbName, userName, password);
            System.out.println("Database Connection success");
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException ex) {
            System.out.println("Database Connection Creation Failed : " + ex.getMessage());
        }
    }

    public Connection getConnection() {
        return connection;
    }

    public static synchronized DBConnection getInstance() throws SQLException {
        if (instance == null) {
            instance = new DBConnection();
        } else if (instance.getConnection().isClosed()) {
            instance = new DBConnection();
        }
        return instance;
    }


    /**
     * @param query String The query to be executed
     * @return a ResultSet object containing the results or null if not available
     * @throws SQLException Exception
     */
    public ResultSet query(String query) throws SQLException {
        statement = DBConnection.getInstance().connection.createStatement();
        try {
            return statement.executeQuery(query);
        } catch (Exception e) {
            DBConnection.getInstance();
            return statement.executeQuery(query);
        }

    }

    /**
     * @param insertQuery String The Insert query
     * @return boolean
     * @throws SQLException Exception
     */
    public int insert(String insertQuery) throws SQLException {
        statement = DBConnection.getInstance().connection.createStatement();
        try {
            return statement.executeUpdate(insertQuery);
        } catch (Exception e) {
            DBConnection.getInstance();
            return statement.executeUpdate(insertQuery);
        }
    }

    public int update(String sql) throws SQLException {
        PreparedStatement preparedStmt = DBConnection.getInstance().connection.prepareStatement(sql);
        try {
            return preparedStmt.executeUpdate();
        } catch (Exception e) {
            DBConnection.getInstance();
            return preparedStmt.executeUpdate();
        }
    }

    public int delete(String insertQuery) throws SQLException {
        statement = DBConnection.getInstance().connection.createStatement();
        try {
            return statement.executeUpdate(insertQuery);
        } catch (Exception e) {
            DBConnection.getInstance();
            return statement.executeUpdate(insertQuery);
        }
    }


}