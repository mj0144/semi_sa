<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>
<%@include file="side.jsp"%>


<div id="colorlib-main">
	<section class="ftco-section ftco-bread">
		<div class="container">
			<div
				class="row no-gutters slider-text justify-content-center align-items-center">
				<div class="col-md-8 ftco-animate">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index">Home</a></span> <span>boardwrite</span>
					</p>
					<h1 class="bread">�۾���</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section-3">
		<div class="pt-5 mt-5">
			<!-- END comment-list -->


			<form action="write" name="writeBoard" method="post"
				class="p-3 p-md-5 bg-light" enctype="multipart/form-data">
				<div class="form-group">
					<label for="name">����</label> <input type="text"
						class="form-control" name="board_title" id="board_title">
				</div>

				<div class="jsx-2303464893 editor">
					<div class="fr-box fr-basic fr-top" role="application">
						<div class="fr-wrapper show-placeholder" dir="auto"
							style="overflow: scroll;">
							<textarea name="board_content" id="content"
								style="width: 100%; height: 412px;"></textarea>
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label for="file">�̹��� �߰��ϱ�</label> <input type="file" id="files"
						name="files" multiple="multiple">
				</div>

				<input type="submit" value="�ۼ��ϱ�" id="clickbtn"
					class="btn py-3 px-4 btn-primary">



			</form>
		</div>
	</section>

	<%@include file="footer.jsp"%>
	<script type="text/javascript" charset="EUC-KR">
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "content",
			sSkinURI : "se2/SmartEditor2Skin.html",
			fCreator : "createSEditor2"
		});
	</script>

	<script>
		function submitContents() {

			var elClickedObj = $("#form");
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
			var ir1 = $("#content").val();
			//oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

			//console.log('submitContents : ' + submitContents);
			console.log('content : ' + ir1)
			if (ir1 == "" || ir1 == null || ir1 == '&nbsp;'
					|| ir1 == '<p>&nbsp;</p>') {
				alert("������ �Է��ϼ���.");
				oEditors.getById["content"].exec("FOCUS"); //��Ŀ��
				return;
			}
			if(imgFile == ""){
	               alert("�̹����� �����ϴ�.");
	               return false;
	            }
	            imgFile = imgFile.slice(imgFile.indexOf(".")+1).toLowerCase();
	            if(imgFile != "jpg" && imgFile != "png" && imgFile != "gif" && imgFile != "jpeg"){
	               alert("�̹������ϸ� ���ε� �� �� �ֽ��ϴ�.");
	               return false;
	            }


			try {
				elClickedObj.submit();
			} catch (e) {
			}
		}

		$('#clickbtn').click(function() {
			submitContents();
		});

		// 				function() {
		// 					var bTitle = $("#board_title").val();
		// 					var bContent = $("#board_content").val();
		// 					console.log('bContent: '+bContent)
		// 					if (bTitle == "") {
		// 						alert("������ �Է��ϼ���.");
		// 						return false;
		// 					}
		// 					if (bContent == "") {
		// 						alert("������ �Է��ϼ���.");
		// 						return false;
		// 					}
		//				});
	</script>