<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>

  <%--    <link href="../resources/css/responsive.css" rel="stylesheet" />--%>
  <%--    <link href="../resources/css/productRegister.css" rel="stylesheet" />--%>
</head>
<%@ include file="../header/header.jsp"%>
<style>
  .inputlist{
    height: 33px;
    border: 1px solid #e3e3e3;
    width: 480px;

  }
  .period-input period-startDate{
    border: 1px solid #e3e3e3;
  }
  input[type="radio"] {
    appearance: none; /* 기본 스타일 제거 */
    -webkit-appearance: none;
    -moz-appearance: none;
    width: 20px; /* 원의 크기 조정 */
    height: 20px;
    border-radius: 50%; /* 원의 모양 설정 */
    border: 1px solid #c0c0c0; /* 테두리 스타일과 색상 설정 */
    background-color: #fff; /* 배경색 설정 */
  }


  /* 체크된 상태의 라디오 버튼 */
  input[type="radio"]:checked {
    border-width: 4px; /* 테두리 두껍게 설정 */
    border-color: orange; /* 테두리 색상 설정 */
  }
  .periodFix{
    border: none;
    background-color: #ffbda2;
    border-radius: 2px;
    width: 50px;
    height: 30px;
  }
  .periodFix:hover{
    border: 2px solid #ffbda2;
    background-color: white;
    border-radius: 2px;
    color: black;
  }
  .periodClear{
    border: none;
    background-color: #ff2261;
    border-radius: 2px;
    width: 50px;
    height: 30px;
    color: white;
  }
  .periodClear:hover{
    border: 2px solid #ff3b75;
    background-color: white;
    border-radius: 2px;
    color: black;
  }
  .thumbnail-image {
    max-width: 200px;
    height: auto;
  }
  .modifyProduct{
    border-radius: 2px;
    border: none;
    background-color: #ff6f63;
    height: 45px;
    width: 65px;
    color: white;
  }
  .modifyProduct:hover{
    border-radius: 2px;
    border: 2px solid #ff6f63;
    background-color: #ffffff;
    height: 45px;
    width: 65px;
    color: #ff6f63;
  }
  .backbutton{
    border-radius: 2px;
    border: none;
    background-color: #969696;
    height: 45px;
    width: 65px;
    color: white;

  }
  .backbutton:hover{
    border-radius: 2px;
    border: 2px solid #969696;
    background-color: #ffffff;
    height: 45px;
    width: 65px;
    color: #969696;
  }
  .uploadBtn{
    border: none;
    border-radius: 2px;
    background-color: #ffefe6;
    height: 30px;
  }
  .deleteProduct{
    border-radius: 2px;
    border: none;
    background-color: #ffb797;
    height: 45px;
    width: 65px;
    color: white;
  }
  .deleteProduct:hover{
    border-radius: 2px;
    border: 2px solid #ffb797;
    background-color: #ffffff;
    height: 45px;
    width: 65px;
    color: #ffb797;
  }
  .deleteBtn{
    border: none;
    border-radius: 2px;
    background-color:#ffbda2;
    height: 30px;
    width: 50px;
  }
  body{
    letter-spacing: -1px;
  }

  .input{
    display: none;
  }

  /*.inputActive{*/
  /*  display: block;*/
  /*}*/

  .upload{
    display: none;
  }
  .uploadActive{
    display: block;
  }

  .thumbnail-image{
    width: 200px;
    height: 200px;
  }

  .thumbnail-col{
    width: 200px;
    margin: 10px;
  }

</style>
<body>
<br>
<div class="main" style="margin: 0 auto; ">
  <div class="modify" style="max-width: 1100px; margin-left: 600px; ">
    <h1 class="logo" style="font-weight: bold; letter-spacing: -1px;">상품 수정</h1>
    <br>
    <div>
      <form action="modify" method="post">
        <input type="hidden" name="sno" id="sno" value="${product.sno}">
        <input type="hidden" name="pno" id="pno" value="${product.pno}">
        <div class="container">
          <div class="card" style="height: 70px; width: 700px; display: inline-block; border-top:2px solid black; border-radius: 0px; ">
            <div class="card-list" style="display: inline-block; margin-top: 20px;">
              <span class="card-title" style="margin-right: 100px; margin-left: 40px;">상품명</span>
              <input class="inputlist"
                     type="text"
                     placeholder="상품명"
                     id="p_name"
                     name="p_name"
                     value="${product.p_name}"
              />
            </div>
          </div>
          <%-- 상품명 태그 종료 --%>
          <div class="card" style="height: 70px; width: 700px; display: inline-block; border-top:none; border-radius: 0px; ">
            <div class="card-list" style="display: inline-block; margin-top: 20px;">
              <span class="card-title" style="margin-right: 100px; margin-left: 40px;">소개글</span>
              <input  class="inputlist"
                      type="text"
                      placeholder="소개글"
                      id="p_inst"
                      name="p_inst"
                      value="${product.p_inst}"
              />
            </div>
          </div>
          <%-- 소개글 태그 종료 --%>
          <div class="card" style="height: 150px; width: 700px; display: inline-block; border-top:none; border-radius: 0px; ">
            <div class="card-list" style="display: inline-block; margin-top: 20px;">
              <span class="card-title" style="margin-right: 100px; margin-left: 40px;">기간</span>

              <input type="radio" name="change" class="period_change" value="fixed" style="margin-left: 60px;" checked> <span class="span">고정된 날짜</span>
              <input type="radio" name="change" class="period_change" value="free" style="margin-left: 60px;"> <span  class="span">오늘부터 n일까지</span>
              <div class="d-flex period-fixed" style="margin-left: 187px; margin-top: 5px;">
                <input type="date"
                       id="startDate"
                       max="2099-12-31"
                       value="${startDate}"
                       class="period-input period-startDate"
                       style="width: 135px; margin-right: 15px;  border: 1px solid #e3e3e3; text-align: center;"
                >
                <b style="font-size: 25px; margin-right: 15px;">~</b>
                <input type="date"
                       id="endDate"
                       max="2099-12-31"
                       value="${endDate}"
                       class="period-input period-endDate"
                       style="width: 135px; margin-right: 15px; border: 1px solid #e3e3e3; text-align: center;"
                >
                <input type="number" id="price" placeholder="가격" value="${product.p_price}" style="width: 150px; margin-right: 15px;  border: 1px solid #e3e3e3;">
              </div>
              <div class="d-flex period-free" style="margin-left: 187px; margin-top: 5px; margin-bottom: 10px">
                <label style="margin-right: 20px">월 당 금액(30일 기준)</label>
                <input type="number" id="monthPrice" value="${product.p_price}" class="period-priceMonth" style="border: 1px solid #e3e3e3; ">
              </div>
              <button class="periodFix" style="margin-left: 370px;">고정</button>
              <button class="periodClear"  style="display: none; margin-left: 370px;">해제</button>
            </div>
          </div>
          <%-- 기간 태그 종료 --%>

          <div class="card" style="height: 70px; width: 700px; display: inline-block; border-top:none; border-radius: 0px; ">
            <div class="card-list" style="display: inline-block; margin-top: 20px;">
              <span class="card-title" style="margin-right: 82px; margin-left: 40px;">카테고리</span>
              <select name="p_category" id="p_category" style="border: 1px solid #e3e3e3; height: 30px; width: 200px ">
                <option value="">-- 카테고리 선택 --</option>
                <option value="food"  c:if="${product.p_category == 'food'}" selected>FOOD</option>
                <option value="academy"  c:if="${product.p_category == 'academy'}" selected>ACADEMY</option>
                <option value="physical fitness" c:if="${product.p_category == 'physical fitness'}" selected>PHYSICAL FITNESS</option>
                <option value="traffic" c:if="${product.p_category == 'traffic'}" selected>TRAFFIC</option>
              </select>
            </div>
          </div>

          <%-- 소개글 태그 종료 --%>

          <div class="card" style="width: 700px; display: inline-block; border-top:none; border-radius: 0px; ">
            <div class="card-list" style="display: inline-block; margin-top: 20px;">
              <span class="card-title" style="margin-right: 82px; margin-left: 40px;">썸네일</span>
              <div class="card-body"  style="margin-left: 150px">

                <div class="row">
                  <c:forEach var="i" begin="0" end="3">
                  <div class="col thumbnail-col">
                      <span class="thumbnail-span">
                        <c:if test="${empty product.thumbnailList[i]}">
                        <img
                                src="../../resources/images/no-image.png"
                                class="file-image thumbnail-image"
                        />
                          <input type="file" class="inputActive file-input" />
                          <button class="uploadActive uploadBtn">업로드</button>
                          <button class="upload deleteBtn">삭제</button>
                        </c:if>
                          <c:if test="${!empty product.thumbnailList[i]}">
                        <img
                                src="/display?fileName=${product.thumbnailList[i].uploadPath}/${product.thumbnailList[i].uuid}_${product.thumbnailList[i].fileName}"
                                class="file-image thumbnail-image"
                        />
                            <input type="file" class="input file-input" />
                            <button class="upload uploadBtn">업로드</button>
                            <button
                                    class="uploadActive deleteBtn"
                                    data-file="${product.thumbnailList[i].uploadPath}/${product.thumbnailList[i].uuid}_${product.thumbnailList[i].fileName}"
                                    data-type="image"
                            >삭제</button>
                          </c:if>
                      </span>
                  </div>
                  <c:if test="${(i+1) % 2 == 0}">
                </div><div class="row">
                </c:if>
                </c:forEach>
              </div>
              </div>
            </div>
          </div>
          <%-- 상품명 태그 종료 --%>
          <div class="card" style="width: 700px; border-top: none; border-radius: 0px;">
            <span class="card-title" style="margin-right: 100px; margin-left: 40px; margin-top: 20px;">상세 내용</span>
            <div style="margin-left: 180px;">
              <span class="detail-span" style=" text-align: center">
                <c:if test="${empty product.detail}">
                  <input type="file" class="inputActive file-input" />
                  <button class="uploadActive uploadBtn">업로드</button>
                  <button class="upload deleteBtn">삭제</button>
                  <div class="file-image" style="margin-right: 20px; margin-bottom: 20px;"></div>
                </c:if>
                <c:if test="${!empty product.detail}">
                  <input type="file" class="input file-input" />
                  <button class="upload uploadBtn">업로드</button>
                  <button class="uploadActive deleteBtn"
                          data-file="${product.detail.uploadPath}/${product.detail.uuid}_${product.detail.fileName}"
                          data-type="image">삭제</button>
                  <div class="file-image">
                    <img src="/display?fileName=${product.detail.uploadPath}/${product.detail.uuid}_${product.detail.fileName}">
                  </div>
                </c:if>
               </span>
            </div>
          </div>
          <%-- 상품명 태그 종료 --%>
          <br>
          <div style="height: 100px; margin-left: 290px">
            <button type="submit" class="modifyProduct">
              수정
            </button>
            <button type="submit" class="deleteProduct">삭제</button>
            <button type="submit" class="backbutton">취소</button>
          </div>
        </div>
        <%-- 컨테이너 끝 --%>
      </form>
    </div>
  </div>
  <script src="script.js">
    console.log(b_id);
    console.log(b_pwd1);
  </script>
</div>
</body>
<%@ include file="../footer/footer.jsp"%>
</html>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script>
  ////////////////////////// 업로드된 파일을 한 번 삭제하고 두번째 삭제 시 파일이 삭제가 안됨 ////////////////////////////////
  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");	// 정규 표현식(Regular Expression)
  var maxSize = 5242880;	// 5MB

  // 파일 규격 확인
  function checkExtension(fileName, fileSize){
    if(fileSize >= maxSize){
      alert("파일 사이즈 초과");
      return false;
    }
    if(regex.test(fileName)){
      alert("해당 종류의 파일은 업로드할 수 없습니다.");
      return false;
    }
    return true
  }

  function showUploadedFile(file, tag){
    if(file.image){
      // var filePath = encodeURIComponent(file.uploadPath+"/"+file.uuid+"_"+file.fileName);	// 썸네일 파일주소 생성(기존파일에서 문자 추가)
      var originPath = file.uploadPath+"\\"+file.uuid+"_"+file.fileName;	                    // 원본파일 주소 생성
      originPath = originPath.replace(new RegExp(/\\/g),"/");

      if(file.image === 'T')  // T = Thumbnail
        $(tag).find(".file-image").attr("src", "/display?fileName="+originPath);
      if(file.image === 'I')  // I = Intro
        $(tag).find(".file-image").append("<img src='/display?fileName=" + originPath + "'>")
      $(tag).find(".deleteBtn").attr('data-file', originPath);
      $(tag).find(".deleteBtn").attr('data-type', 'image');
    }
  }

  // input[type='file']의 데이터 가져오기
  function getInputFile(tag){
    var formData = new FormData();
    var inputFile = $(tag).find(".file-input");
    var files = inputFile[0].files;

    for (var i = 0; i < files.length; i++) {
      if(!checkExtension(files[i].name,files[i].size))
        return false;
      formData.append("uploadFile",files[i]);
    }
    console.log("1>> ", files);
    console.log("2>> ", formData);

    return formData;
  }

  // 썸네일 이미지 파일 업로드
  $(document).ready(function(){
    $(".thumbnail-span").each(function(idx, thumbnailSpan){
      $(thumbnailSpan).on("click", "button.uploadBtn", function(event){
        event.preventDefault();

        $.ajax({
          url : "/uploadThumbnail",
          type : "POST",
          data : getInputFile($(thumbnailSpan)),
          dataType : 'json',
          contentType : false,
          processData : false,
          success : function(result){
            $(thumbnailSpan).find(".uploadBtn").attr("class", "upload uploadBtn");
            $(thumbnailSpan).find(".deleteBtn").attr("class", "uploadActive deleteBtn");
            $(thumbnailSpan).find(".file-input").attr("class", "input file-input");

            showUploadedFile(result, thumbnailSpan);					// 결과 화면 보여주기(showUploadedFile(태그))
          }
        });
      });

      // 썸네일 이미지 파일 삭제
      $(thumbnailSpan).on("click", "button.deleteBtn", function(event){
        event.preventDefault();

        var targetFile = $(thumbnailSpan).find(".deleteBtn").data("file");
        var type = $(thumbnailSpan).find(".deleteBtn").data("type");
        console.log("TFILE : ", targetFile);
        console.log("TYPE : ", type);


        $.ajax({
          url:'/deleteImage',
          data: {filePath : targetFile, type : type},
          dataType: 'text',
          type:'post',
          success : function(result){
            alert("썸네일 삭제");
            $(thumbnailSpan).find(".uploadBtn").attr("class", "uploadActive uploadBtn").text("업로드");
            $(thumbnailSpan).find(".deleteBtn").remove();
            $(thumbnailSpan).append("<button class='upload deleteBtn'>삭제</button>")
            $(thumbnailSpan).find(".file-input").val("");
            $(thumbnailSpan).find(".file-image").attr("src", '../resources/images/no-image.png');
            $(thumbnailSpan).find(".file-input").attr("class", "inputActive file-input");
          }
        });
      })
    })

    // 상세정보 이미지 파일 업로드
    $(".detail-span").on("click", "button.uploadBtn", function(event){
      event.preventDefault();

      $.ajax({
        url : "/uploadDetail",
        type : "POST",
        data : getInputFile($(".detail-span")),
        dataType : 'json',
        contentType : false,
        processData : false,
        success : function(result){
          $(".detail-span").find(".uploadBtn").attr("class", "upload uploadBtn");
          $(".detail-span").find(".deleteBtn").attr("class", "uploadActive deleteBtn");
          $(".detail-span").find(".file-input").attr("class", "input file-input");

          showUploadedFile(result, ".detail-span");				// 결과 화면 보여주기(showUploadedFile(태그))
        }
      });
    })

    // 상세정보 이미지 파일 삭제
    $(".detail-span").on("click", "button.deleteBtn", function(event){
      event.preventDefault();

      var targetFile = $(".detail-span").find(".deleteBtn").data("file");
      var type = $(".detail-span").find(".deleteBtn").data("type");
      console.log("targetFile : " + targetFile + " / type : " +  type);


      $.ajax({
        url:'/deleteImage',
        data: {filePath : targetFile, type : type},
        dataType: 'text',
        type:'post',
        success : function(result){
          alert("상세정보 삭제");
          $(".detail-span").find(".uploadBtn").attr("class", "uploadActive uploadBtn");
          $(".detail-span").find(".deleteBtn").remove();
          $(".detail-span").append("<button class='upload deleteBtn'>삭제</button>")
          $(".detail-span").find(".file-input").val("");
          $(".detail-span").find(".file-image").find("img").remove();
          $(".detail-span").find(".file-input").attr("class", "inputActive file-input");
        }
      });
    })

    // 이미지 데이터를 DB저장 Controller에 전달
    $(".modifyProduct").on("click", function(event){
      event.preventDefault();

      var productData = {
        'fno':[],
        'product':{},
        'thumbnail':[],
        'detail':""};

      // 예외처리 임시
      if($("#p_name").val() == ""){
        alert("이름 입력안함")
      }else if($("#p_inst").val() == ""){
        alert("소개글 입력안함")
      }else if($("#p_category").val() == ""){
        alert("카테고리 입력안함")
      }else if($(".period_change:checked").val() === 'fixed' && $("#price").val() == ""){
        alert("가격1 입력안함")
      }else if($(".period_change:checked").val() === 'free' && $("#monthPrice").val() == ""){
        alert("가격2 입력안함")
      }else if($(".thumbnail-span").find(".deleteBtn").data("file") == null){
        alert("썸네일 업로드 안함")
      }else if($(".detail-span").find(".deleteBtn").data("file") == null){
        alert("상세정보 입력안함")
      }

      productData['product']['pno'] = $("#pno").val();
      productData['product']['sno'] = $("#sno").val();
      productData['product']['p_name'] = $("#p_name").val();
      productData['product']['p_inst'] = $("#p_inst").val();
      productData['product']['p_category'] = $("#p_category").val();
      productData['product']['p_startDate'] = new Date($(".period-startDate").val());
      productData['product']['p_endDate'] = new Date($(".period-endDate").val());
      productData['product']['p_type'] = $(".period_change").val();
      if($(".period_change:checked").val() === 'fixed')
        productData['product']['p_price'] = parseInt($("#price").val())
      else
        productData['product']['p_price'] = Math.floor($("#monthPrice").val() / 30.0);

      $(".thumbnail-span").find(".deleteBtn").each(function() {
        productData['thumbnail'].push($(this).data("file"));
      });
      productData['detail'] = $(".detail-span").find(".deleteBtn").data("file");
      console.log(">> ", productData);

      $.ajax({
        type: "post",
        url: "/modifyPost",
        data: JSON.stringify(productData),
        contentType: "application/json; charset=utf8",
        success: function (result) {
          alert("저장 성공")
          location.href="/showMyProduct"
        }
      });

    })

    // 이미지 데이터를 DB저장 Controller에 전달
    $(".deleteProduct").on("click", function(event){
      event.preventDefault();



      $.ajax({
        type: "post",
        url: "/deletePost",
        data: JSON.stringify($("#pno").val()),
        contentType: "application/json; charset=utf8",
        success: function (result) {
          location.href="/showMyProduct"
        }
      });

    })

    // 1~9월 -> 01~09월로 변경
    const MonthTenUnder = (data) => {
      var result = "";
      if(data < 10)
        result = "0" + data;
      return result;
    }

    // 현재 날짜 설정
    var currentDate = new Date();  // 현재 날짜와 시간을 가져옴
    var now = currentDate.getFullYear() + "-" // 연도
            + MonthTenUnder(currentDate.getMonth() + 1) + "-" // 월 (0부터 시작하므로 1을 더해줌)
            + currentDate.getDate();  // 일

    $(".period-startDate").attr("min", now);
    $(".period-endDate").attr("min", now);

    var startDate = $(".period-startDate").val();
    var endDate = $(".period-endDate").val();

    // 입력값 변경 시, 시작일이 종료일 보다 클 경우
    $(".period-startDate").on("change", function () {
      var date = $(this).val();
      if (date > endDate) {
        alert("종료일 보다 큽니다.");
        $(".period-startDate").val(startDate);
      } else {
        startDate = date;
        console.log($(".period_change").val())
      }
    })

    // 입력값 변경 시, 종료일이 시작일 보다 작을 경우
    $(".period-endDate").on("change", function (){
      var date = $(this).val();
      if($(this).val() < startDate){
        alert("시작일 보다 작습니다.");
        $(".period-endDate").val(endDate);
      }else{
        endDate = date;
      }
    })

    // 라디오 버튼 변경 시 div태그 변경
    $(".period-free").children().hide();
    $(".period_change").on("change", function() {
      if ($(this).is(':checked') && $(this).val() === 'fixed') {
        $(".period-fixed").children().show();
        $(".period-free").children().hide();
      }
      if ($(this).is(':checked') && $(this).val() === 'free') {
        console.log("2222")
        $(".period-fixed").children().hide();
        $(".period-free").children().show();
      }
    });

    // '고정'버튼 눌렀을 때 수정 불가능
    $(".periodFix").on("click", function(event){
      event.preventDefault();
      $(".period-fixed").find("input").attr("readonly", "readonly")
      $(".period-free").find("input").attr("readonly", "readonly")
      $(".period_change").hide();
      $(".span").hide();
      $(".periodFix").hide();
      $(".periodClear").show();
    })

    // '해체'버튼 눌렀을 때 고정했던 것들 전부 풀기
    $(".periodClear").on("click", function(event){
      event.preventDefault();
      $(".period-fixed").find("input").removeAttr("readonly");
      $(".period-free").find("input").removeAttr("readonly");
      $(".span").show();
      $(".period_change").show();
      $(".periodFix").show();
      $(".periodClear").hide();
    })

  })
</script>