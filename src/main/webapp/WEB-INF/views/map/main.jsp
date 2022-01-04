<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>지도</title>

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
.rounded-rect {
   background: transparent;
   border-radius: 10px;
   box-shadow: 0 0 50px -25px black;
   align-content: center;


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
img{
   width : 60px;
   height: 60px;

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
   var map = new maplibregl.Map({
   container: 'map',
   style:
   'https://api.maptiler.com/maps/streets/style.json?key=get_your_own_OpIi9ZULNHzrESv6T2vL',
   center: [123.6317591588421, 34.00034238853249],
   zoom: 4.1
});
   
   map.on('load', function () {
   map.loadImage(
   '${contextPath}/resources/img/map/location.png',
   // Add an image to use as a custom marker
   function (error, image) {
      if (error) throw error;
      map.addImage('custom-marker', image);
      map.addSource('places', {
         'type': 'geojson',
         'data': {
         'type': 'FeatureCollection',
         'features': [
         {
         'type': 'Feature',
         'properties': {
         'description':
         '<strong>대한민국</strong><p>한국음식라 불리는 우리 민족 고유의 음식은, 그 음식을 중심으로 전개되는 식생활 관습과 더불어 지리적·역사적 환경에 가정 적합하도록 우리 조상들이 창안·발전시켜 온 민족적 지혜의 총화라 할 수 있습니다. <a href="${contextPath}/map/country_info#korea">더보기..</a></p>'
         },
         'geometry': {
         'type': 'Point',
         'coordinates': [127.8975774639818, 37.016895039288855]
            }
         },
         {
         'type': 'Feature',
         'properties': {
         'description':
         '<strong>일본</strong><p>일본은 쌀을 중심으로 보리·밀·좁쌀·수수·콩 등의 곡물을 중심으로 하여, 야채·어패류·새나 짐승의 고기 등을 부식으로 하는데, 이 점에 있어서는 한국과 비슷하다. <a href="${contextPath}/map/country_info#japan">더보기..</a></p>'
            },
         'geometry': {
         'type': 'Point',
         'coordinates': [139.04822365338362, 36.87217053426477]
            }
         },
         {
         'type': 'Feature',
         'properties': {
         'description':
            '<strong>대만</strong><p>대만 음식의 특징은 토속 요리(일본 통치 전)에서 기름을 많이 사용하는 다른 지역의 중국 요리와 달리 비교적 담백하며, 소박하고, 섬세한 맛을 내는 요리가 많고 소금기도 중국 본토에 비해 적은점을 들 수 있다.<a href="${contextPath}/map/country_info#taiwan">더보기..</a></p>'
            },
         'geometry': {
         'type': 'Point',
         'coordinates': [121.09516592411251, 24.401488990384777]
            }
         },
         {
         'type': 'Feature',
         'properties': {
         'description':
            '<strong>홍콩</strong><p>홍콩 사람들은 밥 먹을 때 일반적으로 젓가락을 사용하지만 포크와 나이프 또한 즐겨 사용한다. 아침 식사 시 홍콩식 쌀죽이나 딤섬을 먹으며, 서양식으로 소세지, 튀긴 달걀, 토스트를 먹는 것도 보편적이다.<a href="${contextPath}/map/country_info#hongkong">더보기..</a></p>'
            },
         'geometry': {
         'type': 'Point',
         'coordinates': [114.16441869551028, 22.406511255211882]
            }
         },
         {
         'type': 'Feature',
         'properties': {
         'description':
            '<strong>몽골</strong><p>몽골 음식의 특징 몽골의 전통 요리는 대체적으로 낙농 제품과 고기류로 구성된다. 몽골 유목민들은 말, 소, 야크, 낙타, 양, 염소, 산양, 당나귀, 영양, 젖소 등 기르던 동물로 생계를 꾸려왔기 때문이다. 고기는 수프나 고기 만두로 쓰이고 겨울에는 말려서 먹는다.<a href="${contextPath}/map/country_info#mongol">더보기..</a></p>'
            },
         'geometry': {
         'type': 'Point',
         'coordinates': [104.92924183453522, 46.67319838750856]
            }
         },
         {
         'type': 'Feature',
         'properties': {
         'description':
            '<strong>태국</strong><p>태국 음식맛의 특징은 음식에 따라 다르지만 대체로 고소하고 맵고 신맛이 나는 편이다. 거기에 다양한 향신료가 첨가됨으로 독특한 향미가 난다.<a href="${contextPath}/map/country_info#thailand">더보기..</a></p>'
            },
         'geometry': {
         'type': 'Point',
         'coordinates': [100.4877798666578,14.19123246585157]
            }
         },
         {
         'type': 'Feature',
         'properties': {
         'description':
            '<strong>베트남</strong><p>베트남 요리는 중국의 지배로 인해 중국 요리와 비슷한 점이 많지만, 중국 요리처럼 기름기가 많지 않고, 가까운 태국 요리와는 향채를 사용한다는 점에서 비슷하지만, 맵지 않다는 독특한 특징을 가지고 있다.<a href="${contextPath}/map/country_info#vietnam">더보기..</a></p>'
            },
         'geometry': {
         'type': 'Point',
         'coordinates': [107.88332558181497, 15.874781775069891]
            }
         },
         {
         'type': 'Feature',
         'properties': {
         'description':
            '<strong>라오스</strong><p>라오스의 가장 대표적인 음식으로는 랍이 있다. 이 요리는 향신료와 육류 혹은 생선을 조린 것으로서 푸른색 채소와 허브를 한데 모아서 요리하기도 한다. 다른 특색있는 요리로는 땀 막훙이 있는데 풋파파야 샐러드이다. 라오스 요리는 많은 지역차가 존재한다.<a href="${contextPath}/map/country_info#laos">더보기..</a></p>'
            },
         'geometry': {
         'type': 'Point',
         'coordinates': [102.33217780876834, 19.868520513547878]
               }
            },
         {
         'type': 'Feature',
         'properties': {
         'description':
            '<strong>필리핀</strong><p>공통적으로 필리핀 음식은 야채보다도 육류를 이용한 음식이 주를 이루며 그중 생선요리와 닭요리가 대부분을 차지한다. 필리핀의 음식은 한국과 같이 쌀이 주식을 이루고 있으며, "가타"라 불리는 코코넛 우유를 음식의 주 재료로 사용한다.<a href="${contextPath}/map/country_info#Philippine">더보기..</a></p>'
            },
         'geometry': {
         'type': 'Point',
         'coordinates': [120.88476433720052, 15.336419228392728]
               }
            },
         {
         'type': 'Feature',
         'properties': {
         'description':
            '<strong>싱가포르</strong><p>싱가포르는 중국계 화교들이 번성시킨 국가답게 중국계 음식도 맛볼 수 있으며 중국의 남쪽 음식에 영향을 많이 받았다. 중국의 남방 음식은 달짝지근 하면서 쌀국수, 담백한 볶음, 민물고기 요리가 대표적이다.<a href="${contextPath}/map/country_info#singapore">더보기..</a></p>'
            },
         'geometry': {
         'type': 'Point',
         'coordinates': [103.78183277683019, 1.4060834265039688]
               }
            }
         ]
      }
   });
 
      // Add a layer showing the places.
      map.addLayer({
         'id': 'places',
         'type': 'symbol',
         'source': 'places',
         'layout': {
         'icon-image': 'custom-marker',
         'icon-allow-overlap': true
               }
            });
         }
      );
       
         // Create a popup, but don't add it to the map yet.
         var popup = new maplibregl.Popup({
         closeButton: false,
         closeOnClick: false
         });
       
         map.on('click', 'places', function (e) {
         var coordinates = e.features[0].geometry.coordinates.slice();
         var description = e.features[0].properties.description;
          
         // Ensure that if the map is zoomed out such that multiple
         // copies of the feature are visible, the popup appears
         // over the copy being pointed to.
         while (Math.abs(e.lngLat.lng - coordinates[0]) > 180) {
         coordinates[0] += e.lngLat.lng > coordinates[0] ? 360 : -360;
         }
          
         new maplibregl.Popup()
         .setLngLat(coordinates)
         .setHTML(description)
         .addTo(map);
         });
         
      //Change the cursor to a pointer when the mouse is over the places layer.
      map.on('mouseenter', 'places', function () {
      map.getCanvas().style.cursor = 'pointer';
      });
       
      // Change it back to a pointer when it leaves.
      map.on('mouseleave', 'places', function () {
      map.getCanvas().style.cursor = '';
         });
      });
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
         
         var popup = new maplibregl.Popup({ closeOnClick: false })
         .setLngLat([150.88503108886545, 34.63076974121536])
         .setHTML('<h2>오른쪽 슬라이드를 이용하여 원하는 나라의 음식점을 찾아보세요!</h2>')
         .addTo(map);
         
</script>
 
</body>
</html>