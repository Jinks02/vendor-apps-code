<!DOCTYPE html>
<!-- http://gmaps-samples-v3.googlecode.com/svn/trunk/drawing/drawing-tools.html -->
<!-- https://developers.google.com/maps/documentation/javascript/examples/places-searchbox -->
<html>
   <head>
      <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
      <meta charset="UTF-8">
   
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
      <!-- NOTE: two libraries to load are comma-separated; otherwise last mention of the query string arg overwrites the previous -->
          <?php $key = $this->Api_model ->get_type_name_by_id('general_settings', '67', 'value'); ?>
      <script type="text/javascript"
         src="https://maps.google.com/maps/api/js?key=<?php echo $key; ?>&sensor=false&v=3.21.5a&libraries=drawing&signed_in=true&libraries=places,drawing"></script>
       
       <style>
           .hidden{
               display: none;
           }      
           
        /* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
  background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 35%;
    height: 76%;
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
  opacity: .9;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
.preimage
{
  width:100px;
  height:100px;
  margin: auto;
    display: block;
}

.margintop67
{
  margin-top:70px;
}
.succesiamge
{
  width:100px;
  height:100px;
  margin: auto;
    display: block;
}
.displaynone{
  display: none;
}
.textcenter
{
  text-align:center;
}
           
           
/* checkmark */

.checkmark {
  width: 85px;
  height: 85px;
  border-radius: 50%;
  display: block;
  stroke-width: 3;
  stroke: #fff;
  stroke-miterlimit: 10;
  box-shadow: inset 0px 0px 0px #7ac142;
  animation: fill .4s ease-in-out .4s forwards, scale .3s ease-in-out .9s both;
}

.checkmark__circle {
  stroke-dasharray: 166;
  stroke-dashoffset: 166;
  stroke-width: 50;
  stroke-miterlimit: 10;
  stroke: #7ac142;
  fill: none;
  animation: stroke 0.6s cubic-bezier(0.65, 0, 0.45, 1) forwards;
}

.checkmark__check {
  transform-origin: 50% 50%;
  stroke-dasharray: 48;
  stroke-dashoffset: 48;
  animation: stroke 0.3s cubic-bezier(0.65, 0, 0.45, 1) 0.8s forwards;
}

@keyframes stroke {
  100% {
      stroke-dashoffset: 0;
  }
}

@keyframes scale {
  0%,
  100% {
      transform: none;
  }
  50% {
      transform: scale3d(1.1, 1.1, 1);
  }
}

@keyframes fill {
  100% {
      box-shadow: inset 0px 0px 0px 30px #7ac142;
  }
}

.ico_divs {
  margin-top: 11pc;
}
        /* end modal */
           
           
#snackbar {
  visibility: hidden;
  min-width: 250px;
  margin-left: -125px;
  background-color: #333;
  color: #fff;
  text-align: center;
  border-radius: 2px;
  padding: 16px;
  position: fixed;
  z-index: 1;
  left: 50%;
  bottom: 30px;
  font-size: 17px;
}

#snackbar.show {
  visibility: visible;
  -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
  animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

@-webkit-keyframes fadein {
  from {bottom: 0; opacity: 0;} 
  to {bottom: 30px; opacity: 1;}
}

@keyframes fadein {
  from {bottom: 0; opacity: 0;}
  to {bottom: 30px; opacity: 1;}
}

@-webkit-keyframes fadeout {
  from {bottom: 30px; opacity: 1;} 
  to {bottom: 0; opacity: 0;}
}

@keyframes fadeout {
  from {bottom: 30px; opacity: 1;}
  to {bottom: 0; opacity: 0;}
}
</style>
      <style type="text/css">
         @media only screen and (max-width:768px) {
              .modal-content {
  background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 88% !important;
    height: 76%;
}
         #panel {
         font-family: Arial, sans-serif;
         font-size: 13px;
         float: none Im !important;
         margin: 10px;
         width: 240px !important;
         padding-left: 20px;
         height: 200px !important;
         }
         .mainbody
         {
         display: flex;
         width: 100%;
         flex-direction: column-reverse;
         }
         }
         #map, html, body {
         padding: 0;
         margin: 0;
         height: 100%;
         }
         #panel {
         width: 242px;
         font-family: Arial, sans-serif;
         font-size: 13px;
         float: right;
         margin: 10px;
         }
         #color-palette {
         clear: both;
         }
         .color-button {
         width: 14px;
         height: 14px;
         font-size: 0;
         margin: 2px;
         float: left;
         cursor: pointer;
         }
         #delete-button {
         margin-top: 5px;
         }
          
      </style>
      <script type="text/javascript">
         var drawingManager;
         var selectedShape;
         var colors = ['#1E90FF', '#FF1493', '#32CD32', '#FF8C00', '#4B0082'];
         var selectedColor;
         var colorButtons = {};
          var corrdinates1 =new Array();
         function clearSelection() {
           if (selectedShape) {
             if (typeof selectedShape.setEditable == 'function') {
               selectedShape.setEditable(false);
             }
             selectedShape = null;
           }
          // curseldiv.innerHTML = "<b>cursel</b>:";
         }
         
         function updateCurSelText(shape) {
           posstr = "" + selectedShape.position;
           if (typeof selectedShape.position == 'object') {
             posstr = selectedShape.position.toUrlValue();
           }
           pathstr = "" + selectedShape.getPath;
           if (typeof selectedShape.getPath == 'function') {
             pathstr = "[ ";
             for (var i = 0; i < selectedShape.getPath().getLength(); i++) {
               
               // .toUrlValue(5) limits number of decimals, default is 6 but can do more
               pathstr += selectedShape.getPath().getAt(i).toUrlValue() + " , ";
                corrdinates1.push(selectedShape.getPath().getAt(i).toUrlValue());
                
              
           
             }
             pathstr += "]";
           }
           bndstr = "" + selectedShape.getBounds;
           cntstr = "" + selectedShape.getBounds;
           if (typeof selectedShape.getBounds == 'function') {
             var tmpbounds = selectedShape.getBounds();
             cntstr = "" + tmpbounds.getCenter().toUrlValue();
             bndstr = "[NE: " + tmpbounds.getNorthEast().toUrlValue() + " SW: " + tmpbounds.getSouthWest().toUrlValue() + "]";
           }
           cntrstr = "" + selectedShape.getCenter;
           if (typeof selectedShape.getCenter == 'function') {
             cntrstr = "" + selectedShape.getCenter().toUrlValue();
           }
           radstr = "" + selectedShape.getRadius;
           if (typeof selectedShape.getRadius == 'function') {
             radstr = "" + selectedShape.getRadius();
           }
           curseldiv.innerHTML =  pathstr;
          
             $("#coordinates").val(corrdinates1);
         }
         
         function setSelection(shape, isNotMarker) {
           clearSelection();
           selectedShape = shape;
           if (isNotMarker)
             shape.setEditable(true);
           selectColor(shape.get('fillColor') || shape.get('strokeColor'));
           updateCurSelText(shape);
         }
         
         function deleteSelectedShape() {
           if (selectedShape) {
             
               curseldiv.innerHTML = '';  
             selectedShape.setMap(null);
             
             
           }
         }
          
  
          
 
         
         function selectColor(color) {
           selectedColor = color;
           for (var i = 0; i < colors.length; ++i) {
             var currColor = colors[i];
             colorButtons[currColor].style.border = currColor == color ? '2px solid #789' : '2px solid #fff';
           }
         
           // Retrieves the current options from the drawing manager and replaces the
           // stroke or fill color as appropriate.
           var polylineOptions = drawingManager.get('polylineOptions');
           polylineOptions.strokeColor = color;
           drawingManager.set('polylineOptions', polylineOptions);
         
           var rectangleOptions = drawingManager.get('rectangleOptions');
           rectangleOptions.fillColor = color;
           drawingManager.set('rectangleOptions', rectangleOptions);
         
           var circleOptions = drawingManager.get('circleOptions');
           circleOptions.fillColor = color;
           drawingManager.set('circleOptions', circleOptions);
         
           var polygonOptions = drawingManager.get('polygonOptions');
           polygonOptions.fillColor = color;
           drawingManager.set('polygonOptions', polygonOptions);
         }
         
         function setSelectedShapeColor(color) {
           if (selectedShape) {
             if (selectedShape.type == google.maps.drawing.OverlayType.POLYLINE) {
               selectedShape.set('strokeColor', color);
             } else {
               selectedShape.set('fillColor', color);
             }
           }
         }
         
         function makeColorButton(color) {
           var button = document.createElement('span');
           button.className = 'color-button';
           button.style.backgroundColor = color;
           google.maps.event.addDomListener(button, 'click', function() {
             selectColor(color);
             setSelectedShapeColor(color);
           });
         
           return button;
         }
         
          function buildColorPalette() {
            var colorPalette = document.getElementById('color-palette');
            for (var i = 0; i < colors.length; ++i) {
              var currColor = colors[i];
              var colorButton = makeColorButton(currColor);
              colorPalette.appendChild(colorButton);
              colorButtons[currColor] = colorButton;
            }
            selectColor(colors[0]);
          }
         
         /////////////////////////////////////
         var map; //= new google.maps.Map(document.getElementById('map'), {
         // these must have global refs too!:
         var placeMarkers = [];
         var input;
         var searchBox;
         var curposdiv;
         var curseldiv;
         
         function deletePlacesSearchResults() {
           for (var i = 0, marker; marker = placeMarkers[i]; i++) {
             marker.setMap(null);
           }
           placeMarkers = [];
           input.value = '';
             $("#cursel").val('');// clear the box too
         }
         
         /////////////////////////////////////
         function initialize() {
           map = new google.maps.Map(document.getElementById('map'), { //var
             zoom: 12,//10,
             center: new google.maps.LatLng(33.5190755, -111.9253654),//(22.344, 114.048),
             mapTypeId: google.maps.MapTypeId.ROADMAP,
             disableDefaultUI: false,
             zoomControl: true
           });
           curposdiv = document.getElementById('curpos');
           curseldiv = document.getElementById('cursel');
         
           var polyOptions = {
             strokeWeight: 0,
             fillOpacity: 0.45,
             editable: true
           };
           // Creates a drawing manager attached to the map that allows the user to draw
           // markers, lines, and shapes.
           drawingManager = new google.maps.drawing.DrawingManager({
               drawingControl: true,
                drawingControlOptions: {
      position: google.maps.ControlPosition.TOP_CENTER,
      drawingModes: [
        google.maps.drawing.OverlayType.POLYGON
      ],
    },
             markerOptions: {
               draggable: true,
               
             },
             polylineOptions: {
               editable: true
             },
             rectangleOptions: polyOptions,
             circleOptions: polyOptions,
             polygonOptions: polyOptions,
             map: map
           });
         
           google.maps.event.addListener(drawingManager, 'overlaycomplete', function(e) {
             //~ if (e.type != google.maps.drawing.OverlayType.MARKER) {
               var isNotMarker = (e.type != google.maps.drawing.OverlayType.MARKER);
               // Switch back to non-drawing mode after drawing a shape.
               drawingManager.setDrawingMode(null);
         
               // Add an event listener that selects the newly-drawn shape when the user
               // mouses down on it.
               var newShape = e.overlay;
               newShape.type = e.type;
               google.maps.event.addListener(newShape, 'click', function() {
                 setSelection(newShape, isNotMarker);
               });
               google.maps.event.addListener(newShape, 'drag', function() {
                 updateCurSelText(newShape);
                   
               });
               google.maps.event.addListener(newShape, 'dragend', function() {
                 updateCurSelText(newShape);
                    
               });
               setSelection(newShape, isNotMarker);
             //~ }// end if
           });
         
           // Clear the current selection when the drawing mode is changed, or when the
           // map is clicked.
           google.maps.event.addListener(drawingManager, 'drawingmode_changed', clearSelection);
           google.maps.event.addListener(map, 'click', clearSelection);
           google.maps.event.addDomListener(document.getElementById('delete-button'), 'click', deleteSelectedShape);
         
           buildColorPalette();
         
           //~ initSearch();
           // Create the search box and link it to the UI element.
            input = /** @type {HTMLInputElement} */( //var
               document.getElementById('pac-input'));
           map.controls[google.maps.ControlPosition.TOP_RIGHT].push(input);
           //
           var DelPlcButDiv = document.createElement('div');
           //~ DelPlcButDiv.style.color = 'rgb(25,25,25)'; // no effect?
           DelPlcButDiv.style.backgroundColor = '#fff';
           DelPlcButDiv.style.cursor = 'pointer';
           DelPlcButDiv.innerHTML = 'DEL';
           map.controls[google.maps.ControlPosition.TOP_RIGHT].push(DelPlcButDiv);
           google.maps.event.addDomListener(DelPlcButDiv, 'click', deletePlacesSearchResults);
         
           searchBox = new google.maps.places.SearchBox( //var
             /** @type {HTMLInputElement} */(input));
         
           // Listen for the event fired when the user selects an item from the
           // pick list. Retrieve the matching places for that item.
           google.maps.event.addListener(searchBox, 'places_changed', function() {
             var places = searchBox.getPlaces();
         
             if (places.length == 0) {
               return;
             }
             for (var i = 0, marker; marker = placeMarkers[i]; i++) {
               marker.setMap(null);
             }
         
             // For each place, get the icon, place name, and location.
             placeMarkers = [];
             var bounds = new google.maps.LatLngBounds();
             for (var i = 0, place; place = places[i]; i++) {
               var image = {
                 url: place.icon,
                 size: new google.maps.Size(71, 71),
                 origin: new google.maps.Point(0, 0),
                 anchor: new google.maps.Point(17, 34),
                 scaledSize: new google.maps.Size(25, 25)
               };
         
               // Create a marker for each place.
               var marker = new google.maps.Marker({
                 map: map,
                 icon: image,
                 title: place.name,
                 position: place.geometry.location
               });
         
               placeMarkers.push(marker);
         
               bounds.extend(place.geometry.location);
             }
         
             map.fitBounds(bounds);
           });
         
           // Bias the SearchBox results towards places that are within the bounds of the
           // current map's viewport.
           google.maps.event.addListener(map, 'bounds_changed', function() {
             var bounds = map.getBounds();
             searchBox.setBounds(bounds);
             curposdiv.innerHTML = "<b>curpos</b> Z: " + map.getZoom() + " C: " + map.getCenter().toUrlValue();
           }); 
             
             
                      /////////////////
         }
         google.maps.event.addDomListener(window, 'load', initialize);
      </script>
   </head>
   <style>
      .margintop10{
      margin-top: 10px;
      }
      .width100{
      width:100%;
      }
   </style>
   <body class="mainbody">
       <div id="snackbar">Check your feilds</div>
      <div id="panel">
         <div>
            <button id="delete-button" type="button" class="btn btn-danger" style="margin:auto;display:block;">Delete Selected Shape</button>
         </div>
         <div id="curpos" class="margintop10"></div>
         <h4 style="text-align:center;"><b>Add Zone</b></h4>
         <input type="text" id="title" class="margintop10 width100" style="  border: none;
            border-bottom: 1px solid grey;margin-bottom: 10px;outline:0;font-weight:600;" placeholder="Zone name">
         <div id="color-palette" ></div>
         <textarea id="cursel" readonly colls="100" style="height:100px;margin-bottom:20px;" class="margintop10 width100" row="30"></textarea>
         <br>
           <input type="hidden" id="coordinates" name="coordinates[]" >
         <button type="button" id="popmodal" onClick="saveData()" class="btn btn-primary" style="margin:auto;display:block;width:134px;border:none;outline:0;">Save</button>
          
         <!--<div id="note"><small>Note: markers can be selected, but are not graphically indicated; can be deleted, but cannot have their color changed.</small></div>-->
      </div>
      <input id="pac-input" type="text" placeholder="Search Box">
      <div id="map">A</div>
       
            <!-- The Modal -->
<div id="myModal" class="modal" data-keyboard="false" data-backdrop="static">

  <!-- Modal content -->
  <div class="modal-content">
    
    <div class="preloadimage margintop67 " id="loading">
      <img src="<?php echo base_url()?>uploads/general_image/Spinner-3.gif" class="preimage">
        <p class="textcenter" style="font-size:19px;">Please wait.. </p>
    </div>

    <div class="success_part margintop67 displaynone" id="successscreen">
     <svg class="checkmark succesiamge" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 52 52"><circle class="checkmark__circle" cx="26" cy="26" r="25" fill="none"/><path class="checkmark__check" fill="none" d="M14.1 27.2l7.1 7.2 16.7-16.8"/></svg>
      <h3 class="textcenter">
       Your zone is successfully saved!
      </h3>
      <p class="textcenter" style="font-size:19px;">Please press back button </p>
    </div>
   
  </div>

</div>
   </body>
</html>
<script>
  // Get the modal
  var modal = document.getElementById("myModal");
  
  // Get the button that opens the modal

  
  // Get the <span> element that closes the modal
  var span = document.getElementsByClassName("close")[0];
  
  // When the user clicks the button, open the modal 
  function popupload() {
    modal.style.display = "block";
  }
  
  // When the user clicks on <span> (x), close the modal
  span.onclick = function() {
    modal.style.display = "none";
  }
  
  // When the user clicks anywhere outside of the modal, close it
  window.onclick = function(event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  }
  </script>
<script>
    
   function saveData(){
       
       var position = $("#cursel").val();
       var title = $("#title").val();
        var coordinates = $("#coordinates").val();
       if(position!='' && title!=''){
       
       $.ajax({
               type: 'post',
               url: '<?php echo base_url(); ?>index.php/Zone/saveZone/do_add',
               data: ({position: position, title: title, coordinates: coordinates}),
               dataType: 'html', 
               beforeSend: function() {
                    popupload();
                   },
               success: function () {
                 $("#loading").addClass('displaynone')
                 $("#successscreen").removeClass('displaynone');
               }
             });
       } else{
           toaster();
       }
   }
   
    
    function toaster() {
  var x = document.getElementById("snackbar");
  x.className = "show";
  setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
}
       
</script>