package packagesuperrent.database;

import java.sql.*;
import java.util.ArrayList;

import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

/**
 * This class handles all database related transactions
 */
public class DatabaseConnectionHandler {
    private static final String ORACLE_URL = "jdbc:oracle:thin:@localhost:4321:stu";
    private static final String EXCEPTION_TAG = "[EXCEPTION]";
    private static final String WARNING_TAG = "[WARNING]";
    private static int lport;
    private static String rhost;
    private static int rport;
    private Connection connection = null;

    public DatabaseConnectionHandler() {
        try {
            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
        } catch (SQLException e) {
            System.out.println(EXCEPTION_TAG + " " + e.getMessage());
        }
    }

    private static void ssh(){
        try
        {
            JSch jsch = new JSch();
            Session session = jsch.getSession(DatabaseKeys.SshUserName, "remote.students.cs.ubc.ca", 22);
            lport = 4321;
            rhost = "dbhost.students.cs.ubc.ca";
            rport = 1522;
            session.setPassword(DatabaseKeys.SshUserPassword);
            session.setConfig("StrictHostKeyChecking", "no");
            session.connect();
            System.out.println("localhost:"+session.setPortForwardingL(lport, rhost, rport)+" -> "+rhost+":"+rport);
        }
        catch(Exception e){System.err.print(e);}
    }

    public void close() {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            System.out.println(EXCEPTION_TAG + " " + e.getMessage());
        }
    }

    public boolean login(String username, String password) {
        try {
            if (connection != null) {
                connection.close();
            }
            ssh();
            connection = DriverManager.getConnection(ORACLE_URL, username, password);
            connection.setAutoCommit(false);
            System.out.println("\nConnected to Oracle!");
            return true;
        } catch (SQLException e) {
            System.out.println(EXCEPTION_TAG + " " + e.getMessage());
            return false;
        }
    }

    public void insert(String name, String id) {
        try {
            PreparedStatement ps = connection.prepareStatement("INSERT INTO student1 VALUES (?,?)");
            ps.setString(1, name);
            ps.setInt(2, Integer.parseInt(id));
            ps.executeUpdate();
            connection.commit();
            ps.close();
        } catch (SQLException e) {
            System.out.println(EXCEPTION_TAG + " " + e.getMessage());
            rollbackConnection();
        }
    }

    public  void read() {

        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM student1");

            //50
            //1



//    		// get info on ResultSet
//    		ResultSetMetaData rsmd = rs.getMetaData();
//
//    		System.out.println(" ");
//
//    		// display column names;
//    		for (int i = 0; i < rsmd.getColumnCount(); i++) {
//    			// get column name and print it
//    			System.out.printf("%-15s", rsmd.getColumnName(i + 1));
//    		}

            while(rs.next()) {
                //printout
                System.out.println(rs.getString("sname"));
                System.out.println(rs.getInt("sid"));
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            System.out.println(EXCEPTION_TAG + " " + e.getMessage());
        }

    }
    public void update() {
        try {
            PreparedStatement ps = connection.prepareStatement("UPDATE student1 SET sid = 3 WHERE sname = 'dfg' ");
            ps.executeUpdate();
            connection.commit();
            ps.close();
        } catch (SQLException e) {
            System.out.println(EXCEPTION_TAG + " " + e.getMessage());
            rollbackConnection();
        }
    }
    public void delete() {
        try {
            PreparedStatement ps = connection.prepareStatement("DELETE FROM student1 WHERE sid = 3");
            ps.executeUpdate();
            connection.commit();
            ps.close();
        } catch (SQLException e) {
            System.out.println(EXCEPTION_TAG + " " + e.getMessage());
            rollbackConnection();
        }
    }
    private void rollbackConnection() {
        try  {
            connection.rollback();
        } catch (SQLException e) {
            System.out.println(EXCEPTION_TAG + " " + e.getMessage());
        }
    }
}
