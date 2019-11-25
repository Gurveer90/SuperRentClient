package packagesuperrent.classes;

public class ReturnReport {
    private String date;
    private String location;
    private String vehicletype;
    private int c1;
    private int c2;
    private int tr;
    private int trb;

    public ReturnReport(String date, String location, String vehicletype, int c1, int c2, int tr, int trb) {
        this.date = date;
        this.location = location;
        this.vehicletype = vehicletype;
        this.c1 = c1;
        this.c2 = c2;
        this.tr = tr;
        this.trb = trb;
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

    public int getTr() {
        return tr;
    }

    public void setTr(int tr) {
        this.tr = tr;
    }

    public int getTrb() {
        return trb;
    }

    public void setTrb(int trb) {
        this.trb = trb;
    }
}
