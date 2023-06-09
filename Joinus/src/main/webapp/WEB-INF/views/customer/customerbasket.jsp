<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
  <title>Title</title>

  <style>
    /* 테이블 스타일 */
    table {
      border-collapse: collapse;
      width: 70%;
      margin: 0 auto;
      margin-top: 20px;
      margin-bottom: 20px;
    }

    th, td {
      border: 1px solid #cecece;
      padding: 8px;
      text-align: center;
    }

    th {
      text-align: center;
      background-color: #ffffff;
    }
    .th{
      text-align: center;
    }


    .button1 {
      text-align: center;
      margin-bottom: 20px;
    }

    /* 버튼 스타일 */
    .deletebtn {
      font-family: 'Noto Sans KR', sans-serif;
      font-weight: 500;
      font-size: 14px;
      width: 60px;
      height: 40px;
      /*padding: 10px 20px;*/
      border: none;
      background-color: #ff731b;
      color: white;
      cursor: pointer;
      margin-right: 5px;

    }

    .deletebtn:hover {
      background-color: #ffffff;
      color: #ff731b;
      border: 2px solid #ff731b;
    }
    .purchbtn {
      font-family: 'Noto Sans KR', sans-serif;
      font-weight: 500;
      font-size: 14px;
      width: 60px;
      height: 40px;
      border: none;
      background-color: #48ecbf;
      color: white;
      cursor: pointer;
      margin-right: 5px;
    }
    .purchbtn:hover {
      background-color: #ffffff;
      color: #48ecbf;
      border: 2px solid #48ecbf;
    }

    /* 비어있는 메시지 스타일 */
    .empty-message {
      text-align: center;
      margin-top: 20px;
      font-size: 14px;
      color: #888;
    }
    /* 총 구매 금액 스타일 */
    .total-price-container {
      text-align: center;
      /*margin-bottom: 20px;*/
      font-size: 16px;
      color: #888;
    }
  </style>
  <%@ include file="../header/header.jsp"%>
</head>
<body>
<br>
<div class="container">
  <table border="1">
    <thead>
    <tr style="text-align: center;">
      <th style="width: 100px;">카테고리</th>
      <th style="width: 300px;">상품명</th>
      <th style="width: 330px;">기간</th>
      <th style="width: 100px;">금액</th>
      <th style="width: 60px;">선택</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${cart}" var="cart">
      <tr>
        <td>${cart.product.p_category}</td>
        <td><a href='/board/read?pno=${cart.pno}'>${cart.product.p_name}</a></td>
        <td>${cart.c_startDate} ~ ${cart.c_endDate}</td>
        <td>
          <span class="total" data-price=${cart.c_price}>${cart.c_price}원</span>
        </td>
        <td>
          <input type="checkbox" class="selectedItems" name="selectedItems" value="${cart.pno}">
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
<%-- 장바구니가 비었을 때 메시지 표시 --%>
<c:if test="${empty cart}">
  <div class="empty-message" style="height: 200px;">
    장바구니가 비었습니다.
  </div>
</c:if>
<br>
<c:if test="${!empty cart}">
  <div class="total-price-container">
    <p>총 구매 금액:
      <span id="totalPrice">0</span>
      원</p>
    <div class="container">
      <div class="button1" style="display:block">
        <button class=deletebtn onclick="deleteItems()">삭제</button>
        <button class=purchbtn id="buy">구매</button>
      </div>
    </div>
  </div>
</c:if>
<form id="transferPno" method="post" action="/board/cartbuy">

</form>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
  // 로그인 여부 확인 함수
  function isLoggedIn() {
    if (${customerUserVO == null || customerUserVO.u_id == null}) {
      return false;
    } else {
      return true;
    }
  }

  $(document).ready(function (){
    $(".selectedItems").on("change", function (){
      calculateTotalPrice();
    })
  })

  const calculateTotalPrice = () => {
    let totalPrice = 0;

    // 체크된 체크박스들의 가격 합산
    $(".selectedItems:checked").each(function() {
      const price = $(this).closest("tr").find(".total").data("price");
      console.log("선택항목 금액 : " + price);
      totalPrice += price;
    });

    // 총 구매 금액 업데이트
    $("#totalPrice").text(totalPrice);

  }

  // 상단바 장바구니 진입 시 삭제 기능
  const deleteItems = () => {
    if (!isLoggedIn()) {
      alert("로그인 후 이용해주세요.");
      return;
    }

    const selectedItems = []; // 선택된 항목의 ID를 담을 배열

    // 선택된 항목의 ID를 배열에 추가
    $('.selectedItems:checked').each(function () {
      selectedItems.push($(this).val());
    });
    console.log(selectedItems)
    if (selectedItems.length === 0) {
      alert("삭제할 항목을 선택해주세요.");
      return;
    }

    // 선택된 항목의 ID를 URL에 추가하여 AJAX 요청
    $.ajax({
      type: "POST",
      url: "/cart/delete",
      data: JSON.stringify(selectedItems), // 선택된 항목의 ID 배열을 JSON 형식으로 변환하여 서버로 전달
      contentType: "application/json", // 전달하는 데이터의 형식을 명시 (JSON 형식)
      success: function (response) {
        alert("선택된 항목이 장바구니에서 삭제되었습니다.");
        location.reload(); // 페이지 새로고침
      },
      error: function (xhr, status, error) {
        alert("에러 발생");
      },
    });
  };
  $("#buy").click(function (e) {
    if ($('.selectedItems:checked').length === 0) {
      alert("구매 항목을 선택해주세요.");
      return;
    } else {
      let str = "";
      $('.selectedItems:checked').each(function () {
        str += "<input type='hidden' name='pno' value='" + $(this).val() + "'/>";
      });
      console.log(str);
      $("#transferPno").append(str).submit();
    }
  });

  // const calculateTotal = () => {
  //   $(document).ready(function() {
  //     if (!isLoggedIn()) {
  //       alert("로그인 후 이용해주세요.");
  //       return;
  //     }
  //     const selectedItems = []; // 선택된 항목의 ID를 담을 배열
  //
  //     // 선택된 항목의 ID를 배열에 추가
  //     $('.selectedItems:checked').each(function () {
  //       selectedItems.push($(this).val());
  //     });
  //
  //     console.log(selectedItems)
  //
  //     if (selectedItems.length === 0) {
  //       alert("구매할 항목을 선택해주세요.");
  //       return;
  //     }
  //     $.ajax({
  //       type: "POST",
  //       data: { pno: selectedItems },
  //       url: "/board/cartbuy",
  //       traditional: true, // 선택된 항목의 ID 배열을 JSON 형식으로 변환하여 서버로 전달
  //       // contentType: "application/json", // 전달하는 데이터의 형식을 명시 (JSON 형식)
  //       success: function (response) {
  //         alert("구매 페이지로 이동합니다.")
  //         // window.location.href = response.redirectUrl; // 페이지 이동
  //       },
  //       error: function (xhr, status, error) {
  //         alert("에러 발생");
  //       },
  //     });
  //   });
  // }
</script>
<%@ include file="../footer/footer.jsp"%>
</html>
