<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>나라별 음식의 역사와 특색</title>
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
</style>
</head>
<body>
   <style>
#map {
   position: fixed;
   width: 50%;
}

#features {
   width: 50%;
   margin-left: 50%;
   font-family: sans-serif;
   overflow-y: scroll;
   background-color: #fafafa;
}

section {
   padding: 30px 50px;
   line-height: 25px;
   border-bottom: 2px solid #ddd;
   opacity: 0.25;
   font-size: 13px;
}

section.active {
   opacity: 1;
}

section:last-child {
   border-bottom: thick;
   margin-bottom: 800px;
}
img{
   width: 200px;
   height: 200px;
}
</style>

   <div id="map"></div>
   <div id="features">
      <section id="korea" class="active">
         <h2><a name="korea">대한민국</a></h2>
         <p>한국음식은 최근 건강식으로 세계적인 각광을 받고 있다. 각종 채소를 유산균으로 발효시킨 김치는 한국의 대명사로 불릴만큼 널리 알려져 있으며, 불고기, 갈비, 비빔밥등도 세계인들이 즐겨 찾는 한식이다.
            한국은 삼면이 바다로 둘러싸여 있고, 내륙은 평야와 산지와 하천으로 되어있어 어패류와 해초류, 농산물, 축산물, 산지채취 나물 및 버섯 등 다양한 식재료가 생산된다.
            특히 김치, 나물, 절임, 쌈, 장아찌 등 각종 채소와 산채를 조리하는 방식과 각종 어패류를 젓갈, 염장, 건조하여 보관하는 방법이 발달하였다. 
            식재료를 조미하는 간장 ·된장 ·고추장 등의 양조법도 매우 발달하였다. 주재료와 부재료를 배합하고 맛을 보완하는 데는 고추 ·후추 ·생강 ·파 ·마늘 ·부추 ·산초와 같은 다양한 향신료를 사용한다.<br>
            향토음식은 그 지역 공간의 지리적, 기후적 특성을 갖고 생산되는 지역 특산물로 그 지역에서만 전수되어 오는 고유한 조리법으로 만들어진 토속 민속음식이라 할 수 있다.
            즉, 향토음식은 고장마다 전승되는 세시풍속이나 통과의례 또는 생활 풍습 등은 문화적 특질 뿐 아니라 향토음식이 지니고 있는 영양적 의의도 크다고 본다.
            대표적으로 홍어회와 과메기를 들 수 있다.
            <small id="citation"><a href="${contextPath }/nation?nation=대한민국">더 보러가기</a></small></p>
      </section>
      <section id="japan">
         <h2><a name="japan">일본</a></h2>
         <p>일본도 한국과 사실상 마찬가지로 밥이 주식이며, 부식으로 반찬이 놓인다.
          또 섬나라이므로 신선한 어패류가 풍부하여 생선 요리가 다양하게 발달되어 있으며, 그 중에서도 생선회가 유명하다.
          자극적인 조미료나 향신료를 많이 사용하지 않으므로 맛이 담백하다. 모양과 빛깔, 그릇에 담는 기술이 뛰어나다.
          생선이 아닌 육류를 재료로 한 음식을 먹기 시작한 것은 메이지유신 이후인데, 이것은 675년 불교의 영향을 받은 덴무 천황이 칙서를 내려 육식을 금지한 후 1200년 만의 일이었다.<br>
          육식이 해금되었을 때에는 전통과 풍속으로 내려온 것처럼 육류를 불결하고 흉측한 것으로 여겨 꺼리는 사람이 많았다.
          재료의 측면에서 일본 전통요리의 간장과 미림, 다시국물, 사케를 섞은 양념을 사용한다. 혹은 미소나 참깨 페이스트 등을 사용하기도 한다.
          주로 사용되는 식재료는 돼지고기, 생선이 주로 사용되고, 다양한 종류의 채소를 활용한다.<br>
          특히 일본인들은 가정에서 요리할 때도 지역 특산물, 시기에 맞는 제철 채소와 재료를 사용하는 것을 매우 중요하게 생각한다.
          일본 가정식은 절제되고, 자극적이지 않은 맛으로 요리되어 정갈하고 소박한 형태로 차려진다.
          재료 본연의 맛을 살리는 요리법이지만, 요리에 따라 매우 단순한 맛으로 느껴지기도 한다.
         <small id="citation"><a href="${contextPath }/nation?nation=일본">더 보러가기</a></small></p>
      </section>
      <section id="Taiwan">
         <h2><a name="taiwan">대만</a></h2>
         <p>타이완섬은 사방이 바다로 둘러싸여 있으며, 섬의 중앙부에 3,000m 급의 산들이 남북으로 뻗어 있는 등 비교적 작은 지역 임에도 불구하고,
         섬 안에 다양한 지형과 풍부한 자연 조건을 갖추고 있는 것으로 알려져 있으며, 풍부한 해산물, 산의 산물 등 많은 식재를 갖추고 있다. 
         타이완 요리는 푸젠 요리를 기반으로 하여 타이완에서 자라는 풍부한 식재를 포함한 향토 요리로 독립적으로 발전해 온 것이다.<br>
         그 특징은 토속 요리(일본 통치 전)에서 기름을 많이 사용하는 다른 지역의 중국 요리와 달리 비교적 담백하며, 소박하고, 섬세한 맛을 내는 요리가 많고 소금기도 중국 본토에 비해 적은점을 들 수 있다.
          또한 하카 요리와 일본 요리의 영향을 받았기 때문에 간장을 기본으로 한 양념과 건어물과 소금이 자주 사용되는 공통점도 발견되고 있다. 한편, 튀긴 셜롯, 마늘, 젖빛고기, 바질 등 향이 강한 양념도 자주 추가된다.
         <small id="citation"><a href="${contextPath }/nation?nation=대만">더 보러가기</a></small></p>
      </section>
      <section id="HongKong">
         <h2><a name="hongkong">홍콩</a></h2>
         <p>우리나라 김치의 종류도 다양한 종류의 김치가 있듯이, 홍콩 또한 요리 방식 혹은 넣는 재료에 따라 다르게 다양한 음식으로 만들어 먹는다.
          예를 들면 홍콩의 대표음식인 딤섬 중에는 Shao Mai (광동어, Siu Maai / 燒賣)가 있으며 Shao Mai는 찜 만두이다.
           얇은 밀가루 층에 싸서 돼지고기와 새우 만든 것이 샤오마이다.
          그러나 자주색 쌀로 만든 Shao Mai 또는 토핑으로 메추리 달걀을 넣은 Shao Mai도 있다.
          홍콩에서는 음식의 양을 중요시 하고 요리의 전체적인 그림을 중요시하는 경향이 강하다.<br>
           홍콩 사람들은 자신이 지불하는 가격만큼 맛있고, 시각적으로 화려함이 가미된 음식을 좋아 한다.
            생선 요리는 일반적으로 사이즈가 큰 생선을 좋아하는 편이며, 다채로운 조미료를 통해 풍미를 살리는 것을 중요시 한다.
           핫팟(중국식 샤브샤브)을 먹을 때 또한 많은 양의 식재료를 한꺼번에 올려놓고 먹기도 한다.
         <small id="citation"><a href="${contextPath }/nation?nation=홍콩">더 보러가기</a></small></p>
      </section>
      <section id="Mongol">
         <h2><a name="mongol">몽골</a></h2>
         <p>몽골 초원민의 식탁은 하얀 음식과 빨간 음식으로 채워진다. 하얀 음식은 가축의 젖으로 만든 각종 유제품을 총칭하는 말이다. 
         여름에서 가을까지 충분히 짜낸 우유로 여러 가지 유제품을 만든다. 유제품은 보존식품으로서 1년 내내 먹는 음식이다. 
         그러나 그 질과 양에서 유제품이 가장 풍성한 계절은 역시 여름이다. 한편 빨간 음식은 가축을 도살하여 얻는 육류를 총칭하는 말이다. 
         가을에 통통하게 살찐 가축을 도살해 혹한기에 대비한다. 따라서 육식이 가장 풍성한 계절은 기본적으로 겨울이다. 
         몽골 초원민의 식탁은 이와 같이 여름을 정점으로 하는 하얀 음식과 겨울을 정점으로 하는 빨간 음식이라는 명료한 계절성을 갖는 두 가지 주식에 의하여 유지되고 있다.
         모두가 가축이 가져다주는 큰 선물이다.<br>
         여름날 몽골 초원에서는 많은 유목민들이 유제품을 널빤지에 펴거나 가죽부대에 넣어 천막 위에서 햇볕에 말린다.
         유제품을 말리기 위한 받침대를 마련하기도 하고,새의 피해를 막기 위해 죽은 까치를 매단 경우도 여름철 몽골 초원에서는 좋은 구경거리가 된다.<br>
         일반적으로 하얀 음식은 그 색깔 때문에 청렴과 진심을 상징하는 것으로 인식된다. 하얀 음식에 더하여 빨간 음식은 풍성함을 나타낸다.
         몽골의 대표적 화가 '샤라브'가 그린 가을풍경 속에도 양의 도살장면이 포함되어 있는데, 
         양을 여덟 개 부위로 해체해서 삶은 후, 살아 있을 때와 유사한 모습으로 그릇에 담아 내놓는다.
         그것은 슈우스라 불리고, 초원에서 최고의 접대요리다.
         <small id="citation"><a href="${contextPath }/nation?nation=몽골">더 보러가기</a></small></p>
      </section>
      <section id="Thailand">
         <h2><a name="thailand">태국</a></h2>
         <p>태국 요리(泰國料理, 태국어: อาหารไทย 아한 타이[*])는 동남아시아에 있는 태국의 요리이다. 태국 요리(Thai 料理)로도 부른다.
          열대과일과 쌀 그리고 다양한 향신료들이 들어가는 특징을 지닌다.
         태국은 지리적으로 열대 기후대에 속하며, 매우 비옥한 토지와 풍부한 물, 태양열을 바탕으로 한 세계적인 곡창지대이며 열대 과일과 향신료가 풍부한 나라이다.
          내륙의 강에는 다양한 민물고기들이 서식하며, 삼면이 바다와 접해 있어 각종 해산물들이 풍부하다. <br>
         오랜 세월 자유와 평화, 풍요를 누려 식량난을 겪어 본 적이 없었기 때문에 일반 국민들의 식생활 문화가 크게 발전했다.   
         인도와 중국 사이, 동남아시아 중앙에 위치하여 여러 문화의 영향을 받은 태국은 음식 문화에 있어서도 각 나라의 영향을 많이 받았다. 
         국물이 진한 카레의 일종인 깽은 인도에서, 국수, 만두, 볶음 요리는 중국에서, 달콤한 과자류는 포르투갈에서 전래된 것이다. 
         하지만 자국의 토착적인 전통음식문화와 함께 혼재되어서 발달했다는 것이 주목할 점이다. 인도식 카레를 코코넛기름으로 볶는 것이 그 사례이다. 
         더운 나라이기 때문에 뜨거운 국이나 탕보다는 볶음 요리가 더 발달하였다. 매운맛, 신맛, 단맛 등 다양한 맛이 하나의 조화를 이룬다. <br>
         세계 3대 수프 중 하나인 똠 얌 꿍에서 그 특징이 잘 드러난다. 각종 허브나 향신료를 잘 이용하는 것도 하나의 특징이다.
          대표적으로 고수 잎, 바질, 레몬그래스, 박하 등의 허브와 육두구, 생강, 타마린드, 창포 등의 향신료가 있다.   
         <small id="citation"><a href="${contextPath }/nation?nation=태국">더 보러가기</a></small></p>
      </section>
      <section id="Vietnam">
         <h2><a name="vietnam">베트남</a></h2>
         <p>베트남은 지리적 위치와 프랑스 식민지, 미국의 파병, 많은 전쟁 등의 역사적 상 황에 의해 중국, 인도, 프랑스 등의 영향을 받아 다양한 음식들이 발달했으며 전통적인 음식도 발달했다.
          특히 베트남의 영토는 남북간 직선거리가 약 1,600km 이므로 각 지역별 특색이 나타나며 고산족과 같은 소수민족이 54개여서 각각의 고유한 음식문화를 유지하고 있다.
         베트남인의 주식은 컴com, 밥이고, 포 pho, 쌀국수도 때때로 먹으며, 쌀이 찰기가 없다. <br>
         반찬은 고기, 생채, 국으로 분류할 수 있다. 밥, 느억맘, 국, 생선, 고기음식, 채소 음식, 피클, 생채소 등이 식사에 오른다. 
         일상적인 반찬으로는 숙주, 죽순, 부추, 가지 등을 볶거나 튀긴 음식들이 있으며 두부와 튀긴 유부도 즐겨 먹는다.
         식사 할 때 마시는 물은 짜다 (jra da) 라고 불리는 차를 끓인 물에 얼음을 넣은 것이다. 이 물은 기름기 많은 음식을 먹을 때 좋다.<br>
          베트남에서는 젓갈 발효 음식인 느억맘을 장으로 이용하여 베트남 요리의 독특한 맛을 느끼게 한다.   
         또한 베트남에서는 간장, 마늘, 고추를 즐겨 먹는다. 조리법으로는 데치기, 굽기, 튀기기, 볶기, 조리기 등이 이용되는데, 
         중국 냄비와 비슷한 웍으로 볶아내는 조리법이 주로 이용된다.
         <small id="citation"><a href="${contextPath }/nation?nation=베트남">더 보러가기</a></small></p>
      </section>
      <section id="Laos">
         <h2><a name="laos">라오스</a></h2>
         <p>라오스 요리(Laos 料理, 라오어: ອາຫານລາວ 아한 라오)는 대륙 동남아시아에 있는 라오스의 요리이다. 라오스 민족과 북동부의 태국에서 소비되는 요리의 형식으로, 
         동남아시아 내에서도 독특한 요리로 꼽힌다. 라오스의 기본 요리는 찹쌀밥이다. 양강근과 생선 소스를 많이 섭취한다. <br>
         라오스의 가장 대표적인 음식으로는 랍이 있다. 이 요리는 향신료와 육류 혹은 생선을 조린 것으로서 푸른색 채소와 허브를 한데 모아서 요리하기도 한다. 
         다른 특색있는 요리로는 땀 막훙이 있는데 풋파파야 샐러드이다.
         라오스 요리는 많은 지역차가 존재한다. 지방에 따라 재료나 식습관이 다르기 때문에 차이가 나타난다. <br>
         프랑스의 영향도 두드러져서 프랑스식과 유사한 바게트 빵도 쉽게 거리에서 살 수 있다. 베트남 요리 식당도 흔하다.
         라오스 요리의 특징은 동남아시아 요리 중에서도 독특한 특징을 지녔다. 먼저 초록색 야채가 어느 요리를 막론하고 등장한다.
         거의 모든 요리에 등장한다고 볼 수 있다. 또한 세이보리 요리는 다른 요리와 다르게 결코 달지 않다.
         달거나 시큼한 맛은 전통적인 라오스 요리가 아닌 것이어서 이국 요리로 치부된다. 세 번째로 요리에 쓴 맛이 난다는 것이다. 
         라오스에서는 "단 것이 어지럽게 하고 쓴 맛이 좋은 것이다"("van pen lom; khom pen ya,")라는 말이 있다.
         <small id="citation"><a href="${contextPath }/nation?nation=라오스">더 보러가기</a></small></p>
      </section>
      <section id="Philippine">
         <h2><a name="philippine">필리핀</a></h2>
         <p>필리핀 요리는 음식이 쉽게 상할 수 있는 열대지방의 특성에 따라, 튀김과 구이중심의 요리문화가 발달해 있다.
          필리핀의 요리는 중국, 인도네시아, 스페인 등 여러 나라의 특성이 뒤섞여 복합적이지만, 중국이나, 태국정도의 미식문화는 아니다.
          필리핀 사람들의 일상적인 음식은 주로 쌀과 생선 요리를 중심으로 한 해산물과 닭고기 요리이다. 필리핀인들이 즐기는 시니강(Sinigang)은 우리나라의 국이나 탕종류로 보면 된다.<br>
          주로, 새우, 야채, 닭고기 등을 넣어 만든 스프로 뜨거울 때 먹어야 맛있다.룸피앙(Lumpia, 롤빵)와 판싯(Pancit, 잡채) 등도 있으며, 
          인기 있는 레천(Lechon : 새끼돼지구이)은 스페인의 애저요리에 기원을 둔 음식이다.
          과일로는 호주산 망고와 더불어 세계 최고 수준이란 필리핀 망고를 특히 먹어볼 만하며 파인애플, 파파야, 망고스틴, 두리언, 칼라만시 등의 열대 과일이 풍부하다.
          Halohalo 는 필리핀판 빙수이다. 아이스크림에 과일을 듬뿍 넣어 만들기 때문에 맛이 환상적이다.
          이외에 세계적으로 유명한 산미겔 맥주 이외에도 망고(그린,엘로) 쉐이크. 칼라만시 주스도 필리핀에서만 맛볼 수 있는 별미이다.<br>
          7천 여개의 크고 작은 섬으로 이루어진 필리핀에서 해산물만큼 풍부한 음식재료도 없다.거의 모든 식당마다 각기 다른 조리법을 이용한 자신들만의 해산물 요리를 선보이고 있을 정도이다.
           해산물을 이용한 전통 요리들은 일찍이 보르네오 섬에서 건너온 초기 개척자들, 즉 말레이 족의 음식에서 발생한 것으로 필리핀 요리 중에서 역사가 가장 오래 되었다.
          새우, 게, 굴, 생선, 가재 등을 이용한 기본적인 해산물 요리는 대부분 튀기거나 구워서 다양한 소스와 함께 먹는다. 붉은 색의 라푸라푸는 필리핀 사람들이 가장 즐겨먹는 생선이며, 
          다바오 지방의 이니호 나팡가 (구운 참치머리 요리)도 유명하다.
         <small id="citation"><a href="${contextPath }/nation?nation=필리핀">더 보러가기</a></small></p>
      </section>
      <section id="Singapore">
         <h2><a name="singapore">싱가폴</a></h2>
         <p>싱가포르 요리는 크게 중국, 말레이, 인도 그리고 혼혈문화가 빚어낸 페라나칸 요리로 나뉜다.
          이중 가장 다양한 것은 역시 중국 요리다. 중국 대륙의 모든 음식은 싱가포르에 다 있다고 해도 과언이 아닐 정도. 상하이, 
          북경식 요리부터 남쪽의 광동, 홍콩 요리까지 없는 것이 없다.<br>
          말레이 요리는 중국 음식만큼 대중적이지는 않지만 향기로운 뿌리와 생강, 심황, 마늘, 고추, 레몬풀, 
          말린 새우장 등 각종 조미료와 향신료를 사용해 열대에 사는 싱가포르인들의 식욕을 자극한다.
          인도 요리 또한 싱가포르 사람들이 즐겨 먹는 요리로 ‘리틀 인디아’에 가면 다양한 인도 음식을 맛볼 수 있다. <br>
          인도 요리는 클로브(정향), 코리앤더(고수), 칼다몬(생강과의 열매), 커민(미나릿과의 식물), 펜넬(회향) 등의 향신료가 필수적이다.
          이외에 싱가포르만의 독특한 음식문화인 페라나칸 요리가 있다. 19세기 말 일거리를 찾아 싱가포르로 이주해온 중국 남자들이 말레이시아 여성과 결혼해 
          가정을 이루면서 중국과 말레이 문화의 혼합인 페라나칸 문화가 탄생했다. <br>
          이들의 음식은 중국인들이 즐겨 먹는 돼지고기에 말레이시아 조미료(코코넛 밀크와 향이 있는 뿌리, 허브, 칠리, 말린 향신료 등)를 넣어 만든다.
          예를 들어 튀긴 돼지고기 같은 전형적인 중국 요리에 코코넛 등의 열대과일이나 레몬풀과 향신료 등의 말레이식 재료를 섞는 것이다.<br>
          자극이 덜한 중국 음식에는 말레이시아의 매콤한 양념인 삼발이 첨가된다.
          또 말레이 요리에 면이나 숙주, 간장 등의 중국 재료를 첨가하는 식의 퓨전 푸드가 바로 독특한 페라나칸 요리다.
         <small id="citation"><a href="${contextPath }/nation?nation=싱가폴">더 보러가기</a></small></p>
      </section>
   </div>
   <script>
var map = new maplibregl.Map({
container: 'map',
style:
'https://api.maptiler.com/maps/streets/style.json?key=get_your_own_OpIi9ZULNHzrESv6T2vL',
center: [123.6317591588421, 34.00034238853249],
zoom: 4,
bearing: 27,
pitch: 45
});
 
var chapters = {
      'korea': {
         bearing: 10,
         center: [127.42011273589043, 36.10608300472656],
         speed: 0.6,
         zoom: 6.7,
         pitch: 0
      },
      'japan': {
         speed: 0.6,
         center: [140.34453228241705, 38.2165455710298],
         bearing: 10,
         zoom: 5,
         pitch: 0
      },
      'Taiwan': {
         bearing: 10,
         center: [120.97713564548127, 23.445458237075044],
         zoom: 7.5,
         speed: 0.6,
         pitch: 0
      },
      'HongKong': {
         bearing: 10,
         center: [114.19121763103351, 22.261269414434864],
         speed: 0.6,
         zoom: 12
      },
      'Mongol': {
         bearing: 45,
         center: [104.92924183453522, 46.67319838750856],
         zoom: 5.5,
         pitch: 20,
         speed: 0.5
      },
      'Thailand': {
         bearing: 10,
         center: [100.48777986665783, 14.19123246585157],
         zoom: 7.5,
         speed: 0.5
      },
      'Vietnam': {
         bearing: 10,
         center: [105.9256005807598, 20.64544091100936],
         speed: 0.6,
         zoom: 6.7,
         pitch: 10
      },
      'Laos': {
         bearing: 10,
         center: [102.49542692920579, 20.056873759381617],
         speed: 0.6,
         zoom: 7,
         pitch: 20
      },
      'Philippine': {
         bearing: 10,
         center: [120.88476433720052, 15.336419228392728],
         speed: 0.6,
         zoom: 6,
         pitch: 20
      },
      'Singapore': {
         bearing: 10,
         center: [103.78183277683019, 1.4060834265039688],
         speed: 0.6,
         zoom: 11,
         pitch: 20
         }
      };
 
// On every scroll event, check which element is on screen
window.onscroll = function () {
   var chapterNames = Object.keys(chapters);
   for (var i = 0; i < chapterNames.length; i++) {
   var chapterName = chapterNames[i];
   if (isElementOnScreen(chapterName)) {
      setActiveChapter(chapterName);
      break;
      }
   }
};
 
   var activeChapterName = 'korea';
   function setActiveChapter(chapterName) {
      if (chapterName === activeChapterName) return;
 
   map.flyTo(chapters[chapterName]);
 
   document.getElementById(chapterName).setAttribute('class', 'active');
   document.getElementById(activeChapterName).setAttribute('class', '');
   activeChapterName = chapterName;
   }
 
   function isElementOnScreen(id) {
      var element = document.getElementById(id);
      var bounds = element.getBoundingClientRect();
   return bounds.top < window.innerHeight && bounds.bottom > 0;
   }
</script>

</body>
</html>