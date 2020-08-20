<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp"%>
<%@include file="side.jsp"%>

<script src="resources/css/payment/pay_productList.css"></script>

  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


<div id="colorlib-main">
	<section class="ftco-section" style="background-image: url(resources/img/headerimg.png); height:5em">
		<div class="container">
			<div class="row no-gutters slider-text justify-content-center align-items-center">
				<div class="col-md-12 ftco-animate text-center">
					<h1 class="bread" style="color:white;"><b>결제</b></h1>
				</div>
			</div>
		</div>
	</section>
	<div class="container">
		<table id="cart" class="table table-hover table-condensed"
			style="margin-bottom: 430px; margin-top: 50px">
			<thead>

				<tr>
					<th style="width: 50%">Product</th>
					<th style="width: 10%">Price</th>
					<th style="width: 8%">Quantity</th>
					<th style="width: 22%" class="text-center">Total</th>
					<th style="width: 10%"></th>
				</tr>
			</thead>
			<tbody>

				<tr>
					<td data-th="Product">
						<div class="row">
							<div class="col-sm-2 hidden-xs">
								<img src="${vo.product_img}" style="width: 80px;"/>
							</div>
							<div class="col-sm-10">
								<h6 class="nomargin">${vo.product_name }</h6>
								<p>${vo.product_explain }</p>
							</div>
						</div>
					</td>
					<td data-th="Price" id="price">${vo.product_price }</td>
					<td data-th="Quantity"><input type="number"
						class="form-control" value="1" id="count" min=1> <input
						type="hidden" id="productnum" value="${vo.product_num }">

					</td>
					<td data-th="Subtotal" class="text-center" id="total_price">${vo.product_price }</td>

				</tr>
			</tbody>
			<tfoot>

				<tr>
					<td colspan="2" class="hidden-xs"></td>

					<td></td>

					<td><img src="resources/img/payment/buyicon.png" id="kako_pay"
						style="float: right"></td>
				</tr>
			</tfoot>
		</table>




	</div>

	<script>
		$('#count').change(function() {
			var price = $('#price').text() //초기가격
			var total_price = price * $('#count').val();

			console.log(total_price);
			$('#total_price').text(total_price);
		});
	</script>


	<script>
		$('#kako_pay').click(function() {
			var IMP = window.IMP; // 생략가능
			IMP.init('imp22395757'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			var msg;
			var price = $('#price').text()
			var total_price = $('#total_price').text()
			var buyer_num = ${sessionScope.user_num};
			var product_name = $('.nomargin').text();
			//var count = $('.form-control, .text-center')
			var count = $('#count').val()
			var product_num = $('#productnum').val()

			console.log('price : ' + price)
			var a = '1000'

			IMP.request_pay({
				pg : 'kakaopay',
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(), //가맹점에서 생성/관리하는 고유 주문번호
				name : $('.nomargin').text(), // 주문명
				amount : total_price, //결제할 금액	
			// buyer_name :  //주문자명
			//buyer_name : '판매자'

			}, function(rsp) {
				if (rsp.success) {
					console.log("Date : " + rsp.paid_at)
					//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
					jQuery.ajax({
						url : "pay_compelte", //cross-domain error가 발생하지 않도록 주의해주세요
						type : 'POST',
						dataType : 'json',
						data : {
							'imp_uid' : rsp.imp_uid, //결제고유 id(고정값.)
							'merchant_uid' : rsp.merchant_uid, //거래 id
							'product_num' : product_num,
							//'product_name' : product_name,
							'paid_amount' : rsp.paid_amount,
							'buyer_num' : buyer_num,
							'paid_count' : count,
							'paid_date' : rsp.paid_at
						//결제날짜

						//기타 필요한 데이터가 있으면 추가 전달
						},
						success : function(data) {
							//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
							if (data) {
								msg = '결제가 완료되었습니다.';
								// msg += '\n주문명 : ' + rsp.buyer_name;
								msg += '\n주문명 : ' + rsp.name;
								//msg += '\n결제승인날짜 : ' + rsp.paid_at;
								//msg += '\n고유ID : ' + rsp.imp_uid;
								msg += '\n결제승인번호 : ' + rsp.merchant_uid;
								msg += '\n결제 금액 : ' + rsp.paid_amount;
								//msg += '카드 승인번호 : ' + rsp.apply_num;
								console.log(msg);
								location.href = 'index.html';
								alert(msg);
							} else {
								//[3] 아직 제대로 결제가 되지 않았습니다.
								//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
							}
						}
					});
					//성공시 이동할 페이지
					console.log(msg);
					//location.href='pay';
				} else {
					msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					//실패시 이동할 페이지
					//document.location.href="index.html"; //alert창 확인 후 이동할 url 설정   
				}
			});

		});
	</script>
	<%@ include file="footer.jsp"%>