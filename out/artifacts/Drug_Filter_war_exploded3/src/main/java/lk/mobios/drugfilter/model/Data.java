package lk.mobios.drugfilter.model;

import java.util.List;

public class Data {

    List<ATC> atc;
    List<ISD> isd;
    String  genericName;

    List<String> dataAll;

    public Data(List<ATC> atc, List<ISD> isd) {
        this.atc = atc;
        this.isd = isd;
    }

    public Data(List<String> dataAll) {
        this.dataAll = dataAll;
    }

    public Data(List<ATC> atc, List<ISD> isd, String genericName) {
        this.atc = atc;
        this.isd = isd;
        this.genericName = genericName;
    }

    public List<ATC> getAtc() {
        return atc;
    }

    public void setAtc(List<ATC> atc) {
        this.atc = atc;
    }

    public List<ISD> getIsd() {
        return isd;
    }

    public void setIsd(List<ISD> isd) {
        this.isd = isd;
    }

    public List<String> getDataAll() {
        return dataAll;
    }

    public void setDataAll(List<String> dataAll) {
        this.dataAll = dataAll;
    }

    public String getGenericName() {
        return genericName;
    }

    public void setGenericName(String genericName) {
        this.genericName = genericName;
    }
}
