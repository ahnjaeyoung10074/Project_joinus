<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
  <title>Title</title>
</head>
<%@ include file="../header/header.jsp"%>
<style>
  @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 100;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.otf) format('opentype');}
  @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 300;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 400;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 500;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 700;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 900;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.otf) format('opentype');}

  body{margin-top:20px;}

  .btndelete{
    width:130px;
    height: 27px;
    font-size:14px;
    background-color: #8d8d8d;
    color:#fff;
    border:none;
    cursor: pointer;
    border-radius: 5px;
    margin-left: 10px;
    margin-right: 10px;
  }

  .container1 {
    display: flex;
    justify-content: center;
    width: 700px;
    height: 300px;
    margin: 0 auto;
  }

  /*#alert2 {*/
  /*  border-color: transparent;*/
  /*}*/
  .main1 {
    width: 250px;
    height: 200px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    border: 1px solid lightgrey;
    border-radius: 5px;
    margin: 0 auto;

  }
  .account{
      border:1px solid #d0d0d0;
  }
</style>
</head>
<body>
<br>
<br>
<br>
<form action="/customerinfodelete" method="get" id="form">
  <div class="container1">
    <div class="main1" style="margin: 0 auto">
      <h6 class="logo"> &nbsp 회원 탈퇴를 위한 비밀번호를 <br>&nbsp &nbsp 다시 한번 입력해주세요.</h6>
      <input type="password" placeholder="Password" name="u_pwd" id="u_pwd" class="account">
        <div id="errormessage" style="color:red; display: none;" class="error" > ${errormessage} </div>
      <br>
        <div>
          <input type="submit" id="btndelete" class="btndelete" value="확인"></input>
          <p id="alert2" class="account"> </p>
        </div>
    </div>
  </div>
</form>
</body>
<%@ include file="../footer/footer.jsp"%>
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
  var u_pwd = $('#u_pwd').val();
  var vo_u_pwd = "${customervo.u_pwd}";
  $('.btndelete').click(function () {
      var u_pwd = $('#u_pwd').val();
     if (u_pwd != vo_u_pwd) {
         $('.error').show();
      return false;
     } else {
      $('#form').submit(); // 폼을 제출함
      return true;
     }
  });
</script>
