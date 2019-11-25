package packagesuperrent.classes;

public class Reservation {
    private int confNo;
    private String vtname;
    private String dlicense;
    private String fromDate;
    private String fromTime;
    private String toDate;
    private String toTime;

    public Reservation(int confNo, String vtname, String dlicense, String fromDate, String fromTime, String toDate, String toTime) {
        this.confNo = confNo;
        this.vtname = vtname;
        this.dlicense = dlicense;
        this.fromDate = fromDate;
        this.fromTime = fromTime;
        this.toDate = toDate;
        this.toTime = toTime;
    }

    public int getConfNo() {
        return confNo;
    }

    public void setConfNo(int confNo) {
        this.confNo = confNo;
    }

    public String getVtname() {
        return vtname;
    }

    public void setVtname(String vtname) {
        this.vtname = vtname;
    }

    public String getToTime() {
        return toTime;
    }

    public void setToTime(String toTime) {
        this.toTime = toTime;
    }

    public String getToDate() {
        return toDate;
    }

    public void setToDate(String toDate) {
        this.toDate = toDate;
    }

    public String getFromTime() {
        return fromTime;
    }

    public void setFromTime(String fromTime) {
        this.fromTime = fromTime;
    }

    public String getFromDate() {
        return fromDate;
    }

    public void setFromDate(String fromDate) {
        this.fromDate = fromDate;
    }

    public String getDlicense() {
        return dlicense;
    }

    public void setDlicense(String dlicense) {
        this.dlicense = dlicense;
    }
}
