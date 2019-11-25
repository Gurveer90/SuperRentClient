    package packagesuperrent.classes;

    public class Vehicle {

            private int vlicense;
            private String make;
            private String model;
            private int vyear;
            private String color;
            private int odometer;
            private String vstatus;
            private String vtname ;
            private String vlocation ;
            private String city ;

        public Vehicle(int vlicense, String make, String model, int vyear, String color,
                       int odometer, String vstatus, String vtname, String vlocation, String city) {
                this.vlicense = vlicense;
                this.make = make;
                this.model = model;
                this.vyear = vyear;
                this.color = color;
                this.odometer = odometer;
                this.vstatus = vstatus;
            this.vtname = vtname;
            this.vlocation = vlocation;
                this.city = city;
        }

        public Vehicle() {

        }

        public int getVlicense() { return vlicense; }

            public void setVlicense(int vlicense) { this.vlicense = vlicense; }

            public String getMake() {
                return make;
            }

            public void setMake(String make) {
                this.make = make;
            }

            public String getModel() {
                return model;
            }

            public void setModel(String model) {
                this.model = model;
            }

            public int getVyear() {
                return vyear;
            }

            public void setVyear(int vyear) {this.vyear = vyear;}

            public String getColor() {return color;}

            public void setColor(String color) {this.color=color;}

            public int getOdometer() {
            return odometer;
        }

            public void setOdometer(int odometer) {this.odometer = odometer;}

            public String getVstatus() {return vstatus;}

            public void setVstatus(String vstatus) {this.vstatus= vstatus;}

            public String getVlocation() {return vlocation;}

            public void setVlocation(String vlocation) {this.vlocation = vlocation;}

            public String getCity() {return city;}

            public void setCity(String city) {this.city=city;}

        public String getVtname() {
            return vtname;
        }

        public void setVtname(String vtname) {
            this.vtname = vtname;
        }
    }
