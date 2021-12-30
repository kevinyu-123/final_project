<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>음식점 찾기</title>
<meta name="viewport" content="initial-scale=1,maximum-scale=1,user-scalable=no" />
<script src="https://unpkg.com/maplibre-gl@1.15.2/dist/maplibre-gl.js"></script>
<link href="https://unpkg.com/maplibre-gl@1.15.2/dist/maplibre-gl.css" rel="stylesheet" />
<style>
body {
	margin: 0;
	padding: 0;
}

#map {
	position: absolute;
	top: 0;
	bottom: 0;
	width: 100%;
}
.marker {
	display: block;
	border: none;
	border-radius: 50%;
	cursor: pointer;
	padding: 0;
}
	 a{
	 text-decoration: none;
	 }
	 a:hover{
	 color: red;
	 }
	.mapboxgl-popup {
	max-width: 10px;
	font: 12px/20px 'Helvetica Neue', Arial, Helvetica, sans-serif;
	}
	.rounded-rect {
	background: white;
	border-radius: 10px;
	box-shadow: 0 0 50px -25px black;
	align-content: center;
	background-color: rgba(0, 0, 0, 0.3);
  	margin: 0;
  	padding: 0;
}

.flex-center {
	position: absolute;
	display: flex;
	justify-content: center;
	align-items: center;
}

.flex-center.left {
	left: 0px;
}

.flex-center.right {
	right: 0px;
}

.sidebar-content {
	position: absolute;
	width: 95%;
	height: 95%;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 32px;
	color: gray;
}

.sidebar-toggle {
	position: absolute;
	width: 1.3em;
	height: 1.3em;
	overflow: visible;
	display: flex;
	justify-content: center;
	align-items: center;
}

.sidebar-toggle.right {
	left: -1.5em;
}

.sidebar-toggle:hover {
	color: #0aa1cf;
	cursor: pointer;
}

.sidebar {
	transition: transform 1s;
	z-index: 1;
	width: 300px;
	height: 100%;
}
table{
	margin: auto;
	width : 200px;
	height: 550px;
	align-content: center;
}
table button {
	width : 200px;
	height: 70px;
	overflow: visible;
	background: transparent;

}
#icon{
	width : 70px;
	height: 70px;
	


}
table a{
font-size: small;
text-decoration: none !important;
color:black;

}
table a:hover{
text-decoration: none;
color:white;
}

.right.collapsed {
	transform: translateX(295px);
}
#i{
	height: 30px;
	width:20px;
}
</style>

</head>
<body>
	<div id="map">
		<div id="right" class="sidebar flex-center right collapsed">
			<div class="sidebar-content rounded-rect flex-center">
				<table >
					<tr>
						<th><a href="${contextPath}/map/restaurant_info?nation=대한민국">
						<img id="icon" src="${contextPath}/resources/img/map/korea.png">대한민국</a></th>
					</tr>
					<tr>
						<th><a href="${contextPath}/map/restaurant_info?nation=싱가폴">
						<img id="icon" src="${contextPath}/resources/img/map/singapore.png">싱가폴</a></th>
					</tr>
					<tr>
						<th><a href="${contextPath}/map/restaurant_info?nation=대만">
						<img id="icon" src="${contextPath}/resources/img/map/taiwan.png">대만</a></th>
					</tr>
					<tr>
						<th><a href="${contextPath}/map/restaurant_info?nation=몽골">
						<img id="icon" src="${contextPath}/resources/img/map/mongolia.png">몽골</a></th>
					</tr>
					<tr>
						<th><a href="${contextPath}/map/restaurant_info?nation=일본">
						<img id="icon" src="${contextPath}/resources/img/map/japan.png">일본</a></th>
					</tr>
					<tr>
						<th><a href="${contextPath}/map/restaurant_info?nation=필리핀">
						<img id="icon" src="${contextPath}/resources/img/map/philippine.png">필리핀</a></th>
					</tr>
					<tr>
						<th><a href="${contextPath}/map/restaurant_info?nation=베트남">
						<img id="icon" src="${contextPath}/resources/img/map/vietnam.png">베트남</a></th>
					</tr>
					<tr>
						<th><a href="${contextPath}/map/restaurant_info?nation=라오스">
						<img id="icon" src="${contextPath}/resources/img/map/laos.png">라오스</a></th>
					</tr>
					<tr>
						<th><a href="${contextPath}/map/restaurant_info?nation=홍콩">
						<img id="icon" src="${contextPath}/resources/img/map/hongkong.png">홍콩</a></th>
					</tr>
					<tr>
						<th><a href="${contextPath}/map/restaurant_info?nation=태국">
						<img id="icon" src="${contextPath}/resources/img/map/thailand.png">태국</a></th>
					</tr>
				</table>
				<div class="sidebar-toggle rounded-rect right" onclick="toggleSidebar('right')">&larr;</div>
			</div>
		</div>
	</div>

	<script>
	var map = new maplibregl.Map(
			{
				container : 'map',
				style : 'https://api.maptiler.com/maps/streets/style.json?key=get_your_own_OpIi9ZULNHzrESv6T2vL',
				center : [ 126.98345066142599, 37.54776556070125 ],
				zoom : 11.5
			});
	
	var geojson = [];
	var json = JSON.parse('${jsonlist}');
	for(var i =0;i<json.length;i++){
	 geojson[i] = {
		'type' : 'FeatureCollection',
		'features' : [ {
			'type' : 'Feature',
			'properties' : {
				'iconSize' : [ 60, 60 ]	
			},
			'geometry' : {
				'type' : 'Point',
				'coordinates' : [ json[i].lng, json[i].lat ]
					}
				}]
			};
		}

			for(i =0;i<json.length;i++){
				geojson[i].features.forEach(function(marker) {
				// create a DOM element for the marker
				var el = document.createElement('div');
				el.className = 'marker';
				el.style.backgroundImage = 'url(${contextPath}/resources/img/map/restaurant.png)';
				el.style.width = marker.properties.iconSize[0] + 'px';
				el.style.height = marker.properties.iconSize[1] + 'px';

				new maplibregl.Marker(el)
				.setLngLat(marker.geometry.coordinates)
				.setPopup(new maplibregl.Popup()
				.setHTML("<label><b>상호명:</b> </label><a href='${contextPath}/restaurant?id="+json[i].id+"'>"+json[i].name +"</a><br><br><label><b>주소:</b> "+json[i].addr+"</label><br><br><label><b>특징:</b> "+json[i].main_ex+"</label><br><br><label><b>운영시간:</b> "+json[i].hours+"</label><br><br><label><b>전화번호:</b> "+json[i].tel+"</label>"))
				.addTo(map);
				});
			}


		function toggleSidebar(id) {
			var elem = document.getElementById(id);
			var classes = elem.className.split(' ');
			var collapsed = classes.indexOf('collapsed') !== -1;

			var padding = {};

			if (collapsed) {
				// Remove the 'collapsed' class from the class list of the element, this sets it back to the expanded state.
				classes.splice(classes.indexOf('collapsed'), 1);

				padding[id] = 300; // In px, matches the width of the sidebars set in .sidebar CSS class
				map.easeTo({
					padding : padding,
					duration : 1000
				// In ms, CSS transition duration property for the sidebar matches this value
				});
			} else {
				padding[id] = 0;
				// Add the 'collapsed' class to the class list of the element
				classes.push('collapsed');

				map.easeTo({
					padding : padding,
					duration : 1000
				});
			}

			// Update the class list on the element
			elem.className = classes.join(' ');
		}

		map.on('load', function() {
			toggleSidebar('left');
		});
	</script>

</body>
</html>