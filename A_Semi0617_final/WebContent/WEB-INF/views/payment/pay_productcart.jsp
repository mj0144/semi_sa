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
					<h1 class="bread" style="color:white;"><b>����</b></h1>
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
			var price = $('#price').text() //�ʱⰡ��
			var total_price = price * $('#count').val();

			console.log(total_price);
			$('#total_price').text(total_price);
		});
	</script>


	<script>
		$('#kako_pay').click(function() {
			var IMP = window.IMP; // ��������
			IMP.init('imp22395757'); // 'iamport' ��� �ο����� "������ �ĺ��ڵ�"�� ���
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
				merchant_uid : 'merchant_' + new Date().getTime(), //���������� ����/�����ϴ� ���� �ֹ���ȣ
				name : $('.nomargin').text(), // �ֹ���
				amount : total_price, //������ �ݾ�	
			// buyer_name :  //�ֹ��ڸ�
			//buyer_name : '�Ǹ���'

			}, function(rsp) {
				if (rsp.success) {
					console.log("Date : " + rsp.paid_at)
					//[1] �����ܿ��� �������� ��ȸ�� ���� jQuery ajax�� imp_uid �����ϱ�
					jQuery.ajax({
						url : "pay_compelte", //cross-domain error�� �߻����� �ʵ��� �������ּ���
						type : 'POST',
						dataType : 'json',
						data : {
							'imp_uid' : rsp.imp_uid, //�������� id(������.)
							'merchant_uid' : rsp.merchant_uid, //�ŷ� id
							'product_num' : product_num,
							//'product_name' : product_name,
							'paid_amount' : rsp.paid_amount,
							'buyer_num' : buyer_num,
							'paid_count' : count,
							'paid_date' : rsp.paid_at
						//������¥

						//��Ÿ �ʿ��� �����Ͱ� ������ �߰� ����
						},
						success : function(data) {
							//[2] �������� REST API�� ��������Ȯ�� �� ���񽺷�ƾ�� �������� ���
							if (data) {
								msg = '������ �Ϸ�Ǿ����ϴ�.';
								// msg += '\n�ֹ��� : ' + rsp.buyer_name;
								msg += '\n�ֹ��� : ' + rsp.name;
								//msg += '\n�������γ�¥ : ' + rsp.paid_at;
								//msg += '\n����ID : ' + rsp.imp_uid;
								msg += '\n�������ι�ȣ : ' + rsp.merchant_uid;
								msg += '\n���� �ݾ� : ' + rsp.paid_amount;
								//msg += 'ī�� ���ι�ȣ : ' + rsp.apply_num;
								console.log(msg);
								location.href = 'index.html';
								alert(msg);
							} else {
								alert("������ �����Ͽ����ϴ�. ���� ����: " +  rsp.error_msg);
								//[3] ���� ����� ������ ���� �ʾҽ��ϴ�.
								//[4] ������ �ݾ��� ��û�� �ݾװ� �޶� ������ �ڵ����ó���Ͽ����ϴ�.
							}
						}
					});
					//������ �̵��� ������
					console.log(msg);
					//location.href='pay';
				}  else {
		               msg = '������ �����Ͽ����ϴ�.';
		               msg += '�������� : ' + rsp.error_msg;
		               document.location.href="/AFinal/pay"; //alertâ Ȯ�� �� �̵��� url ����   
		            }
			});

		});
	</script>
	<%@ include file="footer.jsp"%>