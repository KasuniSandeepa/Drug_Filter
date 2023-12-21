<%--
  Created by IntelliJ IDEA.
  User: Prasad
  Date: 3/12/2021
  Time: 9:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" dir="">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Form Basic | Gull Admin Template</title>
    <!--    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet" media='all'/>-->
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet" media='all'/>
    <link href="dist-assets/css/google.css" rel="stylesheet" media='all'/>
    <link href="dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet" media='all'/>
    <link href="html/src/print.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="dist-assets/css/plugins/dropzone.min.css"/>
    <!--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>-->
    <!--    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>-->
    <!--    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>-->
    <!--    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>-->
    <link rel="stylesheet" href="dist-assets/css/plugins/datatables.min.css"/>


    <style>
        .ui-autocomplete {
            max-height: 200px;
            overflow-y: auto;
            /* prevent horizontal scrollbar */
            overflow-x: hidden;
            /* add padding to account for vertical scrollbar */
            padding-right: 20px;
        }

        .mincontent {
            max-width: max-content !important;
        }

        .form-controls {
            background: transparent;
            border: none;
            border-bottom: 1px solid #000000;
            -webkit-box-shadow: none;
            box-shadow: none;
            border-radius: 0;
            margin-top: 5px;
        }

        .form-controlt {
            background: transparent;
            border: none;
            border-bottom: 1px solid #000000;
            -webkit-box-shadow: none;
            box-shadow: none;
            border-radius: 0;
            margin-top: 5px;
        }

        h6{
        cursor: pointer;
        }

    </style>

</head>

<body class="text-left">
<div class="app-admin-wrap layout-sidebar-large">
    <!--    <div class="main-header">-->
    <!--        <div class="logo">-->
    <!--            <img src="dist-assets/images/logo.png" alt="">-->
    <!--        </div>-->
    <!--        <div class="menu-toggle">-->
    <!--            <div></div>-->
    <!--            <div></div>-->
    <!--            <div></div>-->
    <!--        </div>-->

    <!--        <div>-->
    <!--            <h2>Search</h2>-->
    <!--            &lt;!&ndash;                <i class="search-icon text-muted i-Magnifi-Glass1"></i>&ndash;&gt;-->
    <!--        </div>-->
    <!--        &lt;!&ndash;        </div>&ndash;&gt;-->
    <!--        <div style="margin: auto"></div>-->
    <!--        <div class="header-part-right">-->
    <!--            &lt;!&ndash; Full screen toggle &ndash;&gt;-->
    <!--            <i class="i-Full-Screen header-icon d-none d-sm-inline-block" data-fullscreen></i>-->
    <!--            &lt;!&ndash; Grid menu Dropdown &ndash;&gt;-->


    <!--        </div>-->
    <!--    </div>-->

    <!-- =============== Left side End ================-->
    <div class="mt-3 sidenav-open d-flex flex-column">
        <!-- ============ Body content start ============= -->
        <div class="main-content">

            <div class="row">


                <div class="col-md-4 col-sm-4 input-group center-block form-group ml-auto mr-auto">
                    <input class="form-control ml-5 mr-5 center-block" id="drugTxt" type="text"
                           placeholder="Drug name (Chemical/Brand name)"/>

                </div>

            </div>
            <div id="inputs" style="display: none" class=" ml-5 mr-5">

                <input class=" col-md-4 col-sm-4 form-control mb-2 ml-auto mr-auto center-block" id="anatoTxt"
                       type="text"
                       placeholder="Enter Anatomical Class"/>
                <input class=" col-md-4 col-sm-4 form-control mb-2 ml-auto mr-auto center-block" id="clinicalTxt"
                       type="text"
                       placeholder="Enter Clinical Class"/>
                <input class=" col-md-4 col-sm-4 form-control mb-2 ml-auto mr-auto center-block" id="therapeutcTxt"
                       type="text"
                       placeholder="Enter Therapeutic Class"/>
                <input class=" col-md-4 col-sm-4 form-control mb-2 ml-auto mr-auto center-block" id="phrmoTxt"
                       type="text"
                       placeholder="Enter Pharmo Class"/>

            </div>
            <div class="row">


                <div class=" col-md-12 text-center">
                    <div class="text-center">
                        <button class="btn btn-primary ripple m-1" type="button">Search</button>

                        <br>
                        <a class="btn text-primary" id="adbtn" onclick="advanceView()">Advance Search >></a>

                    </div>
                </div>

                <!--                <div class="pl-5 pr-5 w-auto">-->
                <div class="bg-primary ml-auto mr-auto " style="overflow:auto;width: 550px;height: 230px">
                    <h5 class="text-white text-center m-2" id="gName">No Records Found</h5>


                    <div class="ml-4" id="atc">


                    </div>


                </div>

                <!--                </div>-->

                <div class="col-md-12 mb-4">
                    <div class="card text-left">
                        <div class="card-body">
                            <h4 class="card-title mb-3">DRUG INFORMATION BY GENERIC</h4>
                            <span class=" mb-3">TOTAL NO OF RECORDS RETRIEVED : <span id="count">0</span></span>

                            <div class="table-responsive">
                                <table class="display table table-striped table-bordered" id="deafult_ordering_table_aa"
                                       style="width:100%">

                                    <thead>
                                    <tr>
                                        <th>BRAND</th>
                                        <th>FORMULATION</th>
                                        <th>STRENGTH</th>
                                        <th>IMPORTER</th>
                                        <th>MANUFACTURER</th>
                                    </tr>
                                    </thead>
                                    <tbody id="drugTbl">

                                    </tbody>

                                </table>
                            </div>
                        </div>
                    </div>
                </div>

            </div><!-- end of main-content -->


            <div class="flex-grow-1"></div>

        </div>

    </div>
</div>


<!-- ============ Search UI End ============= -->
<script src="dist-assets/js/plugins/jquery-3.3.1.min.js"></script>
<script src="dist-assets/js/plugins/bootstrap.bundle.min.js"></script>
<script src="dist-assets/js/plugins/perfect-scrollbar.min.js"></script>
<script src="dist-assets/js/scripts/script.min.js"></script>
<script src="dist-assets/js/scripts/sidebar.large.script.min.js"></script>
<script src="dist-assets/js/plugins/datatables.min.js"></script>
<script src="dist-assets/js/scripts/datatables.script.min.js"></script>
<script src="dist-assets/js/scripts/customizer.script.min.js"></script>

<script>
    var myTable;
    $(document).ready(function () {

        testme();

    });
    var jsonData = [{
        "log_time": "2015-12-27 09:42:21",
        "user_name": "Me",
        "class_name": "login",
        "class_function": "authentication",
        "action_title": "User login",
        "action_description": "I am logged in"
    }, {
        "log_time": "2015-12-27 09:42:21",
        "user_name": "me",
        "class_name": "dashboard",
        "class_function": "index",
        "action_title": "Admin dashboard",
        "action_description": "I am logged in"
    }];

    var isDone = false;

    function advanceView() {


        if (!isDone) {
            isDone = true;
            $('#inputs').show()

            $('#adbtn').text("Hide Advance Search >>")
        } else {
            isDone = false;
            $('#inputs').hide()
            $('#adbtn').text("Advance Search >>")
        }


    }

    function testme() {


        myTable = $('#deafult_ordering_table_aa').DataTable({
            "paging": true,
            "lengthChange": true,
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": true,
            "responsive": true,
            "bDestroy": true,
            "columnDefs": [{
                "targets": [1],
                "visible": true
            }],
            "data": [],
            "columns": [{
                "title": "BRAND",
                "data": "BRAND"
            }, {
                "title": "FORMULATION",
                "data": "FORMULATION"
            }, {
                "title": "STRENGTH",
                "data": "STRENGTH"
            }, {
                "title": "IMPORTER",
                "data": "IMPORTER"
            }, {
                "title": "MANUFACTURER",
                "data": "MANUFACTURER"
            }]
        });


    }


    $('#drugTxt').on("keyup", function () {
        // dataTable.clear()

        var drug = $('#drugTxt').val();
        if (drug.length >= 3 || drug.length == 0) {

            loadGenericDrug(drug)
        }


        // testme();

        //     .draw();

        // $.ajax('controller/Controller.jsp?action=drug&name=' + $('#drugTxt').val(),
        //     {
        //         type: "GET",
        //         async: true,
        //         success: function (data) {
        //
        //             $('#gName').text('GENERIC NAME : ' + data.genericName)
        //
        //             $('#drugTbl').empty();
        //             $('#atc').empty();
        //
        //
        //
        //             $.each(data.atc, function (i, x) {
        //                 console.log(x);
        //                 i++;
        //                 $('#atc').append('<h6 class="text-white m-0">' + i + '. PHARMO CLASS : ' + x.PHARMO_CLASS + '</h6>\n' +
        //                     '<h6 class="text-white ml-3 mt-0 mb-0">THERAPEUTIC CLASS : ' + x.THERAPEUTIC_CLASS + '</h6>\n' +
        //                     '<h6 class="text-white ml-3 mt-0 mb-0">CLINICAL CLASS : ' + x.CLINICAL_CLASS + '</h6>\n' +
        //                     '<h6 class="text-white ml-3 mt-0 mb-0">ANATOMICAL CLASS : ' + x.ANATOMICAL_CLASS + '</h6>\n' +
        //                     '<h6 class="text-white ml-3 mt-0 mb-0">CUTIONARY LABLE : ' + x.CUTIONARY_LABLE + '</h6>\n' +
        //                     '<br>')
        //
        //             });
        //
        //             $.each(data.isd, function (i, x) {
        //                 i++
        //                 $('#drugTbl').append(' <tr>' +
        //                     '<td>' + i + '</td>\n' +
        //                     '<td>' + x.BRAND + '</td>\n' +
        //                     '<td>' + x.FORMULATION + '</td>\n' +
        //                     '<td>' + x.STRENGTH + '</td>\n' +
        //                     '<td>' + x.IMPORTER + '</td>\n' +
        //                     '<td>' + x.MANUFACTURER + '</td>\n' +
        //                     '</tr>');
        //             });
        //
        //
        //             // complex header
        //             dataTable = $("#deafult_ordering_table_aa").DataTable({
        //                 responsive: true,
        //                 "bDestroy": true,
        //                 "columnDefs": [{
        //                     "targets": [3],
        //                     "visible": true
        //                 }]
        //             });
        //
        //
        //
        //
        //
        //         },
        //         error: function () {
        //         }
        //     });
    })

    $('#anatoTxt').on("keyup", function () {
        // dataTable.clear()

        var anaClass = $('#anatoTxt').val();

        if(anaClass == 'all') {
            loadAllByType('anatClass')
        }else{
            loadAnaClass(anaClass);
        }

    })

    $('#clinicalTxt').on("keyup", function () {
        // dataTable.clear()
     var clinClass =  $('#clinicalTxt').val();
        if (clinClass == 'all') {
            loadAllByType('clinicClass')
        }else{
            loadClinClass(clinClass);
        }
    })

    $('#therapeutcTxt').on("keyup", function () {
        // dataTable.clear()

        var theClass = $('#therapeutcTxt').val();
        console.log(theClass)
        if (theClass == 'all') {

            loadAllByType('therapClass');

        } else {
            loadTheData(theClass);
        }


    })

    $('#phrmoTxt').on("keyup", function () {
        // dataTable.clear()
        var phrClass = $('#phrmoTxt').val();

        if(phrClass == 'all'){

            loadAllByType('pharmoClass')

        }else {
            loadPhrClass(phrClass);

        }

    })


    function loadGenericDrug(drug){
        $.ajax({
            url: 'controller/Controller.jsp?action=drug&name=' + drug,
            data: {
                json: JSON.stringify(jsonData)
            },
            type: "POST",
            timeout: 30000,
            dataType: "json", // "xml", "json"
            success: function (logs) {
                console.log(logs)
                myTable.clear();
                $.each(logs.isd, function (index, value) {
                    myTable.row.add(value);
                });
                myTable.draw();
                $('#atc').empty();

                $('#count').text(logs.isd.length);
                if (logs.genericName == '') {
                    $('#gName').text('No Records Found');
                } else {
                    $('#gName').text('GENERIC NAME : ' + logs.genericName);

                }

                $.each(logs.atc, function (i, x) {

                    i++;
                    $('#atc').append(
                        '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.PHARMO_CLASS+'" onclick="loadPhrClass(this.dataset.name)">PHARMO CLASS : ' + x.PHARMO_CLASS + '</h6>\n' +
                        '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.THERAPEUTIC_CLASS+'" onclick="loadTheData(this.dataset.name)" >THERAPEUTIC CLASS : ' + x.THERAPEUTIC_CLASS + '</h6>\n' +
                        '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.CLINICAL_CLASS+'" onclick="loadClinClass(this.dataset.name)">CLINICAL CLASS : ' + x.CLINICAL_CLASS + '</h6>\n' +
                        '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.ANATOMICAL_CLASS+'" onclick="loadAnaClass(this.dataset.name)">ANATOMICAL CLASS : ' + x.ANATOMICAL_CLASS + '</h6>\n' +
                        '<h6 class="text-white ml-3 mt-0 mb-0">CUTIONARY LABLE : ' + x.CUTIONARY_LABLE + '</h6>\n' +
                        '<br>')



                });
            },
            error: function (jqXHR, textStatus, ex) {
                myTable.clear();
                $('#atc').empty();
                myTable.draw();
                $('#gName').text('No Records Found');
                $('#count').text('0');
                // alert(textStatus + "," + ex + "," + jqXHR.responseText);
            }
        });

    }

    function loadAnaClass(anaClass){
        $.ajax({
            url: 'controller/Controller.jsp?action=ana&name=' + anaClass,
            data: {
                json: JSON.stringify(jsonData)
            },
            type: "POST",
            timeout: 30000,
            dataType: "json", // "xml", "json"
            success: function (logs) {
                console.log(logs)
                myTable.clear();
                $.each(logs.isd, function (index, value) {
                    myTable.row.add(value);
                });
                myTable.draw();
                $('#atc').empty();

                $('#count').text(logs.isd.length);
                $('#gName').text('Total Records : ' + logs.atc.length);



                $.each(logs.atc, function (i, x) {

                    i++;
                    $('#atc').append(
                        '<h6 class="text-white m-0" data-name="'+x.GENERIC+'" onclick="loadGenericDrug(this.dataset.name)">' + i + '. GENERIC : ' + x.GENERIC + '</h6>\n' +
                        '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.PHARMO_CLASS+'" onclick="loadPhrClass(this.dataset.name)">PHARMO CLASS : ' + x.PHARMO_CLASS + '</h6>\n' +
                        '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.THERAPEUTIC_CLASS+'" onclick="loadTheData(this.dataset.name)" >THERAPEUTIC CLASS : ' + x.THERAPEUTIC_CLASS + '</h6>\n' +
                        '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.CLINICAL_CLASS+'" onclick="loadClinClass(this.dataset.name)">CLINICAL CLASS : ' + x.CLINICAL_CLASS + '</h6>\n' +
                        '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.ANATOMICAL_CLASS+'" onclick="loadAnaClass(this.dataset.name)">ANATOMICAL CLASS : ' + x.ANATOMICAL_CLASS + '</h6>\n' +
                        '<h6 class="text-white ml-3 mt-0 mb-0" >CUTIONARY LABLE : ' + x.CUTIONARY_LABLE + '</h6>\n' +
                        '<br>')

                });
            },
            error: function (jqXHR, textStatus, ex) {
                myTable.clear();
                $('#atc').empty();
                myTable.draw();
                $('#gName').text('No Records Found');
                $('#count').text('0');
                // alert(textStatus + "," + ex + "," + jqXHR.responseText);
            }
        });


    }

    function loadClinClass(cliClass){
        $.ajax({
            url: 'controller/Controller.jsp?action=cli&name=' + cliClass,
            data: {
                json: JSON.stringify(jsonData)
            },
            type: "POST",
            timeout: 30000,
            dataType: "json", // "xml", "json"
            success: function (logs) {
                console.log(logs)
                myTable.clear();
                $.each(logs.isd, function (index, value) {
                    myTable.row.add(value);
                });
                myTable.draw();
                $('#atc').empty();

                $('#count').text(logs.isd.length);
                $('#gName').text('Total Records : ' + logs.atc.length);


                $.each(logs.atc, function (i, x) {

                    i++;
                    $('#atc').append(
                        '<h6 class="text-white m-0" data-name="'+x.GENERIC+'" onclick="loadGenericDrug(this.dataset.name)">' + i + '. GENERIC : ' + x.GENERIC + '</h6>\n' +
                        '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.PHARMO_CLASS+'" onclick="loadPhrClass(this.dataset.name)">PHARMO CLASS : ' + x.PHARMO_CLASS + '</h6>\n' +
                        '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.THERAPEUTIC_CLASS+'" onclick="loadTheData(this.dataset.name)" >THERAPEUTIC CLASS : ' + x.THERAPEUTIC_CLASS + '</h6>\n' +
                        '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.CLINICAL_CLASS+'" onclick="loadClinClass(this.dataset.name)">CLINICAL CLASS : ' + x.CLINICAL_CLASS + '</h6>\n' +
                        '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.ANATOMICAL_CLASS+'" onclick="loadAnaClass(this.dataset.name)">ANATOMICAL CLASS : ' + x.ANATOMICAL_CLASS + '</h6>\n' +
                        '<h6 class="text-white ml-3 mt-0 mb-0" >CUTIONARY LABLE : ' + x.CUTIONARY_LABLE + '</h6>\n' +
                        '<br>')

                });
            },
            error: function (jqXHR, textStatus, ex) {
                myTable.clear();
                $('#atc').empty();
                myTable.draw();
                $('#gName').text('No Records Found');
                $('#count').text('0');
                // alert(textStatus + "," + ex + "," + jqXHR.responseText);
            }
        });

    }

    function loadPhrClass(phrClass) {
        $.ajax({
            url: 'controller/Controller.jsp?action=phr&name=' + phrClass,
            data: {
                json: JSON.stringify(jsonData)
            },
            type: "POST",
            timeout: 30000,
            dataType: "json", // "xml", "json"
            success: function (logs) {
                console.log(logs)
                myTable.clear();
                $.each(logs.isd, function (index, value) {
                    myTable.row.add(value);
                });
                myTable.draw();
                $('#atc').empty();

                $('#count').text(logs.isd.length);
                $('#gName').text('Total Records : ' + logs.atc.length);


                $.each(logs.atc, function (i, x) {

                    i++;
                    $('#atc').append(
                        '<h6 class="text-white m-0" data-name="'+x.GENERIC+'" onclick="loadGenericDrug(this.dataset.name)">' + i + '. GENERIC : ' + x.GENERIC + '</h6>\n' +
                        '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.PHARMO_CLASS+'" onclick="loadPhrClass(this.dataset.name)">PHARMO CLASS : ' + x.PHARMO_CLASS + '</h6>\n' +
                        '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.THERAPEUTIC_CLASS+'" onclick="loadTheData(this.dataset.name)" >THERAPEUTIC CLASS : ' + x.THERAPEUTIC_CLASS + '</h6>\n' +
                        '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.CLINICAL_CLASS+'" onclick="loadClinClass(this.dataset.name)">CLINICAL CLASS : ' + x.CLINICAL_CLASS + '</h6>\n' +
                        '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.ANATOMICAL_CLASS+'" onclick="loadAnaClass(this.dataset.name)">ANATOMICAL CLASS : ' + x.ANATOMICAL_CLASS + '</h6>\n' +
                        '<h6 class="text-white ml-3 mt-0 mb-0" >CUTIONARY LABLE : ' + x.CUTIONARY_LABLE + '</h6>\n' +
                        '<br>')

                });
                ;
            },
            error: function (jqXHR, textStatus, ex) {
                myTable.clear();
                $('#atc').empty();
                myTable.draw();
                $('#gName').text('No Records Found');
                $('#count').text('0');
                // alert(textStatus + "," + ex + "," + jqXHR.responseText);
            }
        });


    }

    function loadTheData(theClass) {
        $.ajax({
            url: 'controller/Controller.jsp?action=the&name=' + theClass,
            data: {
                json: JSON.stringify(jsonData)
            },
            type: "POST",
            timeout: 30000,
            dataType: "json", // "xml", "json"
            success: function (logs) {
                console.log(logs)
                myTable.clear();
                $.each(logs.isd, function (index, value) {
                    myTable.row.add(value);
                });
                myTable.draw();
                $('#atc').empty();

                $('#count').text(logs.isd.length);
                // if (logs.genericName == '') {
                //     $('#gName').text('No Records Found');
                // } else {
                    $('#gName').text('Total Records : ' + logs.atc.length);

                // }

                $.each(logs.atc, function (i, x) {

                    i++;
                    $('#atc').append(
                        '<h6 class="text-white m-0" data-name="'+x.GENERIC+'" onclick="loadGenericDrug(this.dataset.name)">' + i + '. GENERIC : ' + x.GENERIC + '</h6>\n' +
                        '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.PHARMO_CLASS+'" onclick="loadPhrClass(this.dataset.name)">PHARMO CLASS : ' + x.PHARMO_CLASS + '</h6>\n' +
                        '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.THERAPEUTIC_CLASS+'" onclick="loadTheData(this.dataset.name)" >THERAPEUTIC CLASS : ' + x.THERAPEUTIC_CLASS + '</h6>\n' +
                        '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.CLINICAL_CLASS+'" onclick="loadClinClass(this.dataset.name)">CLINICAL CLASS : ' + x.CLINICAL_CLASS + '</h6>\n' +
                        '<h6 class="text-white ml-3 mt-0 mb-0" data-name="'+x.ANATOMICAL_CLASS+'" onclick="loadAnaClass(this.dataset.name)">ANATOMICAL CLASS : ' + x.ANATOMICAL_CLASS + '</h6>\n' +
                        '<h6 class="text-white ml-3 mt-0 mb-0" >CUTIONARY LABLE : ' + x.CUTIONARY_LABLE + '</h6>\n' +
                        '<br>')

                });
            },
            error: function (jqXHR, textStatus, ex) {
                myTable.clear();
                $('#atc').empty();
                myTable.draw();
                $('#gName').text('No Records Found');
                $('#count').text('0');
                // alert(textStatus + "," + ex + "," + jqXHR.responseText);
            }
        });

    }



   function loadAllByType(colName){

        $.ajax({
            url: 'controller/Controller.jsp?action=the&name=all&col='+colName,
            data: {
                json: JSON.stringify(jsonData)
            },
            type: "POST",
            timeout: 30000,
            dataType: "json", // "xml", "json"
            success: function (logs) {
                console.log(logs.dataAll)


                myTable.clear();
                $('#atc').empty();
                myTable.draw();
                $('#gName').text('No Records Found');
                $('#count').text('0');

                $('#atc').empty();

                // $('#count').text(logs.isd.length);
                // if (logs.genericName == '') {
                //     $('#gName').text('No Records Found');
                // } else {
                    $('#gName').text('Total Records : ' + logs.dataAll.length);
                //
                // }

                if(colName=='pharmoClass'){

                    $.each(logs.dataAll, function (i, x) {

                        i++;
                        $('#atc').append(
                            '<h6 class="text-white m-0" data-name="' + x + '" onclick="loadPhrClass(this.dataset.name)">' + i + ' . ' + x + '</h6>\n' +
                            '<br>')

                    });
                }else if(colName=='therapClass'){

                    $.each(logs.dataAll, function (i, x) {

                        i++;
                        $('#atc').append(
                            '<h6 class="text-white m-0" data-name="' + x + '" onclick="loadTheData(this.dataset.name)">' + i + ' . ' + x + '</h6>\n' +
                            '<br>')

                    });
                }else if(colName=='clinicClass'){

                    $.each(logs.dataAll, function (i, x) {

                        i++;
                        $('#atc').append(
                            '<h6 class="text-white m-0" data-name="' + x + '" onclick="loadClinClass(this.dataset.name)">' + i + ' . ' + x + '</h6>\n' +
                            '<br>')

                    });
                }else if(colName=='anatClass'){

                    $.each(logs.dataAll, function (i, x) {

                        i++;
                        $('#atc').append(
                            '<h6 class="text-white m-0" data-name="' + x + '" onclick="loadAnaClass(this.dataset.name)">' + i + ' . ' + x + '</h6>\n' +
                            '<br>')

                    });
                }

            },
            error: function (jqXHR, textStatus, ex) {
                myTable.clear();
                $('#atc').empty();
                myTable.draw();
                $('#gName').text('No Records Found');
                $('#count').text('0');
                // alert(textStatus + "," + ex + "," + jqXHR.responseText);
            }
        });

    }

    function hello(s) {
        console.log(s)
    }
</script>
</body>

</html>
