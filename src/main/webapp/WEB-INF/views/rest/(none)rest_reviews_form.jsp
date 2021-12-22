<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[음식점 이름] | 리뷰 쓰기 - DiningLab</title>

<style>
.bodyWrap{
width: 800px;
height: 1000px;
margin: auto;
}
#att_zone {
	width: 660px;
	min-height: 150px;
	padding: 10px;
	border: 1px dotted #00f;
}

#att_zone:empty:before {
	content: attr(data-placeholder);
	color: #999;
	font-size: .9em;
}

<!--
별 이미지 구현 --> /* 레이아웃 외곽 너비 400px 제한*/ 
.wrap {
	max-width: 480px;
	margin: 0 auto; /* 화면 가운데로 */
	background-color: #fff;
	height: 100%;
	padding: 20px;
	box-sizing: border-box;
}

.reviewform textarea {
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
}

.rating .rate_radio {
	position: relative;
	display: inline-block;
	z-index: 20;
	opacity: 0.001;
	width: 60px;
	height: 60px;
	background-color: #fff;
	cursor: pointer;
	vertical-align: top;
	display: none;
}

.rating .rate_radio+label {
	position: relative;
	display: inline-block;
	margin-left: -4px;
	z-index: 10;
	width: 60px;
	height: 60px;
	background-image: url('resources/detail_img/starrate.png');
	background-repeat: no-repeat;
	background-size: 60px 60px;
	cursor: pointer;
	background-color: #f0f0f0;
}

.rating .rate_radio:checked+label {
	background-color: #ff8;
}

.warning_msg {
	display: none;
	position: relative;
	text-align: center;
	background: #ffffff;
	line-height: 26px;
	width: 100%;
	color: red;
	padding: 10px;
	box-sizing: border-box;
	border: 1px solid #e0e0e0;
}

</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	// 글자수 제한
	$(document).ready(function() {
		$('#content').on('keyup', function() {
			// 천 단위마다 콤마
			$('#content_cnt').html("(" + $(this).val().length.toLocaleString('ko-KR') + " / 1,000)");
			if ($(this).val().length > 1000) {
				$(this).val($(this).val().substring(0, 1000));
				$('#content_cnt').html("(1,000 / 1,000)");
			}
		});
	});
	function contentNull_alert(){
		var content = document.getElementById('content')
		console.log(content.value)
		if(content.value == ""){
			alert('리뷰를 작성해 주세요');
			content.focus();
			return false;
		}
		var form = $("form")[0];
		console.log(form)
	 	var formData = new FormData(form);
		console.log(formData)
			for (var x = 0; x < sel_files.length; x++) {
				// 삭제 안한것만 담아 준다. 
				formData.append("article_file", sel_files[x]);
			}
		$.ajax({
	 	      type: "POST",
	 	      dataType:"json",
	 	   	  enctype: "multipart/form-data",
	 	      url: "rest-file-upload",
	     	  data : formData,
	     	  processData: false,
	 	      contentType: false,
	 	      success: function (data) {
	 	    	if(JSON.parse(data)['result'] == "OK"){
	 	    		alert("파일업로드 성공");
				} else
					alert("1서버내 오류로 처리가 지연되고있습니다. 잠시 후 다시 시도해주세요");
	 	      },
	 	      error: function (xhr, status, error) {
	 	    	alert("2서버오류로 지연되고있습니다. 잠시 후 다시 시도해주시기 바랍니다.");
	 	     return false;
	 	      }
	 	    });
	 	    return false;
	}
</script>
</head>
<!--  가져올 정보 : mem_id , rest_id  -->
<!--  내보낼 정보 : mem_id(memId), rest_id, rest_rate(rate), review(content), rev_pic(restImgs) -->
<body>
<div class="bodyWrap">
	<form action="upload_rest_Review" method="post" enctype="multipart/form-data" onsubmit="return contentNull_alert();">
		<div>[음식점] 에 대한 솔직한 리뷰를 써주세요</div>
		<input type="hidden" name="rate" id="rate" value="5" />
		<input type="hidden" name="memId" value="김떙땡" />
		<input type="hidden" name="restId" value="1" />
		<textarea name="content" id="content" rows="20" cols="50"
			placeholder="땡땡땡 님 , 주문하신 메뉴는 어떠셨나요? 식당의 분위기와 서비스도 궁금해요!"></textarea>
		<div style="color: #aaa;" id="content_cnt">(0 / 최대 1,000자)</div>
		<div>[사용자] 님의 [음식점] 에 대한 평가가 궁금해요~</div>
		<!-- 별점  -->
		<div class="review_rating">
			<div class="warning_msg">별점을 선택해 주세요.</div>
			<div class="rating">
				<!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
				<input type="checkbox" name="rating" id="rating1" value="1"
					class="rate_radio" title="1점" checked="checked"> <label for="rating1"></label>
				<input type="checkbox" name="rating" id="rating2" value="2"
					class="rate_radio" title="2점" checked="checked"> <label for="rating2"></label>
				<input type="checkbox" name="rating" id="rating3" value="3"
					class="rate_radio" title="3점" checked="checked"> <label for="rating3"></label>
				<input type="checkbox" name="rating" id="rating4" value="4"
					class="rate_radio" title="4점" checked="checked"> <label for="rating4"></label>
				<input type="checkbox" name="rating" id="rating5" value="5"
					class="rate_radio" title="5점" checked="checked"> <label for="rating5"></label>
			</div>
			<div id="rate_comment">환상적인 맛이에요!</div>
		</div>
		<script type="text/javascript">
//별점 마킹 모듈 프로토타입으로 생성
function Rating(){};
Rating.prototype.rate = 5;
Rating.prototype.setRate = function(newrate){
    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
    this.rate = newrate;
    let items = document.querySelectorAll('.rate_radio');
    var comment = document.querySelector('#rate_comment');
    console.log(comment)
    switch(newrate){
    case 1 : comment.textContent='평점1'; break;
    case 2 : comment.textContent='평점2'; break;
    case 3 : comment.textContent='평점3'; break;
    case 4 : comment.textContent='평점4'; break;
    case 5 : comment.textContent='평점5'; break;
    }
    console.log(newrate)
    items.forEach(function(item, idx){
        if(idx < newrate){
            item.checked = true;
        }else{
            item.checked = false;
        }
    });
}
let rating = new Rating();//별점 인스턴스 생성
document.addEventListener('DOMContentLoaded', function(){
    //별점선택 이벤트 리스너
    document.querySelector('.rating').addEventListener('click',function(e){
        let elem = e.target;
        if(elem.classList.contains('rate_radio')){
            rating.setRate(parseInt(elem.value));
            document.getElementById("rate").value=rating.rate
        }
    })
});
</script>
		<!-- 파일 드래그앤드롭 -->
		<div id='image_preview'>
			<div id='att_zone'
				data-placeholder='파일을 첨부 하려면 버튼을 클릭하거나 파일을 드래그앤드롭 하세요'>
				<input style='display: none;' type='file' id='restImgs'
					multiple='multiple' /> <img
					style="width: 100px; height: 100px;"
					src='resources/detail_img/test.png' border='0'
					onclick='document.all.restImgs.click();'>
			</div>
			<div id="img_cnt">( 0 / 3 )</div>
			<!--  파일 업로드 수정할 예정 -->
			<div id="d_file"></div>
		</div>
		<script>
 	// 해당 숫자를 수정하여 전체 업로드 갯수를 정함
  	var totalCount = 3;
   	// 파일 현재 필드 숫자 totalCount 랑 비교
  	var fileCount = 0;
( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
  imageView = function imageView(att_zone, restImgs){

    var attZone = document.getElementById(att_zone);
    var restImgs = document.getElementById(restImgs)
    var sel_files = [];
    
    // 이미지와 체크 박스를 감싸고 있는 div 속성
    var div_style = 'display:inline-block;position:relative;'
                  + 'width:100px;height:100px;margin:5px;border:1px solid #00f;z-index:1';
    // 미리보기 이미지 속성
    var img_style = 'width:100%;height:100%;z-index:none';
    // 이미지안에 표시되는 체크박스의 속성
    var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;'
                  + 'right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:#f00';

    restImgs.onchange = function(e){
      var files = e.target.files;
      var fileArr = Array.prototype.slice.call(files)
      // 파일 개수 확인 및 제한
      
      if(fileCount + fileArr.length > totalCount){
     	 alert('파일은 최대 '+totalCount+'개까지 업로드 할 수 있습니다.');
     	 return;
      }else{
     	 fileCount = fileCount + fileArr.length;
     	 
      }
      
      $('#img_cnt').html("( "+fileCount +" / "+totalCount+" ) ");
      console.log(sel_files)
      
      for(f of fileArr){
        imageLoader(f);
      }
    }  
  
    // 탐색기에서 드래그앤 드롭 사용
    attZone.addEventListener('dragenter', function(e){
      e.preventDefault();
      e.stopPropagation();
      $('#img_cnt').html("( "+fileCount +" / "+totalCount+" ) ");
    }, false)
    
    attZone.addEventListener('dragover', function(e){
      e.preventDefault();
      e.stopPropagation();
      $('#img_cnt').html("( "+fileCount +" / "+totalCount+" ) ");
    }, false)
  
    attZone.addEventListener('drop', function(e){
      var files = {};
      e.preventDefault();
      e.stopPropagation();
      var dt = e.dataTransfer;
      files = dt.files;
      // 파일 개수 확인 및 제한
      if(fileCount + files.length > totalCount){
     	 alert('파일은 최대 '+totalCount+'개까지 업로드 할 수 있습니다.');
     	 return;
      }else{
     	 fileCount = fileCount + files.length;
      }
      $('#img_cnt').html("( "+fileCount +" / "+totalCount+" ) ");
      for(f of files){
        imageLoader(f);
      }
      
    }, false)
    
    /*첨부된 이미리즐을 배열에 넣고 미리보기 */
    imageLoader = function(file){
      sel_files.push(file);
      var reader = new FileReader();
      reader.onload = function(ee){
        let img = document.createElement('img')
        img.setAttribute('style', img_style)
        img.src = ee.target.result;
        attZone.insertBefore(makeDiv(img, file),attZone.firstChild);
      }
      
      reader.readAsDataURL(file);
    }
    
    /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
    makeDiv = function(img, file){
      var div = document.createElement('div')
      div.setAttribute('style', div_style)
      
      var btn = document.createElement('input')
      btn.setAttribute('type', 'button')
      btn.setAttribute('value', 'x')
      btn.setAttribute('delFile', file.name);
      btn.setAttribute('style', chk_style);
      btn.onclick = function(ev){
    	fileCount -= 1; 
    	 $('#img_cnt').html("( "+fileCount +" / "+totalCount+" ) ");
        var ele = ev.srcElement;
        var delFile = ele.getAttribute('delFile');
        for(var i=0 ;i<sel_files.length; i++){
          if(delFile== sel_files[i].name){
            sel_files.splice(i, 1);      
          }
        }
        
        dt = new DataTransfer();
        for(f in sel_files) {
          var file = sel_files[f];
          dt.items.add(file);
        }
        restImgs.files = dt.files;
        var p = ele.parentNode;
        attZone.removeChild(p)
      }
      div.appendChild(img)
      div.appendChild(btn)
      return div
    }
  }
)('att_zone', 'restImgs')
</script>
		<div>
			<input type="button" value="취소" onclick="location.herf='view'">
			<input type="submit" value="리뷰 올리기">
		</div>
	</form>
</div>
</body>
</html>