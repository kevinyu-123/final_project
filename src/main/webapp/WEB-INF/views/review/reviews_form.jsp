<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<head>
<meta charset="UTF-8">
<title><c:if test="${att eq 'food'}"> [음식 이름] | 리뷰 쓰기 - DiningLab</c:if>
<c:if test="${att eq 'rest'}"> ${restDTO.name } | 리뷰 쓰기 - DiningLab</c:if>
</title>
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
				$('#content_cnt').focus()
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
	 	var formData = new FormData(form);
	 	
			for (var x = 0; x < content_files.length; x++) {
				if(!content_files[x].is_delete){
					 formData.append("article_file", content_files[x]);
				}
			}
		console.log(formData)
		$.ajax({
	 	      type: "POST",
	 	      dataType:"json",
	 	   	  enctype: "multipart/form-data",
	 	      url: "file-upload",
	     	  data : formData,
	     	  processData: false,
	 	      contentType: false,
	 	      success: function (data) {
	 	    	  if(data.result == "OK"){

	 	    		 alert("리뷰 등록 완료");

	 	    		  window.location = document.referrer;
	 	    	  }else
	 	    		  alert("잠시 후 다시 실행해 주세요");
	 	      },
	 	      error: function (request, status, error) {
	 	    	alert("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
	 	    	
	 	     return false;
	 	      }
	 	    });
	 	    return false;
		}
</script>
<style>
body{
    background-color: #fff;
    position: relative;
    padding: 0;
    display: block;
}
#wrap{
	width: 30%;
	margin: auto;
	padding-top: 50px;
}
p {
text-align: center;
font-size: 25px;
}
.food-reviews-title p span {
	color: red;
	font-size: 30px;
}
#rate_comment {
	text-align: center;
	font-size: 30px;
}

#content {
	padding: 25px ;
	width: 90%;
	overflow:auto;
	resize:none;
	overflow:hidden;
	font-size: 17px;
	border: 0.1px thin gray;
	border-radius: 50px ; 
	text-align: center;
	margin: 0px 10px;
}
#content_cnt{
width: 100%;
text-align: right;
}
#image_preview{
width: 100%;
display: flex;
}
#image_preview img{
padding: 10px 10px;
}
.form-btn{
width: 100%;;
padding-bottom: 30px;
text-align: center;

}
.form-btn input{
width: 150px;
margin: auto;
}
<!--별 이미지 구현 --> /* 레이아웃 외곽 너비 400px 제한*/ 
.reviewform textarea {
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
}

.rating{
width: 380px;
margin: auto;
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
	z-index: 10;
	width: 70px;
	height: 70px;
	background-image: url('resources/detail_img/starrate.png');
	background-repeat: no-repeat;
	background-size: 70px 70px;
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
			<div class="food-reviews-title">
			<c:if test="${att eq 'food'}"><p><span>[음식]</span> , 드셔보셨나요, 평가해 주세요</p></c:if>
			<c:if test="${att eq 'rest'}"><p><span>${restDTO.name }</span> 에 대한 솔직한 리뷰를 써주세요</p></c:if>			
			</div>
			<!-- hidden form name 에 들어갈 것들 -->
			<c:if test="${att eq 'food'}">
				<input type="hidden" name="att"value="food" />
				
				<input type="hidden" name="rate" id="rate" value="5" />
				<input type="hidden" name="memId" value="${session_user }" />
				<input type="hidden" name="foodName" value="김치" />
				<input type="hidden" name="restId" value="0" />
				
			</c:if>
			<c:if test="${att eq 'rest'}">
				<input type="hidden" name="att" value="rest" />
				<input type="hidden" name="foodName" value="non" />
				<input type="hidden" name="rate" id="rate" value="5" />
				<input type="hidden" name="memId" value="${session_user }"/>
				<input type="hidden" name="restId" value="${restDTO.id }" />
			</c:if>

					<!-- 별점  -->
			<div class="review_rating">
			<hr>
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
						<p id="rate_comment">환상적인 맛이에요!</p>
				</div>
				<br>
			</div>
			<script type="text/javascript">
			function Rating(){};
			Rating.prototype.rate = 5;
			Rating.prototype.setRate = function(newrate){
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
			<c:if test="${att eq 'food'}"><textarea name="content" id="content" onkeydown="resize(this)" onkeyup="resize(this)"
			placeholder="${session_user } 님 , 음식에 대한 리뷰를 작성해주세요 ! "></textarea></c:if>
			<c:if test="${att eq 'rest'}"><textarea name="content" id="content" onkeydown="resize(this)" onkeyup="resize(this)"
			placeholder="${session_user } 님 , ${restDTO.name } 을 방문하시고 느낀 소감을 작성해주세요 !"></textarea></c:if>	
			
			<div style="color: #aaa;" id="content_cnt">(0 / 최대 1,000자)</div>
			<br>
			<c:if test="${att eq 'food'}"><p>마음에 드는 음식 사진을 등록해 주세요</p></c:if>
			<c:if test="${att eq 'rest'}"><p>${restDTO.name } 에 방문하시고 찍은 사진을 등록해 주세요</p></c:if>				
			
			<div id='image_preview'>
				<table>
				<tr><td>
				<img style="width: 100px; height: 100px;"
					src='resources/detail_img/plus-icon.png' border='0' id="btn-upload"></td>
				<tr><td>
				<p style="color: #aaa; width: 100px; margin: auto; font-size: 16px;" id="imgcnt" >(0 / 최대 3장)</p>
				</td></tr>
				</table>
				<input id="input_file" multiple="multiple" type="file" style="display:none;">
				
				<!-- textarea scroll -->
				<script>
				function resize(obj) {
				    obj.style.height = '1px';
				    obj.style.height = (12 + obj.scrollHeight) + 'px';
				}
				</script>
				<!-- 파일 업로드 스크립트 -->
				<script>
				$(document).ready(function()
						{
							$("#input_file").on("change", fileCheck);
						});
				$(function () {
				    $('#btn-upload').click(function (e) {
				        e.preventDefault();
				        $('#input_file').click();
				    });
				});
				
				var fileCount = 0;
				var totalCount = 3;
				var fileNum = 0;
				var content_files = new Array();
				
				function fileCheck(e) {
				    var files = e.target.files;
				    
				    var filesArr = Array.prototype.slice.call(files);
				    
				    if (fileCount + filesArr.length > totalCount) {
				      alert('파일은 최대 '+totalCount+'개까지 업로드 할 수 있습니다.');
				      return;
				    } else {
				    	fileCount = fileCount + filesArr.length;
						var cnt = document.getElementById('imgcnt')
						cnt.innerText =  "("+fileCount+" / 3장)"
				    }
				    
				    var imgcnt = 0;
				    filesArr.forEach(function (f) {
				      var reader = new FileReader();
				      reader.onload = function (e) {
				        content_files.push(f);
				        let img = document.createElement('img')
				        img.setAttribute('style','width:100px;height:100px;z-index:none');
				        img.setAttribute('onclick',"fileDelete(" + fileNum + ")");
				        img.setAttribute('id',fileNum);
				        img.src = e.target.result;
				        document.getElementById('image_preview').insertBefore(img,image_preview.firstChild);
						console.log(img)
				        fileNum ++;
				      };
				      reader.readAsDataURL(f);
				    });
				   
				    $("#input_file").val("");
				  }
				
				function fileDelete(fileNum){
				    content_files[fileNum].is_delete = true;
					$("#"+fileNum).remove();
					fileCount --;
					var cnt = document.getElementById('imgcnt')
					cnt.innerText =  "("+fileCount+" / 3장)"
				    console.log(content_files);
				}
				</script>
			</div>
			<br>
				<div class="form-btn">
					<input type="button" class="btn btn-secondary btn-lg" value="취소" onclick="location.href='v'">
					<input type="submit"  class="btn btn-primary btn-lg" value="리뷰 올리기">
				</div>
		</form>
	</div>
</body>
</html>