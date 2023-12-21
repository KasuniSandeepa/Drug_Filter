package lk.mobios.drugfilter.model;

public class ATC {

    String PHARMO_CLASS;
    String THERAPEUTIC_CLASS;
    String CLINICAL_CLASS;
    String ANATOMICAL_CLASS;
    String CUTIONARY_LABLE;
    String GENERIC;


    public ATC(String PHARMO_CLASS, String THERAPEUTIC_CLASS, String CLINICAL_CLASS, String ANATOMICAL_CLASS, String CUTIONARY_LABLE) {
        this.PHARMO_CLASS = PHARMO_CLASS;
        this.THERAPEUTIC_CLASS = THERAPEUTIC_CLASS;
        this.CLINICAL_CLASS = CLINICAL_CLASS;
        this.ANATOMICAL_CLASS = ANATOMICAL_CLASS;
        this.CUTIONARY_LABLE = CUTIONARY_LABLE;
    }

    public ATC(String PHARMO_CLASS, String THERAPEUTIC_CLASS, String CLINICAL_CLASS, String ANATOMICAL_CLASS, String CUTIONARY_LABLE, String GENERIC) {
        this.PHARMO_CLASS = PHARMO_CLASS;
        this.THERAPEUTIC_CLASS = THERAPEUTIC_CLASS;
        this.CLINICAL_CLASS = CLINICAL_CLASS;
        this.ANATOMICAL_CLASS = ANATOMICAL_CLASS;
        this.CUTIONARY_LABLE = CUTIONARY_LABLE;
        this.GENERIC = GENERIC;
    }

    public String getPHARMO_CLASS() {
        return PHARMO_CLASS;
    }

    public void setPHARMO_CLASS(String PHARMO_CLASS) {
        this.PHARMO_CLASS = PHARMO_CLASS;
    }

    public String getTHERAPEUTIC_CLASS() {
        return THERAPEUTIC_CLASS;
    }

    public void setTHERAPEUTIC_CLASS(String THERAPEUTIC_CLASS) {
        this.THERAPEUTIC_CLASS = THERAPEUTIC_CLASS;
    }

    public String getCLINICAL_CLASS() {
        return CLINICAL_CLASS;
    }

    public void setCLINICAL_CLASS(String CLINICAL_CLASS) {
        this.CLINICAL_CLASS = CLINICAL_CLASS;
    }

    public String getANATOMICAL_CLASS() {
        return ANATOMICAL_CLASS;
    }

    public void setANATOMICAL_CLASS(String ANATOMICAL_CLASS) {
        this.ANATOMICAL_CLASS = ANATOMICAL_CLASS;
    }

    public String getCUTIONARY_LABLE() {
        return CUTIONARY_LABLE;
    }

    public void setCUTIONARY_LABLE(String CUTIONARY_LABLE) {
        this.CUTIONARY_LABLE = CUTIONARY_LABLE;
    }

    public String getGENERIC() {
        return GENERIC;
    }

    public void setGENERIC(String GENERIC) {
        this.GENERIC = GENERIC;
    }
}
