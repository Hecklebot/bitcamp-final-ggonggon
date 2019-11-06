<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/recipe/form.css">
<style>
 #my-label {
  display: inline-block;
  padding: .5em .75em;
  margin-left: 32px;
  color: #fff;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #b0c364;
  cursor: pointer;
  border: 1px solid #b0c364;
  border-radius: .25em;
  -webkit-transition: background-color 0.2s;
  transition: background-color 0.2s;
 }
</style>
<title>레시피 수정</title>
</head>

<body>

<div id="app">
  <div>
      <div class="wrapper">
          <div class="site-main">
              <div class="container">
                  <div class="block-gird-item">
                      <div>
                          <form name="frmRecipe" action='update' method='post' enctype='multipart/form-data'>
                           <input type='hidden' name='recipeNo' value='${recipe.recipeNo}' readonly><br>
                              <div class="toobar"><strong class="title pull-left">레시피 수정 </strong></div>
                              <div class="block-write">
                                  <div class="block-content">
                                      <div class="row form-group">
                                          <div class="col-xs-2"><label class="label">작성자</label></div>
                                          <div class="col-xs-10"><input type="text" name="nickname" class="form-control" value="${loginUser.nickname}" readonly></div>
                                          <div class="col-xs-10"><input type="hidden" name="memberNo" class="form-control" value="${loginUser.memberNo}" readonly></div>
                                      </div>
                                      <div class="row form-group">
                                          <div class="col-xs-2"><label class="label">제목</label></div>
                                          <div class="col-xs-10"><input type="text" name="title" class="form-control" placeholder="레시피 제목을 입력해주세요" value="${recipe.title}"></div>
                                      </div>
                                      <div class="row form-group">
                                          <div class="col-xs-2"><label class="label">분류</label></div>
                                          <div class="col-xs-10">
                                          <select class="form-control" name="category">
                                                  <option value="1">분류</option>
                                                  <option value="강아지">멍키친</option>
                                                  <option value="고양이">냥키친</option>
                                              </select></div>
                                      </div>
                                      <div class="row form-group">
                                          <div class="col-xs-2"><label class="label">태그</label></div>
                                          <div class="col-xs-10"><input type="text" name="tag" class="form-control" placeholder="1개 이상의 정보는 #로 구분해주세요." value="${recipe.tag}"></div>
                                      </div>
                                      <div class="row form-group">
                                          <div class="col-xs-2"><label class="label">기타정보</label></div>
                                          <div class="col-xs-10"><input type="text" name="otherInfo" class="form-control" placeholder="기타정보" value="${recipe.otherInfo}"></div>
                                      </div>
                                  </div>
                                  <div class="block-title"><span class="title">재료 정보</span></div>
                                  
                                  <div id="ingredient-block" class="block-content">
                                  <c:forEach items="${recipe.ingredients}" var="ingredients">
                                  <!-- 재료 용량 들어가는 Div -->
                                  <div class='group-flex my-ingredient'>
                                  <div class='form-group'><label class='label'>재료 </label><input type='text' name='ingredientNames' class='form-control' value='${ingredients.name}'></div>
                                  <div class='form-group'><label class='label'>용량 </label><input type='text' name='quantity' class='form-control' value='${ingredients.quantity}'></div>
                                  <div class='form-group'><button class='btn btn-outline btn-sm' type='button' name="delIngredientBtn" onclick="delIngredient(event)">삭제</button></div>
                                  </div>
                                  </c:forEach>
                                  </div>
                                  
                                  <div id="block_3" class="block-content">
                                      <div class="row form-group">
                                          <div class="col-xs-12 text-right"><button class="btn btn-default btn-sm" type="button" onclick="addIngredient()">추가입력</button></div>
                                      </div>
                                  </div>
                                  
                                  
                                  <div class="step-list"> 
                                          <div class="block-title _gray">
                                          <span class="title">STEP</span></div>
                                          
                                          <div id="cookingDiv" class="block-content">
                                          <c:forEach items="${recipe.cookings}" var="cooking">
                                          <!-- 순서 박스 들어갈 Div -->
                                          <div class='row form-group my-cooking'>
                                          <div class='row form-group'>
                                                                                             순서: <input type='text' name='processNo' value='${cooking.processNo}'></div>
                                          <div class='box-photo'>
                                            <div class='photo'>
                                              <div class='img'>
                                               <img class='preview-cooking-image' src='/upload/recipe/${cooking.filePath}'></div>
                                              <input class='btn btn-outline btn-images my-cooking-image' type='file' name='filePath2' value='${cooking.filePath}'>
                                              <input class='cooking-check' type='hidden' name='fileNo' value='${cooking.cookingNo}'>
                                          <button class='btn btn-outline btn-block btn-sm' name='delCookingBtn' type='button' onclick='delCooking(event)'>순서 삭제</button>
                                            </div>
                                          <div class='des'><textarea class='form-control' name='cookingContent'>${cooking.content}</textarea></div>
                                          </div>
                                        </div>
                                          </c:forEach>
                                      <!-- 순서 박스 들어갈 Div -->
                                          </div>
                                  </div>
                                  
                                  <!-- 순서추가버튼 -->
                                  <div class="block-content">
                                      <div class="row form-group">
                                          <div class="col-xs-12"><button class="btn btn-default btn-block" type="button" onclick="addCooking()">+ 순서 추가</button></div>
                                      </div>
                                  </div>
                                  <!-- 순서추가버튼 -->
                                  
                                  <div class="block-title _gray"><span class="title">요리 완성</span></div>
                                  <div class="block-content">
                                      <div>
                                          <!-- 썸네일사진추가아아아아아ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ -->
                                          <div class="box-photo">
                                                  <div class="photo">
                                                      <div class="img">
                                                      <img id="image" src='/upload/recipe/${recipe.thumbnail}'></div>
                                                      <div style='display: none;'>
                                                      <input class="btn btn-outline btn-images my-thumbnail" id="my-thumbnail" type="file" name='filePath'></div>
                                                      <label id='my-label' for="my-thumbnail">+ 사진 수정</label>
                                                      
                                                  </div>
                                                  <div class="des"><textarea class="form-control" name="content">${recipe.content}</textarea></div>
                                              </div>
                                      </div><br><br>
                                      <div class="row form-group">
                                          <div class="col-xs-12 text-center"><button class="btn btn-default" style="height: auto; border: none;">수정하기</button>
                                          <input id="delBtn"class="btn btn-default" type="button" value='삭제하기' style="height: auto; background-color: #ff4500; border:none;"></div>
                                      </div>
                                  </div>
                              </div>
                          </form>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </div>
</div>

<script src="/node_modules/handlebars/dist/handlebars.min.js"></script>
<script src="/node_modules/jquery/dist/jquery.min.js"></script>

<script id="t1" type="ingredientHtml">
<div class='group-flex my-ingredient'>
<div class='form-group'><label class='label'>재료 </label><input type='text' name='ingredientNames' class='form-control' value=''></div>
<div class='form-group'><label class='label'>용량 </label><input type='text' name='quantity' class='form-control' value=''></div>
<div class='form-group'><button class='btn btn-outline btn-sm' type='button' name='delIngredientBtn' onclick='delIngredient(event)'>삭제</button></div>
</div>
</script>

<script> // 재료,용량 추가
 "use strict";
  function addIngredient() {
    console.log("추가버튼누름");
    var html = $('#t1').html();
    $('#ingredient-block').append(html);
  };
</script>

<script> // 재료, 용량 삭제
 "use strict";
  function delIngredient(event) {
    
    $(event.target.parentNode.parentNode).remove();
// 방법1)
//    event.target.parentNode.parentNode.parentNode.removeChild(event.target.parentNode.parentNode); // DOM API

// 방법2)
//  이벤트가 발생한 버튼이 포함된 , 제거할 div 태그를 찾는다.
//  => event.target.parentNode.parentNode <div class="group-flex my-ingredient">
//     그 찾은 div 태그를 remove() 로 제거한다.
//     $(event.target.parentNode.parentNode).remove(); // jquery
  };
</script>


<script id="t2" type="cookingHtml">
<div class='row form-group my-cooking'>
  <div class='row form-group'>
         순서: <input type='text' name='processNo' value=''>
  </div>
  <div class='box-photo'>
    <div class='photo'>
      <div class='img'>
       <img class='preview-cooking-image'>
      </div>
      <input class='btn btn-outline btn-images my-cooking-image' type='file' name='filePath2' value=''>
      <input class='cooking-check' type='hidden' name='fileNo' value='${cooking.cookingNo}'>
      <button class='btn btn-outline btn-block btn-sm' type='button' name='delCookingBtn' onclick='delCooking(event)'>순서 삭제</button>
    </div>
    <div class='des'><textarea class='form-control' name='cookingContent'></textarea></div>
  </div>
</div>
</script>

<script>//조리순서 추가
"use strict";
function addCooking() {
  console.log("추가버튼누름");
  var html = $('#t2').html();
  $('#cookingDiv').append(html);
};
</script>

<script> // 조리순서 삭제
"use strict";
function delCooking(event) {
  $(event.target.parentNode.parentNode.parentNode).remove();
};
</script> 

<script>
// 완성사진 미리보기
function readURL(input) {
  var reader = new FileReader();
  reader.onload = function(e) {
    $('#image').attr('src', e.target.result);
  }
  reader.readAsDataURL(input.files[0]);
};

$('.my-thumbnail').change(function() {
  readURL(this);
});

// cooking image 미리보기
function readURL2(input) {
  var reader2 = new FileReader();
  reader2.onload = function(e) {
    $(input.parentNode).find('.preview-cooking-image').attr('src', e.target.result);
  }
  reader2.readAsDataURL(input.files[0]);
};

$(document).on('change', '.my-cooking-image', function() {
  var check = $(this.parentNode).find('.cooking-check');
  check.val(0);
  console.log(check.val());
  readURL2(this);
});
</script>

<script>
$('#delBtn').on('click', function(){
  location.href = '/app/recipe/delete?no=' + ${recipe.recipeNo};
});
</script>

</body>
</html>