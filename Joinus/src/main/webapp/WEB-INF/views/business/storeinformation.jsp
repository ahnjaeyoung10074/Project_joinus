<%--
  Created by IntelliJ IDEA.
  User: b14
  Date: 2023-05-04
  Time: 오후 3:52
  To change this template use File | Settings | File Templates.
--%>
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
    .avatar{
        width:200px;
        height:200px;
    }

    .main{
        margin-left: 180px;
    }
    .form-horizontal{
        width: 600px;
        margin-left: 300px;
    }
    .text{
        color: #ff731b;
    }
    .btn{
        width:140px;
        height: 40px;
        font-size:15px;
        background-color: #ff731b;
        color:#fff;
        border:none;
        cursor: pointer;
        border-radius: 5px;

    }
    .button{
        display: flex;
        justify-content: center;
        align-items: center;
        margin-left: 450px;
    }

</style>
</head>
<body>
<br>
<div class="container bootstrap snippets bootdey">
    <div class="main">
        <h1 class="text">개인정보 확인</h1>
        <hr>
        <div class="row">
            <div class="col-md-9 personal-info">
                <div class="alert alert-info alert-dismissable">
                    <a class="panel-close close" data-dismiss="alert">×</a>
                    <i class="fa fa-coffee"></i>
                    아이디 수정은 <strong>불가능</strong>합니다.
                </div>
                <h3>Store info</h3>
                <%--        <div class="col-md-3">--%>
                <%--          <div class="text-center">--%>
                <%--            <img src="https://bootdey.com/img/Content/avatar/avatar7.png" class="avatar img-circle img-thumbnail" alt="avatar">--%>
                <%--          </div>--%>
                <%--        </div>--%>
                <form class="form-horizontal" role="form">

                    <div class="form-group">
                        <label class="col-lg-3 control-label">스토어 이름</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" value="${storeinformation.s_name}" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">스토어 소개글</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" value="${storeinformation.s_inst}" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">스토어 이메일</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" value="${storeinformation.s_email}" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">스토어 URL</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" value="${storeinformation.s_URL}" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">스토어 전화번호</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" value="${storeinformation.s_phone}" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">주소</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" value="${storeinformation.s_addrCode} ${storeinformation.s_addrStreet} ${storeinformation.s_addrDetail}" readonly>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<hr>
<div class="button">
    <p>
    <form action="/storemodify">
        <input type="submit" value="스토어정보 수정" class="btn">
    </form>
    </p>
    <input type="hidden" value="${list}" id="information"/>
</div>
</body>
<%@ include file="../footer/footer.jsp"%>
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
    console.log('삭제해보아요');
   var data=  $('#information').val()
    console.log(data);
    $('.btn').click(function() {
        //var list =data; // 변수 선언 추가
        console.log(data)
        console.log('삭제해보아요');
        if (data=='ng') {
            return true;
        } else {
            alert('사업자님의 스토어에서 등록하신 제품이 존재합니다. 제품 삭제 후 수정이 가능합니다.');
            return false;
        }
    });
</script>
