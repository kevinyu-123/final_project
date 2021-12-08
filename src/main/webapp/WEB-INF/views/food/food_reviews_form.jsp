<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[음식 이름] | 리뷰 쓰기 - DiningLab</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
			for (var x = 0; x < content_files.length; x++) {
				// 삭제 안한것만 담아 준다. 
				if(!content_files[x].is_delete){
					 formData.append("article_file", content_files[x]);
				}
			}
		console.log(formData)
		// 다 올라가긴 하는데 왜 error 로 뜰까 ? 
		$.ajax({
	 	      type: "POST",
	 	      dataType:"json",
	 	   	  enctype: "multipart/form-data",
	 	      url: "file-upload",
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
<style>
<!--별 이미지 구현 --> /* 레이아웃 외곽 너비 400px 제한*/ 
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
	width: 30px;
	height: 30px;
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
	width: 30px;
	height: 30px;
	background-image: url('resources/detail_img/starrate.png');
	background-repeat: no-repeat;
	background-size: 30px 30px;
	cursor: pointer;
	background-color: #f0f0f0;
}

.rating .rate_radio:checked+label {
	background-color: #ff8;
}
</style>
</head>
<body>
	<div id="wrap">
		<form action="upload_food_review" method="post" enctype="multipart/form-data" onsubmit="return contentNull_alert();">
			<div>[음식] , 드셔보셨나요, 평가해 주세요</div>
			<input type="hidden" name="rate" id="rate" value="5" />
			<input type="hidden" name="memId" value="김떙땡" />
			<input type="hidden" name="foodId" value="1" />
					<!-- 별점  -->
			<div class="review_rating">
				<div id="rate_comment">환상적인 맛이에요!</div>
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
			<textarea name="content" id="content" rows="20" cols="20"
			placeholder="땡땡땡 님 , 음식에 대한 리뷰를 작성해주세요 ! "></textarea>
			<div style="color: #aaa;" id="content_cnt">(0 / 최대 1,000자)</div>
			<div> 음식 사진을 등록해 보세요~</div>
			<div id='image_preview'>
				<img style="width: 50px; height: 50px;"
					src='resources/detail_img/test.png' border='0' id="btn-upload">
				<input id="input_file" multiple="multiple" type="file" style="display:none;">
				<!-- 파일 업로드 스크립트 -->
				<script>
				$(document).ready(function()
						// input file 파일 첨부시 fileCheck 함수 실행
						{
							$("#input_file").on("change", fileCheck);
						});
				
				/**
				 * 첨부파일로직
				 */
				$(function () {
				    $('#btn-upload').click(function (e) {
				        e.preventDefault();
				        $('#input_file').click();
				    });
				});
				
				// 파일 현재 필드 숫자 totalCount랑 비교값
				var fileCount = 0;
				// 해당 숫자를 수정하여 전체 업로드 갯수를 정한다.
				var totalCount = 3;
				// 파일 고유넘버
				var fileNum = 0;
				// 첨부파일 배열
				var content_files = new Array();
				
				function fileCheck(e) {
				    var files = e.target.files;
				    
				    // 파일 배열 담기
				    var filesArr = Array.prototype.slice.call(files);
				    
				    // 파일 개수 확인 및 제한
				    if (fileCount + filesArr.length > totalCount) {
				      alert('파일은 최대 '+totalCount+'개까지 업로드 할 수 있습니다.');
				      return;
				    } else {
				    	 fileCount = fileCount + filesArr.length;
				    }
				    
				    // 각각의 파일 배열담기 및 기타
				    filesArr.forEach(function (f) {
				      var reader = new FileReader();
				      reader.onload = function (e) {
				        content_files.push(f);
				        let img = document.createElement('img')
				        img.setAttribute('style','width:50px;height:50px;z-index:none');
				        img.setAttribute('onclick',"fileDelete(" + fileNum + ")");
				        img.setAttribute('id',fileNum);
				        img.src = e.target.result;
				        document.getElementById('image_preview').insertBefore(img,image_preview.firstChild);
						console.log(img)
				        fileNum ++;
				      };
				      reader.readAsDataURL(f);
				    });
				    console.log(content_files);
				    //초기화 한다.
				    $("#input_file").val("");
				  }
				
				// 파일 부분 삭제 함수
				function fileDelete(fileNum){
				    content_files[fileNum].is_delete = true;
					$("#"+fileNum).remove();
					fileCount --;
				    console.log(content_files);
				}
				</script>
				<div>
					<input type="button" value="취소" onclick="location.herf='view'">
					<input type="submit" value="리뷰 올리기">
				</div>
			</div>
		</form>
	</div>
</body>
</html>