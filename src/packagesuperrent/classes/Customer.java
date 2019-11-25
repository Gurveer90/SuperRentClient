package packagesuperrent.classes;

public class Customer {

    private String dlicense;
    private String cellphone;
    private String cname;
    private String caddress;

    public Customer(String dlicense, String cellphone, String cname, String caddress){
        this.dlicense = dlicense;
        this.cellphone = cellphone;

        this.cname = cname;
        this.caddress = caddress;
    }


    public String getDlicense() {
        return dlicense;
    }

    public void setDlicense(String dlicense) {
        this.dlicense = dlicense;
    }

    public String getCellphone() {
        return cellphone;
    }

    public void setCellphone(String cellphone) {
        this.cellphone = cellphone;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCaddress() {
        return caddress;
    }

    public void setCaddress(String caddress) {
        this.caddress = caddress;
    }
}
