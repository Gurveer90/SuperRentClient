    package packagesuperrent.database;

    import javafx.scene.control.Alert;
    import javafx.scene.control.ButtonType;
    import packagesuperrent.classes.*;

    import java.lang.invoke.VarHandle;
    import java.sql.*;
    import java.text.DateFormat;
    import java.text.ParseException;
    import java.text.SimpleDateFormat;
    import java.time.LocalDate;
    import java.util.ArrayList;
    import java.util.Locale;
    import java.util.concurrent.TimeUnit;

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
                Message(e.getMessage());
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
                Message(e.getMessage());
                return false;
            }
        }

        public void insertVehicleType(VehicleType obj) {
            try {
                PreparedStatement ps = connection.prepareStatement("INSERT INTO VehicleType VALUES (?,?,?,?,?,?,?,?,?)");
                ps.setString(1, obj.getVtname());
                ps.setString(2, obj.getFeatures());
                ps.setFloat(3, obj.getWrate());
                ps.setFloat(4, obj.getDrate());
                ps.setFloat(5, obj.getHrate());
                ps.setFloat(6, obj.getWirate());
                ps.setFloat(7, obj.getDirate());
                ps.setFloat(8, obj.getHirate());
                ps.setFloat(9, obj.getKrate());
                ps.executeUpdate();
                connection.commit();
                ps.close();
            } catch (SQLException e) {
                Message(e.getMessage());
                rollbackConnection();
            }
        }

        public void deleteVehicleType(String text) {
            try {
                PreparedStatement ps = connection.prepareStatement("DELETE FROM VehicleType WHERE VTNAME = '"+text+"'");
                int rowCount = ps.executeUpdate();
                if (rowCount == 0) {
                    System.out.println(WARNING_TAG + " VehicleType " + text + " does not exist!");
                }
                connection.commit();
                ps.close();
            } catch (SQLException e) {
                Message(e.getMessage());
                rollbackConnection();
            }
        }
        public ArrayList<VehicleType>  getVehicleTypes() {
            ArrayList<VehicleType> list = new ArrayList<VehicleType>();
            try {
                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM VehicleType");

                while(rs.next()) {
                    list.add(new VehicleType(rs.getString("vtname"),rs.getString("features"),
                            rs.getFloat("wrate"),  rs.getFloat("drate"),  rs.getFloat("hrate"),
                                    rs.getFloat("wirate"),  rs.getFloat("dirate"),
                                            rs.getFloat("hirate"), rs.getFloat("krate")));
                }
                rs.close();
                stmt.close();
            } catch (SQLException e) {
                Message(e.getMessage());
            }
            return list;
        }

        private void rollbackConnection() {
            try  {
                connection.rollback();
            } catch (SQLException e) {
                Message(e.getMessage());
            }
        }

        public void insertVehicle(Vehicle obj) {
            try {

                PreparedStatement ps = connection.prepareStatement("INSERT INTO Vehicle VALUES (?,?,?,?,?,?,?,?,?,?)");
                ps.setInt(1, obj.getVlicense());
                ps.setString(2, obj.getMake());
                ps.setString(3, obj.getModel());
                ps.setInt(4, obj.getVyear());
                ps.setString(5, obj.getColor());
                ps.setInt(6, obj.getOdometer());
                ps.setString(7, obj.getVstatus());
                ps.setString(8, obj.getVtname());
                ps.setString(9, obj.getVlocation());
                ps.setString(10, obj.getCity());
                ps.executeUpdate();
                connection.commit();
                ps.close();
            } catch (SQLException e) {
                Message(e.getMessage());
                rollbackConnection();
            }
        }

        public void deleteVehicle(int parseInt) {
            try {
                PreparedStatement ps = connection.prepareStatement("DELETE FROM Vehicle WHERE vlicense = ?");
                ps.setInt(1, parseInt);
                int rowCount = ps.executeUpdate();
                if (rowCount == 0) {
                    System.out.println(WARNING_TAG + " Vehicle " + parseInt + " does not exist!");
                }
                connection.commit();
                ps.close();
            } catch (SQLException e) {
                Message(e.getMessage());
                rollbackConnection();
            }
        }

        public ArrayList<Vehicle> getVehicles() {
            ArrayList<Vehicle> list = new ArrayList<Vehicle>();
            try {
                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM Vehicle");

                while(rs.next()) {
                    list.add(new Vehicle(rs.getInt("vlicense"),rs.getString("make"),
                            rs.getString("model"),  rs.getInt("vyear"),  rs.getString("color"),
                            rs.getInt("odometer"),  rs.getString("vstatus"),
                            rs.getString("vtname"), rs.getString("vlocation"),
                            rs.getString("city")));
                }
                rs.close();
                stmt.close();
            } catch (SQLException e) {
                Message(e.getMessage());
            }
            return list;
        }
        public void insertCustomer(Customer obj) {
            try {

                PreparedStatement ps = connection.prepareStatement("INSERT INTO Customer VALUES (?,?,?,?)");
                ps.setString(1, obj.getDlicense());
                ps.setString(2, obj.getCellphone());
                ps.setString(3, obj.getCname());
                ps.setString(4, obj.getCaddress());
                ps.executeUpdate();
                connection.commit();
                ps.close();
            } catch (SQLException e) {
                Message(e.getMessage());
                rollbackConnection();
            }
        }

        public void deleteCustomer(String text) {
            try {
                PreparedStatement ps = connection.prepareStatement("DELETE FROM Customer WHERE dlicense = '"+text+"'");
                int rowCount = ps.executeUpdate();
                if (rowCount == 0) {
                    System.out.println(WARNING_TAG + " Customer " + text + " does not exist!");
                }
                connection.commit();
                ps.close();
            } catch (SQLException e) {
                Message(e.getMessage());
                rollbackConnection();
            }
        }

        public ArrayList<Customer> getCustomer() {
            ArrayList<Customer> list = new ArrayList<Customer>();
            try {
                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM Customer");

                while(rs.next()) {
                    list.add(new Customer(rs.getString("dlicense"),rs.getString("cellphone"),
                            rs.getString("cname"),rs.getString("caddress")));
                }
                rs.close();
                stmt.close();
            } catch (SQLException e) {
                System.out.println(EXCEPTION_TAG + " " + e.getMessage());
                rollbackConnection();
            }
            return list;
        }

        public ArrayList<String> getCities() {
            ArrayList<String> list = new ArrayList<String>();
            try {
                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT distinct city FROM Vehicle");

                while(rs.next()) {
                    list.add(rs.getString("city"));
                }
                rs.close();
                stmt.close();
            } catch (SQLException e) {
                Message(e.getMessage());
                rollbackConnection();
            }
            return list;
        }

        public ArrayList<String> getLocations(String cit) {
            ArrayList<String> list = new ArrayList<String>();
            try {
                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT DISTINCT  vlocation FROM Vehicle where city = '"+cit+"'");

                while(rs.next()) {
                    list.add(rs.getString("vlocation"));
                }
                rs.close();
                stmt.close();
            } catch (SQLException e) {
                Message(e.getMessage());
                rollbackConnection();
            }
            return list;
        }

        public ArrayList<String> getVehicleTypes(String loc) {
            ArrayList<String> list = new ArrayList<String>();
            try {
                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT DISTINCT vtname FROM Vehicle where vlocation= '"+loc+"'");

                while(rs.next()) {
                    list.add(rs.getString("vtname"));
                }
                rs.close();
                stmt.close();
            } catch (SQLException e) {
                Message(e.getMessage());
                rollbackConnection();
            }
            return list;
        }


        public void updateVehicle(String vl, String vc, String vcf) {
            try {
                PreparedStatement ps;
                try{
                    ps = connection.prepareStatement("Update Vehicle SET "+vc+"='"+Integer.parseInt(vcf)+"'  WHERE vlicense = '"+Integer.parseInt(vl)+"'");
                } catch (NumberFormatException e) {
                    ps = connection.prepareStatement("Update Vehicle SET "+vc+"='"+vcf+"'  WHERE vlicense = '"+Integer.parseInt(vl)+"'");
                }

                int rowCount = ps.executeUpdate();
                if (rowCount == 0) {
                    System.out.println(WARNING_TAG + " Vehicle " + vl + " does not exist!");
                }
                connection.commit();
                ps.close();
            } catch (SQLException e) {
                Message(e.getMessage());
                rollbackConnection();
            }
        }

        public int getVehicleCounts(String city, String locationType,
                                    String vehicleType, String fromDate,
                                    String fromHourTime, String fromMinuteTime,
                                    String fromSecondTime, String toDate,
                                    String toHourTime, String toMinuteTime,
                                    String toSecondTime) throws ParseException {
            int count = 0;
            try {
                Statement stmt = connection.createStatement();


                SimpleDateFormat  formatTime = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss", Locale.ENGLISH);
                java.sql.Date parsedDate =  new java.sql.Date(
                        formatTime.parse(fromDate + " " + fromHourTime + ":" + fromMinuteTime + ":" + fromSecondTime).getTime());
                Timestamp fTime = new java.sql.Timestamp(parsedDate.getTime());
                java.sql.Date parsedDate2 = new java.sql.Date(
                        formatTime.parse(toDate +" "+toHourTime +":" +toMinuteTime +":"+toSecondTime).getTime());
                Timestamp tTime = new java.sql.Timestamp(parsedDate2.getTime());

                PreparedStatement preparedStatement = connection.prepareStatement("SELECT Count(vlicense) as total FROM Vehicle WHERE vtname = '"+vehicleType+"' AND " +
                        "vlocation = '"+locationType+"' AND city = '"+city+"' AND vstatus = 'for_rent' AND vlicense NOT IN " +
                        "(SELECT vlicense FROM Rent WHERE (fromTime <= ? AND toTime >= ?) or" +
                        " (fromTime <= ? AND toTime >= ?) or" +
                        " (fromTime <= ? AND toTime >= ?) or (fromTime >= ? AND toTime <= ?))");

                preparedStatement.setTimestamp(1,fTime);
                preparedStatement.setTimestamp(2,tTime);
                preparedStatement.setTimestamp(3,tTime);
                preparedStatement.setTimestamp(4,tTime);
                preparedStatement.setTimestamp(5,fTime);
                preparedStatement.setTimestamp(6,fTime);
                preparedStatement.setTimestamp(7,fTime);
                preparedStatement.setTimestamp(8,tTime);
                ResultSet rs = preparedStatement.executeQuery();

                while(rs.next()) {
                    count = rs.getInt("total");
                }
                rs.close();
                stmt.close();
            } catch (SQLException e) {
                Message(e.getMessage());
            }
            return count;
        }


        public  ArrayList<Vehicle> getAvailableVehicles(String city, String locationType,
                                                        String vehicleType, String fromDate,
                                                        String fromHourTime, String fromMinuteTime,
                                                        String fromSecondTime, String toDate,
                                                        String toHourTime, String toMinuteTime,
                                                        String toSecondTime) throws ParseException {
            ArrayList<Vehicle> list = new ArrayList<Vehicle>();
            try {
                Statement stmt = connection.createStatement();

                SimpleDateFormat  formatTime = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss", Locale.ENGLISH);
                java.sql.Date parsedDate =  new java.sql.Date(
                        formatTime.parse(fromDate + " " + fromHourTime + ":" + fromMinuteTime + ":" + fromSecondTime).getTime());
                Timestamp fTime = new java.sql.Timestamp(parsedDate.getTime());
                java.sql.Date parsedDate2 = new java.sql.Date(
                        formatTime.parse(toDate +" "+toHourTime +":" +toMinuteTime +":"+toSecondTime).getTime());
                Timestamp tTime = new java.sql.Timestamp(parsedDate2.getTime());

                PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Vehicle WHERE vtname = '"+vehicleType+"' AND " +
                        "vlocation = '"+locationType+"' AND city = '"+city+"' AND vstatus = 'for_rent' AND vlicense NOT IN " +
                        "(SELECT vlicense FROM Rent WHERE (fromTime <= ? AND toTime >= ?) or (fromTime <= ? AND toTime >= ?) " +
                        "or (fromTime <= ? AND toTime >= ?)or (fromTime >= ? AND toTime <= ?))");

                preparedStatement.setTimestamp(1,fTime);
                preparedStatement.setTimestamp(2,tTime);

                preparedStatement.setTimestamp(3,tTime);
                preparedStatement.setTimestamp(4,tTime);
                preparedStatement.setTimestamp(5,fTime);
                preparedStatement.setTimestamp(6,fTime);

                preparedStatement.setTimestamp(7,fTime);
                preparedStatement.setTimestamp(8,tTime);
                ResultSet rs = preparedStatement.executeQuery();
                while(rs.next()) {
                    list.add(new Vehicle(rs.getInt("vlicense"),rs.getString("make"),
                            rs.getString("model"),  rs.getInt("vyear"),  rs.getString("color"),
                            rs.getInt("odometer"),  rs.getString("vstatus"),
                            rs.getString("vtname"), rs.getString("vlocation"),
                            rs.getString("city")));
                }
                rs.close();
                stmt.close();
            } catch (SQLException e) {
                Message(e.getMessage());
            }
            return list;
        }

        public  ArrayList<Vehicle> getAvailableVehicles(String city, String locationType,
                                                        String vehicleType, String fromDate,
                                                        String fromTime, String toDate,
                                                        String toTime) {
            ArrayList<Vehicle> list = new ArrayList<Vehicle>();
            try {
                Statement stmt = connection.createStatement();
                DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
                java.util.Date utilDate = format.parse(fromDate);
                java.sql.Date fromDat = new java.sql.Date(utilDate.getTime());

                java.util.Date utilDate2 = format.parse(toDate);
                java.sql.Date tD = new java.sql.Date(utilDate2.getTime());

                SimpleDateFormat  formatTime = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss", Locale.ENGLISH);
                java.sql.Date parsedDate =  new java.sql.Date(
                        formatTime.parse(fromDate + " " + fromTime).getTime());
                Timestamp fTime = new java.sql.Timestamp(parsedDate.getTime());
                java.sql.Date parsedDate2 = new java.sql.Date(
                        formatTime.parse(toDate +" "+toTime).getTime());
                Timestamp tTime = new java.sql.Timestamp(parsedDate2.getTime());

                PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Vehicle WHERE vtname = '"+vehicleType+"' AND " +
                        "vlocation = '"+locationType+"' AND city = '"+city+"' AND vstatus = 'for_rent' AND vlicense NOT IN " +
                        "(SELECT vlicense FROM Rent WHERE (fromTime <= ? AND toTime >= ?)  " +
                        "or (fromTime <= ? AND toTime >= ?) or (fromTime <= ? AND toTime >= ?)" +
                        "or (fromTime >= ? AND toTime <= ?))");

                preparedStatement.setTimestamp(1,fTime);
                preparedStatement.setTimestamp(2,tTime);
                preparedStatement.setTimestamp(3,tTime);
                preparedStatement.setTimestamp(4,tTime);
                preparedStatement.setTimestamp(5,fTime);
                preparedStatement.setTimestamp(6,fTime);
                preparedStatement.setTimestamp(7,fTime);
                preparedStatement.setTimestamp(8,fTime);
                ResultSet rs = preparedStatement.executeQuery();
                while(rs.next()) {
                    list.add(new Vehicle(rs.getInt("vlicense"),rs.getString("make"),
                            rs.getString("model"),  rs.getInt("vyear"),  rs.getString("color"),
                            rs.getInt("odometer"),  rs.getString("vstatus"),
                            rs.getString("vtname"), rs.getString("vlocation"),
                            rs.getString("city")));
                }
                rs.close();
                stmt.close();
            } catch (SQLException | ParseException e) {
                Message(e.getMessage());
            }
            return list;
        }

        private int GetRentNumber()
        {
            int conf = 0;
            try {
                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery("select rid from Rent ORDER BY rid DESC FETCH FIRST 1 ROWS ONLY");
                while(rs.next()) {
                    conf = rs.getInt("rid");
                }
                rs.close();
                stmt.close();
            } catch (SQLException e) {
                Message(e.getMessage(),"GetConfirmationNumber ");
                conf = 0;
            }
            return conf;
        }

        private int GetConfirmationNumber()
        {
            int conf = 0;
            try {
                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery("select confNo from Reservation ORDER BY confNo DESC FETCH FIRST 1 ROWS ONLY");
                while(rs.next()) {
                    conf = rs.getInt("confNo");
                }
                rs.close();
                stmt.close();
            } catch (SQLException e) {
                Message(e.getMessage(),"GetConfirmationNumber ");
                conf = 0;
            }
            return conf;
        }

        public int ReserveVehicle(Vehicle vehicle, String dl, String fromDate,
                                   String fromHourTime, String fromMinuteTime,
                                   String fromSecondTime, String toDate,
                                   String toHourTime, String toMinuteTime,
                                   String toSecondTime) throws ParseException {
            //convert single to double

            DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
            java.util.Date utilDate = format.parse(fromDate);
            java.sql.Date fromDat = new java.sql.Date(utilDate.getTime());

            java.util.Date utilDate2 = format.parse(toDate);
            java.sql.Date tD = new java.sql.Date(utilDate2.getTime());

            SimpleDateFormat  formatTime = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss", Locale.ENGLISH);
            java.sql.Date parsedDate =  new java.sql.Date(
                    formatTime.parse(fromDate + " " + fromHourTime + ":" + fromMinuteTime + ":" + fromSecondTime).getTime());
            Timestamp fTime = new java.sql.Timestamp(parsedDate.getTime());
            java.sql.Date parsedDate2 = new java.sql.Date(
                    formatTime.parse(toDate +" "+toHourTime +":" +toMinuteTime +":"+toSecondTime).getTime());
            Timestamp tTime = new java.sql.Timestamp(parsedDate2.getTime());

            int confirmationNumber = GetConfirmationNumber() + 1;
            try {
                PreparedStatement ps = connection.prepareStatement("INSERT INTO Reservation VALUES (?,?,?,?,?,?,?)");
                ps.setInt(1, confirmationNumber);
                ps.setString(2, vehicle.getVtname());
                ps.setString(3, dl);
                ps.setDate(4, fromDat);
                ps.setTimestamp(5, fTime);
                ps.setDate(6, tD);
                ps.setTimestamp(7, tTime);
                ps.executeUpdate();
                connection.commit();
                ps.close();
            } catch (SQLException e) {
                Message(e.getMessage(),"ReserveVehicle");
                rollbackConnection();
                confirmationNumber = 0;
            }
            return confirmationNumber;
        }

        public void DeleteRent(int parseInt) {
            try {
                Boolean done = false;
                PreparedStatement ps = connection.prepareStatement("DELETE FROM rent WHERE rid = ?");
                ps.setInt(1, parseInt);
                int rowCount = ps.executeUpdate();
                if (rowCount == 0) {
                    done = true;
                }
                connection.commit();
                ps.close();
                if(done)
                {
                    Message(" Rent " + parseInt + " does not exist!");
                }
                else
                {
                    Message("Rent Deleted");
                }

            } catch (SQLException e) {
                Message(e.getMessage());
                rollbackConnection();
            }
        }

        public void DeleteReservation(int parseInt) {
            try {
                Boolean done = false;
                PreparedStatement ps = connection.prepareStatement("DELETE FROM reservation WHERE confNo = ?");
                ps.setInt(1, parseInt);
                int rowCount = ps.executeUpdate();
                if (rowCount == 0) {
                    done = true;
                }
                connection.commit();
                ps.close();
                if(done)
                {
                    Message(" Reservation " + parseInt + " does not exist!");
                }
                else
                {
                    Message("Reservation Deleted");
                }

            } catch (SQLException e) {
                Message(e.getMessage());
                rollbackConnection();
            }
        }

        public ArrayList<Reservation> getReservations() {
            ArrayList<Reservation> list = new ArrayList<Reservation>();
            try {
                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM Reservation ");
                while(rs.next()) {

                    list.add(
                            new Reservation(rs.getInt("confNo"),
                            rs.getString("vtname"),
                            rs.getString("dlicense"),
                            rs.getDate("fromDate").toString(),
                                    new SimpleDateFormat(
                                            "HH:mm:ss").format(
                                                    new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(
                                                            rs.getTimestamp("fromTime").toString())),
                            rs.getDate( "toDate").toString(),
                                    new SimpleDateFormat(
                                            "HH:mm:ss").format(
                                            new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(
                                                    rs.getTimestamp("toTime").toString()))));
                }
                rs.close();
                stmt.close();
            } catch (SQLException e) {
                Message(e.getMessage());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            return list;
        }

        public ArrayList<Vehicle> getAvailableVehiclesFromConfirmation(String confN, String city, String location) {
            int confNo = Integer.parseInt(confN);
            ArrayList<Reservation> list = new ArrayList<Reservation>();
            try {
                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM Reservation where confNo ="+confNo);
                while(rs.next()) {
                    list.add(
                            new Reservation(rs.getInt("confNo"),
                                    rs.getString("vtname"),
                                    rs.getString("dlicense"),
                                    rs.getDate("fromDate").toString(),
                                    new SimpleDateFormat(
                                            "HH:mm:ss").format(
                                            new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(
                                                    rs.getTimestamp("fromTime").toString())),
                                    rs.getDate( "toDate").toString(),
                                    new SimpleDateFormat(
                                            "HH:mm:ss").format(
                                            new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(
                                                    rs.getTimestamp("toTime").toString()))));
                }
                rs.close();
                stmt.close();
            } catch (SQLException e) {
                Message(e.getMessage());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            Reservation main = list.get(0);
            return getAvailableVehicles(city, location,
                    main.getVtname(), main.getFromDate(),
                    main.getFromTime(),  main.getToDate(),
                    main.getToTime());
        }

        public String getReservation(int parseInt) {
            String text = "";
            ArrayList<Reservation> list = new ArrayList<Reservation>();
            try {
                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM Reservation where confNo ="+parseInt);
                while(rs.next()) {

                    list.add(
                            new Reservation(rs.getInt("confNo"),
                                    rs.getString("vtname"),
                                    rs.getString("dlicense"),
                                    rs.getDate("fromDate").toString(),
                                    new SimpleDateFormat(
                                            "HH:mm:ss").format(
                                            new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(
                                                    rs.getTimestamp("fromTime").toString())),
                                    rs.getDate( "toDate").toString(),
                                    new SimpleDateFormat(
                                            "HH:mm:ss").format(
                                            new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(
                                                    rs.getTimestamp("toTime").toString()))));
                }
                rs.close();
                stmt.close();
            } catch (SQLException e) {
                Message(e.getMessage());
            } catch (ParseException e) {
                e.printStackTrace();
            }

            for(Reservation r:list)
            {
                text+="From Date_"+r.getFromDate() + "; ";
                text+="From Time_"+r.getFromTime() + "; ";
                text+="To Date_"+r.getToDate() + "; ";
                text+="To Time_"+r.getToTime() + "; ";
            }

            return text;
        }

        public String getBilling(String confN, Vehicle vehicle) {
            VehicleType vehicleType = null;
            for (VehicleType object: DatabaseConnection.getDatabase().getVehicleTypes()) {
                if(object.getVtname().equals(vehicle.getVtname()))
                {
                    vehicleType = object;
                }
            }

            int confNo = Integer.parseInt(confN);
            ArrayList<Reservation> list = new ArrayList<Reservation>();
            try {
                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM Reservation where confNo ="+confNo);
                while(rs.next()) {
                    list.add(
                            new Reservation(rs.getInt("confNo"),
                                    rs.getString("vtname"),
                                    rs.getString("dlicense"),
                                    rs.getDate("fromDate").toString(),
                                    new SimpleDateFormat(
                                            "HH:mm:ss").format(
                                            new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(
                                                    rs.getTimestamp("fromTime").toString())),
                                    rs.getDate( "toDate").toString(),
                                    new SimpleDateFormat(
                                            "HH:mm:ss").format(
                                            new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(
                                                    rs.getTimestamp("toTime").toString()))));
                }
                rs.close();
                stmt.close();
            } catch (SQLException e) {
                Message(e.getMessage());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            Reservation reservation = list.get(0);

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.ENGLISH);
            java.util.Date firstDate = null;
            java.util.Date secondDate = null;
            try {
                firstDate = sdf.parse(reservation.getFromDate()+" "+reservation.getFromTime());
                secondDate = sdf.parse(reservation.getToDate()+" "+reservation.getToTime());
            } catch (ParseException e) {
                e.printStackTrace();
            }


            long diffInMillies = Math.abs(secondDate.getTime() - firstDate.getTime());
            long diffHours = TimeUnit.HOURS.convert(diffInMillies, TimeUnit.MILLISECONDS);

            if(diffHours >= 7*24)
            {
                float price = diffHours/(7*24) * vehicleType.getWrate() *vehicleType.getWirate();
                String result = "Weekly rates Selected "+"\n"+"Weekly Rate: " +vehicleType.getWrate()
                        +"\n"+"Weekly Insurance: " +vehicleType.getWirate()
                        +"\n"+ "Weekly Duration : " + diffHours/(7*24)
                        + "\n"+ "Calculation: Rate* Insurance* Weeks "+ price;
                if(vehicle.getVtname().contains("electric") || vehicle.getVtname().contains("hybrid"))
                {
                    result += "\n" + "Additional Surcharge for Hybrid/Electric: 10$";
                    price+=10;
                }
                result += "\n" + "Total$ "+ price;
                return result;
            }
            else if(diffHours >= 24)
            {
                float price = diffHours/(24) * vehicleType.getDrate() * vehicleType.getDirate();
                String result = "Daily rates Selected "+"\n"+"Daily Rate: " +vehicleType.getDrate()
                        +"\n"+"Daily Insurance: " +vehicleType.getDirate()
                        +"\n"+ "Daily Duration: " + diffHours/(24)
                        + "\n"+ "Calculation: Rate* Insurance* Daily "+ price;
                if(vehicle.getVtname().contains("electric") || vehicle.getVtname().contains("hybrid"))
                {
                    result += "\n" + "Additional Surcharge for Hybrid/Electric: 10$";
                    price+=10;
                }
                result += "\n" + "Total$ "+ price;
                return result;
            }
            else
            {
                float price = diffHours * vehicleType.getHrate() * vehicleType.getHirate();
                String result = "Daily rates Selected "+"\n"+"Daily Rate: " +vehicleType.getHrate()
                        +"\n"+"Daily Insurance: " +vehicleType.getHirate()
                        +"\n"+ "Daily Duration :" + diffHours
                        + "\n"+ "Calculation: Rate* Insurance* Daily "+ price;
                if(vehicle.getVtname().contains("electric") || vehicle.getVtname().contains("hybrid"))
                {
                    result += "\n" + "Additional Surcharge for Hybrid/Electric: 10$";
                    price+=10;
                }
                result += "\n" + "Total$ "+ price;
                return result;
            }
        }

        public int insertRent(Vehicle vehicle, String ConfNo, String name, String no, String expDate) throws ParseException {

            int confNo = Integer.parseInt(ConfNo);
            ArrayList<Reservation> list = new ArrayList<Reservation>();
            try {
                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM Reservation where confNo ="+confNo);
                while(rs.next()) {
                    list.add(
                            new Reservation(rs.getInt("confNo"),
                                    rs.getString("vtname"),
                                    rs.getString("dlicense"),
                                    rs.getDate("fromDate").toString(),
                                    new SimpleDateFormat(
                                            "HH:mm:ss").format(
                                            new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(
                                                    rs.getTimestamp("fromTime").toString())),
                                    rs.getDate( "toDate").toString(),
                                    new SimpleDateFormat(
                                            "HH:mm:ss").format(
                                            new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(
                                                    rs.getTimestamp("toTime").toString()))));
                }
                rs.close();
                stmt.close();
            } catch (SQLException e) {
                Message(e.getMessage());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            Reservation reservation = list.get(0);

            DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
            java.util.Date utilDate = format.parse(reservation.getFromDate());
            java.sql.Date fromDat = new java.sql.Date(utilDate.getTime());

            java.util.Date utilDate2 = format.parse(reservation.getToDate());
            java.sql.Date tD = new java.sql.Date(utilDate2.getTime());

            SimpleDateFormat  formatTime = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss", Locale.ENGLISH);
            java.sql.Date parsedDate =  new java.sql.Date(
                    formatTime.parse(reservation.getFromDate() + " " + reservation.getFromTime()).getTime());
            Timestamp fTime = new java.sql.Timestamp(parsedDate.getTime());
            java.sql.Date parsedDate2 = new java.sql.Date(
                    formatTime.parse(reservation.getToDate() +" "+ reservation.getToTime()).getTime());
            Timestamp tTime = new java.sql.Timestamp(parsedDate2.getTime());

            int rNo = GetRentNumber() + 1;
            try {
                //rid, vlicense, dlicense, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo
                PreparedStatement ps = connection.prepareStatement("INSERT INTO Rent VALUES (?,?,?,?,?,?,?,?,?,?,?,?)");
                ps.setInt(1, rNo);
                ps.setInt(2, vehicle.getVlicense());
                ps.setString(3, reservation.getDlicense());
                ps.setDate(4, fromDat);
                ps.setTimestamp(5, fTime);
                ps.setDate(6, tD);
                ps.setTimestamp(7, tTime);
                ps.setInt(8, vehicle.getOdometer());
                ps.setString(9, name);
                ps.setString(10, no);
                ps.setString(11, expDate);
                ps.setInt(12, confNo);
                ps.executeUpdate();
                connection.commit();
                ps.close();
                Message("Rent Successfull!");

                //updateVehicle( Integer.toString(vehicle.getVlicense()), "vstatus","rented");

            } catch (SQLException e) {
                Message(e.getMessage(),"RentVehicle");
                rollbackConnection();
                rNo = 0;
            }

            return rNo;
        }

        private void UpdateVehicleStatus(String rented) {

        }

        public void upDateReservation(int confNo, String text) {
            String[] parts = text.split(";");
            String fromDate = (parts[0].split("_")[1]).trim();
            String fromTime = (parts[1].split("_")[1]).trim();
            String toDate = (parts[2].split("_")[1]).trim();
            String toTime = (parts[3].split("_")[1]).trim();

            try {
                UpdateVehicle(confNo, fromDate,
                         fromTime,  toDate,
                         toTime);

            } catch (ParseException e) {
                e.printStackTrace();
            }

        }

        private void UpdateVehicle(int confirmationNumber, String fromDate, String fromTime, String toDate, String toTime) throws ParseException {
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
            java.util.Date utilDate = format.parse(fromDate);
            java.sql.Date fromDat = new java.sql.Date(utilDate.getTime());

            java.util.Date utilDate2 = format.parse(toDate);
            java.sql.Date tD = new java.sql.Date(utilDate2.getTime());

            SimpleDateFormat  formatTime = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss", Locale.ENGLISH);
            java.sql.Date parsedDate =  new java.sql.Date(
                    formatTime.parse(fromDate + " " + fromTime).getTime());
            Timestamp fTime = new java.sql.Timestamp(parsedDate.getTime());
            java.sql.Date parsedDate2 = new java.sql.Date(
                    formatTime.parse(toDate +" "+toTime).getTime());
            Timestamp tTime = new java.sql.Timestamp(parsedDate2.getTime());
            try {
                PreparedStatement ps = connection.prepareStatement("Update Reservation SET fromDate=? , fromTime=? , toDate=? , toTime=? Where confNo =? ");
                ps.setInt(5, confirmationNumber);
                ps.setDate(1, fromDat);
                ps.setTimestamp(2, fTime);
                ps.setDate(3, tD);
                ps.setTimestamp(4, tTime);
                ps.executeUpdate();
                connection.commit();
                ps.close();
                Message("Updated Successfully!");
            } catch (SQLException e) {
                Message(e.getMessage(),"ReserveVehicle");
                rollbackConnection();
            }
        }


        public int insertRent(Vehicle vehicle, String dl, String clerkCity, String clerkLocation,
                              String vehicleType, String fromDate, String fromtime, String toDate, String toTime,
                              String cardName, String cardNo, String expDate) throws ParseException {

            DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
            java.util.Date utilDate = format.parse(fromDate);
            java.sql.Date fromDat = new java.sql.Date(utilDate.getTime());

            java.util.Date utilDate2 = format.parse(toDate);
            java.sql.Date tD = new java.sql.Date(utilDate2.getTime());

            SimpleDateFormat  formatTime = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss", Locale.ENGLISH);
            java.sql.Date parsedDate =  new java.sql.Date(
                    formatTime.parse(fromDate + " " + fromtime).getTime());
            Timestamp fTime = new java.sql.Timestamp(parsedDate.getTime());
            java.sql.Date parsedDate2 = new java.sql.Date(
                    formatTime.parse(toDate +" "+ toTime).getTime());
            Timestamp tTime = new java.sql.Timestamp(parsedDate2.getTime());

            int rNo = GetRentNumber() + 1;
            try {
                //rid, vlicense, dlicense, fromDate, fromTime, toDate, toTime, odometer, cardName, cardNo, expDate, confNo
                PreparedStatement ps = connection.prepareStatement("INSERT INTO Rent VALUES (?,?,?,?,?,?,?,?,?,?,?,?)");
                ps.setInt(1, rNo);
                ps.setInt(2, vehicle.getVlicense());
                ps.setString(3, dl);
                ps.setDate(4, fromDat);
                ps.setTimestamp(5, fTime);
                ps.setDate(6, tD);
                ps.setTimestamp(7, tTime);
                ps.setInt(8, vehicle.getOdometer());
                ps.setString(9, cardName);
                ps.setString(10, cardNo);
                ps.setString(11, expDate);
                ps.setNull(12, java.sql.Types.INTEGER);
                ps.executeUpdate();
                connection.commit();
                ps.close();
                Message("Rent Successfull!");
            } catch (SQLException e) {
                Message(e.getMessage(),"RentVehicle");
                rollbackConnection();
                rNo = 0;
            }

            return rNo;
        }

        public String getBilling(String vehicleTypes, String fromDate, String fromtime, String toDate, String toTime, Vehicle vehicle) {
            VehicleType vehicleType = null;
            for (VehicleType object: DatabaseConnection.getDatabase().getVehicleTypes()) {
                if(object.getVtname().equals(vehicle.getVtname()))
                {
                    vehicleType = object;
                }
            }

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.ENGLISH);
            java.util.Date firstDate = null;
            java.util.Date secondDate = null;
            try {
                firstDate = sdf.parse(fromDate+" "+fromtime);
                secondDate = sdf.parse(toDate+" "+toTime);
            } catch (ParseException e) {
                e.printStackTrace();
            }

            long diffInMillies = Math.abs(secondDate.getTime() - firstDate.getTime());
            long diffHours = TimeUnit.HOURS.convert(diffInMillies, TimeUnit.MILLISECONDS);

            if(diffHours >= 7*24)
            {
                float price = diffHours/(7*24) * vehicleType.getWrate() *vehicleType.getWirate();
                String result = "Weekly rates Selected "+"\n"+"Weekly Rate: " +vehicleType.getWrate()
                        +"\n"+"Weekly Insurance: " +vehicleType.getWirate()
                        +"\n"+ "Weekly Duration : " + diffHours/(7*24)
                        + "\n"+ "Calculation: Rate* Insurance* Weeks "+ price;
                if(vehicle.getVtname().contains("electric") || vehicle.getVtname().contains("hybrid"))
                {
                    result += "\n" + "Additional Surcharge for Hybrid/Electric: 10$";
                    price+=10;
                }
                result += "\n" + "Total$ "+ price;
                return result;
            }
            else if(diffHours >= 24)
            {
                float price = diffHours/(24) * vehicleType.getDrate() * vehicleType.getDirate();
                String result = "Daily rates Selected "+"\n"+"Daily Rate: " +vehicleType.getDrate()
                        +"\n"+"Daily Insurance: " +vehicleType.getDirate()
                        +"\n"+ "Daily Duration: " + diffHours/(24)
                        + "\n"+ "Calculation: Rate* Insurance* Daily "+ price;
                if(vehicle.getVtname().contains("electric") || vehicle.getVtname().contains("hybrid"))
                {
                    result += "\n" + "Additional Surcharge for Hybrid/Electric: 10$";
                    price+=10;
                }
                result += "\n" + "Total$ "+ price;
                return result;
            }
            else
            {
                float price = diffHours * vehicleType.getHrate() * vehicleType.getHirate();
                String result = "Daily rates Selected "+"\n"+"Daily Rate: " +vehicleType.getHrate()
                        +"\n"+"Daily Insurance: " +vehicleType.getHirate()
                        +"\n"+ "Daily Duration :" + diffHours
                        + "\n"+ "Calculation: Rate* Insurance* Daily "+ price;
                if(vehicle.getVtname().contains("electric") || vehicle.getVtname().contains("hybrid"))
                {
                    result += "\n" + "Additional Surcharge for Hybrid/Electric: 10$";
                    price+=10;
                }
                result += "\n" + "Total$ "+ price;
                return result;
            }
        }

        private void Message(String message)
        {
            Alert alert = new Alert(Alert.AlertType.INFORMATION);
            alert.setTitle("Alert");
            alert.setHeaderText("SQL Message");
            alert.setContentText(message);
            alert.showAndWait().ifPresent(rs -> {
                if (rs == ButtonType.OK) {
                    System.out.println("Pressed OK.");
                }
            });
        }

        private void Message(String message, String table)
        {
            Alert alert = new Alert(Alert.AlertType.INFORMATION);
            alert.setTitle("Alert");
            alert.setHeaderText(table);
            alert.setContentText(message);
            alert.showAndWait().ifPresent(rs -> {
                if (rs == ButtonType.OK) {
                    System.out.println("Pressed OK.");
                }
            });
        }

        public ArrayList<Rent>  getRentals() {
            ArrayList<Rent> list = new ArrayList<Rent>();
            try {
                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM Rent");
                while(rs.next()) {
                    list.add(new Rent(rs.getInt("rid"),
                                    rs.getInt("vlicense"),
                                    rs.getString("dlicense"),
                                    rs.getDate("fromDate").toString(),
                                    new SimpleDateFormat("HH:mm:ss").format(
                                            new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(
                                                    rs.getTimestamp("fromTime").toString())),
                                    rs.getDate( "toDate").toString(),
                                    new SimpleDateFormat("HH:mm:ss").format(
                                            new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(
                                                    rs.getTimestamp("toTime").toString())),
                                        rs.getInt("odometer"),
                                        rs.getString("cardName"),
                                        rs.getInt("cardNo"), rs.getString("ExpDate"),
                                         rs.getInt("confNo")));
                }
                rs.close();
                stmt.close();
            }
            catch (SQLException e) {
                Message(e.getMessage());
            }
            catch (ParseException e) {
                e.printStackTrace();
            }
            return list;
        }

        public ArrayList<Return> getReturn() {
            ArrayList<Return> list = new ArrayList<>();
            try {
                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM Return_");
                while(rs.next()) {
                    list.add(new Return(rs.getInt("rid"),
                            rs.getDate("rdate").toString(),
                            new SimpleDateFormat("HH:mm:ss").format(
                                    new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(
                                            rs.getTimestamp("rtime").toString())),
                            rs.getInt("odometer"),
                            rs.getString("fulltank"),
                            rs.getFloat("valueit")));
                }
                rs.close();
                stmt.close();
            }
            catch (SQLException e) {
                Message(e.getMessage());
            }
            catch (ParseException e) {
                e.printStackTrace();
            }
            return list;
        }

        public float getBilling(String rid, String odo, String tank, String date, String time) {
            return Float.parseFloat(getBilling(rid, odo, tank, date, time, true));
        }

        public void InsertReturn(String rid, String odo, String tank, String date, String time, float price) throws ParseException {

            DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);

            java.util.Date utilDate2 = format.parse(date);
            java.sql.Date tD = new java.sql.Date(utilDate2.getTime());

            SimpleDateFormat  formatTime = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss", Locale.ENGLISH);
            java.sql.Date parsedDate2 = new java.sql.Date(formatTime.parse(date +" "+ time).getTime());
            Timestamp tTime = new java.sql.Timestamp(parsedDate2.getTime());

            try {
                PreparedStatement ps = connection.prepareStatement("INSERT INTO Return_ VALUES (?,?,?,?,?,?)");
                ps.setInt(1, Integer.parseInt(rid));
                ps.setDate(2, tD);
                ps.setTimestamp(3, tTime);
                ps.setInt(4, Integer.parseInt(odo));
                ps.setString(5, tank);
                ps.setFloat(6, price);
                ps.executeUpdate();
                connection.commit();
                ps.close();
                Message("Return Successfull!");
                Rent rent = getRent(rid);
                Vehicle vehicle = getVehicle(rent.getVlicense());
                updateVehicle(String.valueOf(vehicle.getVlicense()) , "odometer", odo);
            } catch (SQLException e) {
                Message(e.getMessage(),"ReturnVehicle");
                rollbackConnection();
            }
        }

        public String getBillingString(String rid, String odo, String tank, String date, String time) {
            return getBilling( rid,  odo,  tank,  date,  time, false);
        }

        public Rent getRent(String rid)
        {
            Rent rent = null;
            for(Rent rr: getRentals())
            {
                if(Integer.parseInt(rid) == rr.getRid())
                {
                    rent = rr;
                }
            }
            return rent;
        }

        public Vehicle getVehicle(int vl)
        {
            Vehicle v= null;
            for(Vehicle v1: getVehicles())
            {
                if(v1.getVlicense() == vl)
                {
                    v= v1;
                }
            }
            return v;
        }


        public String getBilling(String rid, String odo, String tank, String date, String time, Boolean onlyPrice)
        {
            Rent rent = getRent(rid);
            Vehicle vehicle = getVehicle(rent.getVlicense());
            int odoMeter = Integer.parseInt(odo);

            VehicleType vehicleType = null;
            for (VehicleType object: DatabaseConnection.getDatabase().getVehicleTypes()) {
                if(object.getVtname().equals(vehicle.getVtname()))
                {
                    vehicleType = object;
                }
            }

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.ENGLISH);
            java.util.Date firstDate = null;
            java.util.Date secondDate = null;
            try {
                firstDate = sdf.parse(rent.getFromDate()+" "+rent.getFromTime());
                secondDate = sdf.parse(date+" "+time);
            } catch (ParseException e) {
                e.printStackTrace();
            }


            long diffInMillies = Math.abs(secondDate.getTime() - firstDate.getTime());
            long diffHours = TimeUnit.HOURS.convert(diffInMillies, TimeUnit.MILLISECONDS);

            int odoDiff = odoMeter - vehicle.getOdometer();

            if(diffHours >= 7*24)
            {
                float price = diffHours/(7*24) * vehicleType.getWrate() *vehicleType.getWirate();
                if(!onlyPrice)
                {
                    String result = "Weekly rates Selected "+"\n"+"Weekly Rate: " +vehicleType.getWrate()
                            +"\n"+"Weekly Insurance: " +vehicleType.getWirate()
                            +"\n"+ "Weekly Duration : " + diffHours/(7*24)
                            + "\n"+ "Calculation: Rate* Insurance* Weeks "+ price;
                    if(vehicle.getVtname().contains("electric") || vehicle.getVtname().contains("hybrid"))
                    {
                        result += "\n" + "Additional Surcharge for Hybrid/Electric: 10$";
                        price+=10;
                    }
                    if(odoDiff > 500)
                    {
                        result += "\n" + "Additional km charges fine:$ "+vehicleType.getKrate()* (odoDiff - 500);
                        price+=vehicleType.getKrate()* (odoDiff - 500);
                    }
                    result += "\n" + "Total$ "+ price;
                    return result;
                }
                return String.valueOf(price);

            }
            else if(diffHours >= 24)
            {
                float price = diffHours/(24) * vehicleType.getDrate() * vehicleType.getDirate();
                if(!onlyPrice)
                {
                String result = "Daily rates Selected "+"\n"+"Daily Rate: " +vehicleType.getDrate()
                        +"\n"+"Daily Insurance: " +vehicleType.getDirate()
                        +"\n"+ "Daily Duration: " + diffHours/(24)
                        + "\n"+ "Calculation: Rate* Insurance* Daily "+ price;
                if(vehicle.getVtname().contains("electric") || vehicle.getVtname().contains("hybrid"))
                {
                    result += "\n" + "Additional Surcharge for Hybrid/Electric: 10$";
                    price+=10;
                }
                    if(odoDiff > 500)
                    {
                        result += "\n" + "Additional km charges fine:$ "+vehicleType.getKrate()* (odoDiff - 500);
                        price+=vehicleType.getKrate()* (odoDiff - 500);
                    }
                result += "\n" + "Total$ "+ price;
                return result;
                }
                return String.valueOf(price);
            }
            else
            {
                float price = diffHours * vehicleType.getHrate() * vehicleType.getHirate();
                if(!onlyPrice)
                {
                String result = "Daily rates Selected "+"\n"+"Daily Rate: " +vehicleType.getHrate()
                        +"\n"+"Daily Insurance: " +vehicleType.getHirate()
                        +"\n"+ "Daily Duration :" + diffHours
                        + "\n"+ "Calculation: Rate* Insurance* Daily "+ price;
                if(vehicle.getVtname().contains("electric") || vehicle.getVtname().contains("hybrid"))
                {
                    result += "\n" + "Additional Surcharge for Hybrid/Electric: 10$";
                    price+=10;
                }
                    if(odoDiff > 500)
                    {
                        result += "\n" + "Additional km charges fine:$ "+vehicleType.getKrate()* (odoDiff -  500);
                        price+=vehicleType.getKrate()* (odoDiff - 500);
                    }
                result += "\n" + "Total$ "+ price;
                return result;
                }
                return String.valueOf(price);
            }
        }

        public ArrayList<Report> getReports(String choice, String city, String location, String date) {
            ArrayList<Report> list = new ArrayList<>();
            try {
                Statement stmt = connection.createStatement();
                PreparedStatement preparedStatement;
                if(location.isEmpty())
                {
                    preparedStatement = connection.prepareStatement("SELECT r.fromDate as d1, v.vlocation as l1 ," +
                            " SUM (COUNT (v.vlicense)) OVER (PARTITION BY v.vlocation ORDER BY v.vlocation ASC) as c2" +
                            ", v.vtname as t1, " +
                            "SUM (COUNT (v.vlicense)) OVER (PARTITION BY v.vtname) as c1 FROM Vehicle v, Rent r " +
                            "WHERE r.vlicense = v.vlicense GROUP BY v.vlocation, v.vtname, r.fromDate " +
                            "HAVING r.fromDate = TO_TIMESTAMP('"+date+"', 'YYYY-MM-DD')  " +
                            "ORDER BY r.fromDate ASC, v.vlocation ASC");
                }
                else
                {
                    preparedStatement = connection.prepareStatement("SELECT r.fromDate as d1, v.vlocation as l1 ," +
                            " SUM (COUNT (v.vlicense)) OVER (PARTITION BY v.vlocation ORDER BY v.vlocation ASC) as c2" +
                            ", v.vtname as t1, " +
                            "SUM (COUNT (v.vlicense)) OVER (PARTITION BY v.vtname) as c1 FROM Vehicle v, Rent r " +
                            "WHERE  v.vlocation = '"+location+"' AND r.vlicense = v.vlicense GROUP BY v.vlocation, v.vtname, r.fromDate " +
                            "HAVING r.fromDate = TO_TIMESTAMP('"+date+"', 'YYYY-MM-DD')  " +
                            "ORDER BY r.fromDate ASC, v.vlocation ASC");
                }


                ResultSet rs = preparedStatement.executeQuery();

                while(rs.next()) {

                  list.add(new Report(
                          rs.getDate("d1").toString(),
                          rs.getString("l1"),
                                  rs.getString("t1"),
                          rs.getInt("c2"),
                          rs.getInt("c1")
                  ));
                }
                rs.close();
                stmt.close();
            } catch (SQLException e) {
                Message(e.getMessage());
            }

            return list;
        }

        public ArrayList<ReturnReport> getReturnReports(String choice, String city, String location, String date) {
            ArrayList<ReturnReport> list = new ArrayList<>();
            try {
                Statement stmt = connection.createStatement();
                PreparedStatement preparedStatement;
                if(location.isEmpty())
                {
                    preparedStatement = connection.prepareStatement("SELECT t.rDate AS d1, v.vlocation AS l1, " +
                            "SUM (COUNT (v.vlicense)) OVER (PARTITION BY v.vlocation ORDER BY v.vlocation ASC) AS c2, " +
                            "v.vtname AS t1, SUM (COUNT (DISTINCT v.vlicense)) OVER (PARTITION BY v.vtname) AS c1, " +
                            "SUM (t.valueit) AS tr, SUM (SUM (t.valueit)) OVER (PARTITION BY v.vlocation) AS tbr FROM Vehicle v, Rent r, Return_ t" +
                            " WHERE t.rid = r.rid AND " +
                            "r.vlicense = v.vlicense GROUP BY v.vlocation, v.vtname, t.rDate HAVING " +
                            "t.rDate = TO_TIMESTAMP('"+date+"', 'YYYY-MM-DD') ORDER BY t.rDate ASC, v.vlocation ASC");

                }
                else
                {
                    preparedStatement = connection.prepareStatement("SELECT t.rDate AS d1, v.vlocation AS l1, " +
                            "SUM (COUNT (v.vlicense)) OVER (PARTITION BY v.vlocation ORDER BY v.vlocation ASC) AS c2, " +
                            "v.vtname AS t1, SUM (COUNT (DISTINCT v.vlicense)) OVER (PARTITION BY v.vtname) AS c1, SUM (t.valueit) AS tr, " +
                            "SUM (SUM (t.valueit)) OVER (PARTITION BY v.vlocation) AS tbr FROM Vehicle v, Rent r, Return_ t " +
                            "WHERE v.vlocation = '"+location+"' AND " +
                            " t.rid = r.rid AND " +
                            "r.vlicense = v.vlicense GROUP BY v.vlocation, v.vtname, t.rDate HAVING " +
                            "t.rDate = TO_TIMESTAMP('"+date+"', 'YYYY-MM-DD') ORDER BY t.rDate ASC, v.vlocation ASC");
                }


                ResultSet rs = preparedStatement.executeQuery();

                while(rs.next()) {

                    System.out.println("---------------------------------------------");

                    System.out.println(rs.getInt("tr"));
                    System.out.println(rs.getInt("tbr"));

                    list.add(new ReturnReport(
                            rs.getDate("d1").toString(),
                            rs.getString("l1"),
                            rs.getString("t1"),
                            rs.getInt("c2"),
                            rs.getInt("c1"),
                            rs.getInt("tr"),
                            rs.getInt("tbr")
                    ));
                }
                rs.close();
                stmt.close();
            } catch (SQLException e) {
                Message(e.getMessage());
            }

            return list;
        }

        public ArrayList<String> getListOfTables() {
            ArrayList<String> list = new ArrayList<>();
            try {
                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery("select TNAME from tab");
                while(rs.next()) {
                    list.add(rs.getString("TNAME"));
                }
                rs.close();
                stmt.close();
            }
            catch (SQLException e) {
                Message(e.getMessage());
            }
            return list;
        }
    }
