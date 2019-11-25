package packagesuperrent.classes;

public class Return {
    private int rid;
    private String rdate;
    private String rtime;
    private int odometer;
    private String fulltank;
    private float valueit;

    public Return(int rid, String rdate, String rtime, int odometer, String fulltank, float valueit) {
        this.rid = rid;
        this.rdate = rdate;
        this.rtime = rtime;
        this.odometer = odometer;
        this.fulltank = fulltank;
        this.valueit = valueit;
    }


    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public String getRdate() {
        return rdate;
    }

    public void setRdate(String rdate) {
        this.rdate = rdate;
    }

    public String getRtime() {
        return rtime;
    }

    public void setRtime(String rtime) {
        this.rtime = rtime;
    }

    public int getOdometer() {
        return odometer;
    }

    public void setOdometer(int odometer) {
        this.odometer = odometer;
    }

    public String getFulltank() {
        return fulltank;
    }

    public void setFulltank(String fulltank) {
        this.fulltank = fulltank;
    }

    public float getValueit() {
        return valueit;
    }

    public void setValueit(float valueit) {
        this.valueit = valueit;
    }
}
