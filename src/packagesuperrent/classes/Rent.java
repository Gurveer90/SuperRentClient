package packagesuperrent.classes;

public class Rent {

    private int rid;
    private int vlicense;
    private String dlicense;
    private String fromDate;
    private String fromTime;
    private String toDate;
    private String toTime;
    private int odometer;
    private String cardName;
    private int cardNo;
    private String ExpDate;
    private int confNo;

    public Rent(int rid, int vlicense, String dlicense, String fromDate, String fromTime,
                String toDate, String toTime, int odometer, String cardName, int cardNo,
                String ExpDate, int confNo)
    {
        this.rid = rid;
        this.vlicense = vlicense;
        this.dlicense = dlicense;
        this.fromDate = fromDate;
        this.fromTime = fromTime;
        this.toDate = toDate;
        this.toTime = toTime;
        this.odometer= odometer;
        this.cardName= cardName;
        this.cardNo= cardNo;
        this.ExpDate=ExpDate;
        this.confNo = confNo; }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public int getVlicense() {
        return vlicense;
    }

    public void setVlicense(int vlicense) {
        this.vlicense = vlicense;
    }

    public String getDlicense() {
        return dlicense;
    }

    public void setDlicense(String dlicense) {
        this.dlicense = dlicense;
    }

    public String getFromDate() {
        return fromDate;
    }

    public void setFromDate(String fromDate) {
        this.fromDate = fromDate;
    }

    public String getFromTime() {
        return fromTime;
    }

    public void setFromTime(String fromTime) {
        this.fromTime = fromTime;
    }

    public String getToDate() {
        return toDate;
    }

    public void setToDate(String toDate) {
        this.toDate = toDate;
    }

    public String getToTime() {
        return toTime;
    }

    public void setToTime(String toTime) {
        this.toTime = toTime;
    }

    public int getOdometer() {
        return odometer;
    }

    public void setOdometer(int odometer) {
        this.odometer = odometer;
    }

    public String getCardName() {
        return cardName;
    }

    public void setCardName(String cardName) {
        this.cardName = cardName;
    }

    public int getCardNo() {
        return cardNo;
    }

    public void setCardNo(int cardNo) {
        this.cardNo = cardNo;
    }

    public String getExpDate() {
        return ExpDate;
    }

    public void setExpDate(String expDate) {
        ExpDate = expDate;
    }

    public int getConfNo() {
        return confNo;
    }

    public void setConfNo(int confNo) {
        this.confNo = confNo;
    }

}
