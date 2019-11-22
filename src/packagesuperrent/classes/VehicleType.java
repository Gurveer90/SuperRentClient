package packagesuperrent.classes;

public class VehicleType {
    private String vtname;
    private String features;
    private float wrate;
    private float drate;
    private float hrate;
    private float wirate;
    private float dirate;
    private float hirate;
    private float krate;

    public VehicleType(String vtname, String features, float wrate, float drate,
                       float hrate, float wirate, float dirate, float hirate, float krate) {

        this.vtname = vtname;
        this.features = features;
        this.wrate = wrate;
        this.drate = drate;
        this.hrate = hrate;
        this.wirate = wirate;
        this.dirate = dirate;
        this.hirate = hirate;
        this.krate = krate;
    }

    public String getVtname() {
        return vtname;
    }

    public void setVtname(String vtname) {
        this.vtname = vtname;
    }

    public String getFeatures() {
        return features;
    }

    public void setFeatures(String features) {
        this.features = features;
    }

    public float getWrate() {
        return wrate;
    }

    public void setWrate(int wrate) {
        this.wrate = wrate;
    }

    public float getDrate() {
        return drate;
    }

    public void setDrate(int drate) {
        this.drate = drate;
    }

    public float getHrate() {
        return hrate;
    }

    public void setHrate(int hrate) {
        this.hrate = hrate;
    }

    public float getWirate() {
        return wirate;
    }

    public void setWirate(int wirate) {
        this.wirate = wirate;
    }

    public float getDirate() {
        return dirate;
    }

    public void setDirate(int dirate) {
        this.dirate = dirate;
    }

    public float getHirate() {
        return hirate;
    }

    public void setHirate(int hirate) {
        this.hirate = hirate;
    }

    public float getKrate() {
        return krate;
    }

    public void setKrate(int krate) {
        this.krate = krate;
    }
}