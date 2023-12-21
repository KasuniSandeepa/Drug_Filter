package lk.mobios.drugfilter.model;

public class ISD {

    String BRAND;
    String FORMULATION;
    String STRENGTH;
    String IMPORTER;
    String MANUFACTURER;
    String GENERIC;

    public ISD(String BRAND, String FORMULATION, String STRENGTH, String IMPORTER, String MANUFACTURER) {
        this.BRAND = BRAND;
        this.FORMULATION = FORMULATION;
        this.STRENGTH = STRENGTH;
        this.IMPORTER = IMPORTER;
        this.MANUFACTURER = MANUFACTURER;
    }


    public ISD(String BRAND, String FORMULATION, String STRENGTH, String IMPORTER, String MANUFACTURER, String GENERIC) {
        this.BRAND = BRAND;
        this.FORMULATION = FORMULATION;
        this.STRENGTH = STRENGTH;
        this.IMPORTER = IMPORTER;
        this.MANUFACTURER = MANUFACTURER;
        this.GENERIC = GENERIC;
    }

    public String getBRAND() {
        return BRAND;
    }

    public void setBRAND(String BRAND) {
        this.BRAND = BRAND;
    }

    public String getFORMULATION() {
        return FORMULATION;
    }

    public void setFORMULATION(String FORMULATION) {
        this.FORMULATION = FORMULATION;
    }

    public String getSTRENGTH() {
        return STRENGTH;
    }

    public void setSTRENGTH(String STRENGTH) {
        this.STRENGTH = STRENGTH;
    }

    public String getIMPORTER() {
        return IMPORTER;
    }

    public void setIMPORTER(String IMPORTER) {
        this.IMPORTER = IMPORTER;
    }

    public String getMANUFACTURER() {
        return MANUFACTURER;
    }

    public void setMANUFACTURER(String MANUFACTURER) {
        this.MANUFACTURER = MANUFACTURER;
    }

    public String getGENERIC() {
        return GENERIC;
    }

    public void setGENERIC(String GENERIC) {
        this.GENERIC = GENERIC;
    }
}
