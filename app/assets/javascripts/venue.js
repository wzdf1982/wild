function initialize() {
					var myLatlng_gmap = new google.maps.LatLng(40.006978,116.490649);
					var myOptions_gmap = {
						zoom: 18,
						center: myLatlng_gmap,
						mapTypeId: google.maps.MapTypeId.ROADMAP
					};

					var map_gmap = new google.maps.Map(document.getElementById("gmap"), myOptions_gmap);
					var marker_gmap = new google.maps.Marker({
						position: myLatlng_gmap,
						map: map_gmap
					});
				var infowin_content_gmap = "<div class=\"gmap_bubble\"><br><strong>Kuntai Hotel</strong><br />No.2, Qiyang Road, Chaoyang District, Beijing<br /><br></div>";
						var infowin_gmap = new google.maps.InfoWindow({ content: infowin_content_gmap });
						infowin_gmap.open(map_gmap,marker_gmap);
						google.maps.event.addListener(marker_gmap, "click", function() {
							infowin_gmap.open(map_gmap,marker_gmap);
						});
					}google.maps.event.addDomListener(window, 'load', initialize);