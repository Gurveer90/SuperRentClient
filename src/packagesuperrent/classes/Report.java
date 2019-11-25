package packagesuperrent.classes;

public class Report {
    private String date;
    private String location;
    private String vehicletype;
    private int c1;
    private int c2;


    public Report(String date, String location, String vehicletype, int c1, int c2) {
        this.date = date;
        this.location = location;
        this.vehicletype = vehicletype;
        this.c1 = c1;
        this.c2 = c2;
    }
    public String getDate() {
        return date;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getVehicletype() {
        return vehicletype;
    }

    public void setVehicletype(String vehicletype) {
        this.vehicletype = vehicletype;
    }

    public int getC1() {
        return c1;
    }

    public int getC2() {
        return c2;
    }

    public void setC2(int c2) {
        this.c2 = c2;
    }

}
