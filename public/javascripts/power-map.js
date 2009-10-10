		var map=null;
		var geocoder = null;
		var markerArray=[];
		var thexml=null,thexml2=null;
		var data=new Array(50);
		for(var z=0;z<50;z++){data[z]=new Array(50);}
		function initialize() {

				if (GBrowserIsCompatible()) {
					map = new GMap2(document.getElementById('map'));
					map.setCenter(new GLatLng(41.669074,-70.296205), 9);
					geocoder = new GClientGeocoder();
					map.setUIToDefault();

					$.ajax({
					type: "GET",
					url:"/data/test1.xml",
					async:false,
					//data:"action=gettypes",
					success: function(xml){
					thexml=xml;
						$.ajax({
					type: "GET",
					url:"/data/locs.xml",
					async:false,
					//data:"action=gettypes",
					success: function(xml2){
					thexml2=xml2;
					doStuff(xml);
					}
					});


					}
					});



					}
					}

			function doStuff(xml){

			var hour=$("#slider-converted-value").val();

					var i=0;
					$(thexml).find('timeframe').each(function(){



					//alert("loop");
						$(this).find('reading').each(function(){
						var id=$(this).find('id').text();


							var temp=$(this).find('id').text();
							data[i][temp]=$(this).find('level').text();
						});
					i++;
					});


					$(thexml2).find('location').each(function(){
					var id=$(this).find('id').text();
					//alert(id);
					var address=$(this).find('address').text();
					var lng=$(this).find('lng').text();
					var lat=$(this).find('lat').text();
					var point=new GLatLng(lng,lat);
						  	//map.setCenter(point, 13);
								var marker = new GMarker(point);
					var iconPath='';
					//alert(hour+id+data[hour][id]);
					//alert("Hour"+hour);
					if(data[hour][id]!=null){
					//alert(data[hour][id]+" "+hour+" "+lat);
					switch (data[hour][id]) {
							case '1':
								iconPath += '/images/power/green.png';
								break;
							case '2':
								iconPath += '/images/power/yellow.png';
								break;
							case '3':
								iconPath += '/images/power/red.png';
								break;


								}

								marker.getIcon().image = iconPath;
								marker.getIcon().iconSize=new GSize(20,20);
								marker.getIcon().shadow='';
								marker.getIcon().imageMap = [19,0,19,1,19,2,19,3,19,4,19,5,19,6,19,7,19,8,19,9,19,10,19,11,19,12,19,13,19,14,19,15,19,16,19,17,19,18,19,19,0,19,0,18,0,17,0,16,0,15,0,14,0,13,0,12,0,11,0,10,0,9,0,8,0,7,0,6,0,5,0,4,0,3,0,2,0,1,0,0];
								//marker.openInfoWindowHtml(address);
								map.addOverlay(marker);
							  }


					});
					}