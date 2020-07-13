<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<h1 class="bread">글쓰기</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section-3">
		<div class="pt-5 mt-5">
			<!-- END comment-list -->

			<div class="comment-form-wrap pt-5">
				<h3 class="mb-5">Leave a comment</h3>
				<form action="writesaju1" method="post" class="p-3 p-md-5 bg-light" enctype="multipart/form-data">
					<div class="form-group">
						<label for="name">제목</label> <p>나의 사주 동물은  ${vo.result_animal}</p>
						<input type="hidden"
							class="form-control" name="board_title" id="board_title" value="나의 사주 동물은  ${vo.result_animal}">
					</div>
					<div class="form-group">
						<label for="message">내용</label>
						<textarea name="board_content" id="board_content" cols="30" rows="10"
							class="form-control">${vo.result_animal}은(는) ${vo.ilju}일주 입니다.
							${vo.result_basic}
							유명인 중 나와 잘맞는 일주동물을 가진 사람은 ${vo.result_influ}
							 </textarea>
					</div>
					<div class="form-group">
						<label for="file">이미지 추가하기</label> 
						<input type="file" id="files" name="files" multiple="multiple" >
					</div>
					<div class="form-group">
						<input type="submit" value="작성하기"
							class="btn py-3 px-4 btn-primary" id="sub11">
							
					</div>
				</form>
			</div>
		</div>
	</section>

	<%@include file="footer.jsp"%>