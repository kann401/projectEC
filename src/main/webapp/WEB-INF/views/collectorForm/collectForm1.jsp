<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<title>ECO COFFEE - COLLECT REQUEST</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- alert한글깨짐현상방지 -->
<script src="../resources/js/jquery-3.2.1.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/signature_pad@2.3.1/dist/signature_pad.min.js"></script>
<!-- <link rel="stylesheet"
   href="../resources/css/signature-pad.css"> -->

<!-- <script src="../resources/script/canvas2.js"></script> -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
@import url(http://fonts.googleapis.com/css?family=Raleway:300);

@import url(http://fonts.googleapis.com/css?family=Open+Sans);

@import
*
as
SignaturePad
from
'signature_pad';

html {
   font-family: sans-serif;
}

body {
   font-family: "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
   font-size: 14px;
   color: #3e4855;
   background-color: #fff;
   line-height: 1.42857143;
   overflow-x: hidden;
   -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
}

.container {
   display: block;
   margin-right: auto;
   margin-left: auto;
}

#page-title {
   padding: 0 0 23px;
   position: relative;
}

#page-title>h2 {
   font-family: "Raleway", "Helvetica Neue", Helvetica, Arial, sans-serif;
   font-weight: 300;
   font-size: 22px;
   text-transform: uppercase;
   padding: 0;
   margin: 0;
   color: #414C59;
}

.row {
   box-sizing: border-box;
   margin-right: -10px;
   margin-left: -10px;
}

.panel {
   border-color: #dfe8f1;
   margin-bottom: 20px;
   border-width: 1px;
   border-style: solid;
   border-radius: 4px;
   background-color: #fff;
   box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.panel-body {
   padding: 15px 20px;
   position: relative;
}

.form-group, .bordered-row {
   border-color: #dfe8f1;
}

.bordered-row>.form-group {
   padding: 20px 0;
   margin-bottom: 0;
   border-top-width: 1px;
   border-top-style: dashed;
}

.form-horizontal>.form-group {
   margin-right: -15px;
   margin-left: -15px;
}

.form-control, canvas {
   border-radius: 3px;
   font-size: 13px;
   display: block;
   float: none;
   background: #fff;
   width: 100%;
   height: 34px;
   padding: 6px 12px;
   color: #2b2f33;
   border: #dfe8f1 solid 1px;
   box-shadow: inset 1px 1px 3px #f6f6f6;
}

canvas {
   width: 100%;
   height: 300px;
   padding: 0 auto;
   margin: 0 auto;
}

input, canvas {
   line-height: normal;
   font-family: inherit;
}

[class*='col-'] {
   box-sizing: border-box;
}

.col-sm-3 {
   position: relative;
   min-height: 1px;
   padding-right: 10px;
   padding-left: 10px;
}

label {
   color: #3e4855;
   font-weight: bold;
   display: inline-block;
}

*, *:before, *:after {
   box-sizing: border-box;
}

h2 {
   display: block;
   -webkit-margin-before: 0.83em;
   -webkit-margin-after: 0.83em;
   -webkit-margin-start: 0px;
   -webkit-margin-end: 0px;
}

.btn-link:hover {
   background-color: transparent;
   box-shadow: none;
   cursor: pointer;
}

.btn-border:hover span {
   text-decoration: none;
   opacity: .75;
   border-width: 2px;
   border-style: solid;
}

.btn-alt {
   font-weight: bold;
   text-transform: uppercase;
   font-size: 12px;
}

.btn, cavas>button {
   border-radius: 3px;
   line-height: 32px;
   height: 34px;
   min-width: 34px;
   position: relative;
   display: inline-block;
   padding: 0 12px;
   user-select: none;
   text-align: center;
   white-space: nowrap;
   background-image: none;
   -webkit-transition: all .1s ease-in-out;
}

.border-green {
   border-color: #2ecc71 !important;
}

.text-success, .font-green {
   color: #2ecc71 !important;
}

a:link, a:hover, a:visited {
   text-decoration: none;
   outline: none;
}
</style>
<!-- JavaScript -->
<script src="../resources/js/alertify.js"></script>

<!-- alert CSS --> 
<!-- include the style --> 
<link rel="stylesheet" href="../resources/css/alertify.min.css" />
<!-- <!-- include a theme -->
<link rel="stylesheet" href="../resources/css/themes/default.min.css" />


</head>
<body>
   <div class="container" align="center" style="background: white;">
      <div id="page-title" style="text-align: center;">
         <img src="../resources/assets/image-resources/logo.png">
         <h2>THE DETAILS of RESULT</h2>
      </div>
      <div class="row" style="background: white;">
         <div class="panel">
            <div class="panel-body">
               <div class="example-box-wrapper">
                  <p>Please Fill Out Our Collect Form!</p>
                  <form id="collectForm" name="collectForm"
                     class="form-horizontal bordered-row">
                     <div class="form-group">
                        <label class="col-sm-3">RESERVATION NUMBER</label>
                        <div class="col-sm-6">
                           <input type="text" class="form-control" id="resernum"
                              value="${reservelist.resernum}" name="resernum" readonly="readonly">
                        </div>
                     </div>

                     <div class="form-group" style="display: block">
                        <label class="col-sm-3">CAFE ID</label>
                        <div class="col-sm-6">
                           <input type="text" class="form-control" id="cafeid"
                              value="${reservelist.cafeid}" name="cafeid" readonly="readonly">
                        </div>
                     </div>

                     <div class="form-group">
                        <label class="col-sm-3">CAFE NAME</label>
                        <div class="col-sm-6">
                           <input type="text" class="form-control" id="cafename"
                              value="${reservelist.cafename}" name="cafename" readonly="readonly">
                        </div>
                     </div>
                     
                     <div class="form-group">
                        <label class="col-sm-3">CAFE POSTCODE</label>
                        <div class="col-sm-6">
                           <input type="text" class="form-control" id="cafepostcode"
                              value="${cafePost}" name="cafepostcode" readonly="readonly">
                        </div>
                     </div>

                     <div class="form-group">
                        <label class="col-sm-3">CAFE ADDRESS</label>
                        <div class="col-sm-6">
                           <input type="text" class="form-control" id="caferoad"
                              value="${cafeRoad}" name="caferoad" readonly="readonly">
                        </div>
                     </div>

                     <div class="form-group" style="display: block">
                        <label class="col-sm-3">BUSINESS ID</label>
                        <div class="col-sm-6">
                           <input type="text" class="form-control" id="businessid"
                              value="${reservelist.businessid}" name="businessid"
                              readonly="readonly">
                        </div>
                     </div>

                     <div class="form-group">
                        <label class="col-sm-3">BUSINESS NAME</label>
                        <div class="col-sm-6">
                           <input type="text" class="form-control" id="businessname"
                              value="${reservelist.businessname}" name="businessname"
                              readonly="readonly">
                        </div>
                     </div>

                     <div class="form-group">
                        <label class="col-sm-3">BUSINESS POSTCODE <br></label>
                        <div class="col-sm-6">
                           <input type="text" class="form-control" id="businesspostcode"
                              value="${bizPost}" name="businesspostcode" disabled="disabled">
                        </div>
                     </div>
                     
                     <div class="form-group">
                        <label class="col-sm-3">BUSINESS ADDRESS <br></label>
                        <div class="col-sm-6">
                           <input type="text" class="form-control" id="businessroad"
                              value="${bizRoad}" name="businessroad" disabled="disabled">
                        </div>
                     </div>

                     <div class="form-group">
                        <label for="amount" class="col-sm-3">COFFEE AMOUNT</label>
                        <div class="col-sm-6">
                        <select name="amount" id="amount" onchange="alert(this.options[this.selectedIndex].text)">
                              <option value="0">select</option>
                              <option value="1">1</option>
                              <option value="2">2</option>
                              <option value="3">3</option>
                              <option value="4">4</option>
                              <option value="5">5</option>
                              <option value="6">6</option>
                              <option value="7">7</option>
                              <option value="8">8</option>
                              <option value="9">9</option>
                              <option value="10">10</option>
                           </select>&nbsp;(1 BUCKET = 3KG)</div>
                     </div>
                     <div class="form-group">
                        <div style="padding-bottom: 5px">
                           <label class="col-sm-3">SIGNITURE</label>
                        </div>
                        <div class="col-sm-6">
                           <div id="signature-pad" class="m-signature-pad">
                              <div class="m-signature-pad--body">
                                 <canvas></canvas>
                              </div>
                              <div class="m-signature-pad--footer">
                                 <button type="button"
                                    class="button clear btn btn-border btn-alt border-green btn-link font-green"
                                    data-action="clear">CLEAR</button>
                                 <span></span>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="form-group" style="text-align: center;">
                           <span class="input-group-btn">
                           <input type="submit" data-action="save" value = "submit"
                           class="save btn btn-border btn-alt border-green btn-link font-green">
                           </span>                           
                     </div>
                  </form>

               </div>
            </div>
         </div>
      </div>
   </div>

   <script>
      var canvas = $("#signature-pad canvas")[0];
      var sign = new SignaturePad(canvas, {
         minWidth : 5,
         maxWidth : 10,
         penColor : "rgb(66, 133, 244)"
      });
      var amount2 = 0;
      // funtion안에 값이 들어가야 select값까지 모두 불어올 수 있음.
      $("[data-action]").on("click", function() {
         var resernum2 = $("#resernum").val();
           var cafeid2 = $("#cafeid").val();
           var cafename2 = $("#cafename").val();
           var cafepostcode2 = $("#cafepostcode").val();
           var caferoad2 = $("#caferoad").val();
           var businessid2 = $("#businessid").val();
           var businessname2 = $("#businessname").val();
           var businesspostcode2 = $("#businesspostcode").val();
           var businessroad2 = $("#businessroad").val();
           var amount2 = $("#amount").val();
//            var params = jQuery("#collectForm").serialize();
//            alert(params);
           
         if (amount2 < 1) {
        	 alertify.alert("Please Check the Quantity!");
         }

         else if ($(this).data("action") == "clear") {
            sign.clear();
         } else if ($(this).data("action") == "save") {
            if (sign.isEmpty()) {
            	alertify.alert("Sign, Please! :)");
            } else if (amount2 >= 1) {
               console.log("log :" + amount2);
               $.ajax({
                  url : "sendCanvas",
                  method : "post",
                  cache : false,
                  data : {
                      resernum : resernum2,
                           cafeid : cafeid2,
                           cafename : cafename2,
                           cafepostcode : cafepostcode2,
                           caferoad : caferoad2,
                           businessid : businessid2,
                           businessname : businessname2,
                           businesspostcode : businesspostcode2,
                           businessroad : businessroad2,
                            amount : amount2,
//                            formVO : collectform2,
                           sign : sign.toDataURL()
                  },
                  dataType : "text",
                  success : function(filename) {
                     if (filename == "FAIL") {
                    	 alertify.alert("Already Completed!");
                        sign.clear();
                        window.close();
                     } else if (filename == "OK") {
                        alert("SAVED YOUR REQUEST");
                        sign.clear();
                        window.close();
                     }
                  },
                  error : function(x) {
                     console.log(x);
                     alertify.alert("Failed To Save!");
                  }
               });
            }
         }
      });

      function resizeCanvas() {
         var canvas = $("#signature-pad canvas")[0];

         var ratio = Math.max(window.devicePixelRatio || 1, 1);
         canvas.width = canvas.offsetWidth * ratio;
         canvas.height = canvas.offsetHeight * ratio;
         canvas.getContext("2d").scale(ratio, ratio);
      }

      $(window).on("resize", function() {
         resizeCanvas();
      });

      resizeCanvas();
   </script>
</body>
</html>