<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>
<%@include file="side.jsp"%>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<div id="colorlib-main">
   <section class="ftco-section ftco-bread">
      <div class="container">
         <div
            class="row no-gutters slider-text justify-content-center align-items-center">
            <div class="col-md-8 ftco-animate">
               <p class="breadcrumbs">
                  <span class="mr-2"><a href="index">Home</a></span> <span>board</span>
               </p>
               <h1 class="bread">�Խñ�</h1>
            </div>
         </div>
      </div>
   </section>
   <section class="ftco-section-3">
      <!-- ������ڸ� -->
      <div class="container">
         <div class="row">
            <div class="col-lg-12 ftco-animate">
               <input type="hidden" name="board_num" id="board_num"
                  value="${view.BOARD_NUM }"> <input type="hidden"
                  id="usernum" value="${view.USER_NUM }">
               <div class="col-xs-12" style="margin: 15px auto;">
                  <div id="cmBtn_group">
                     <img src="images/board.PNG" style="width: 50px;"> <label
                        style="font-size: 35px; color: black; font: bolder; float: left;">${view.BOARD_TITLE }</label>
                     <button type="button" id="modal_open_btn"
                        style="float: right; border: 0; outline: 0; font-size: 20px; width: 200px;">
                        <b>�Ű��ϱ�</b>
                     </button>
                     <hr style="color: gray;">
                  </div>
                  
                  
                  <p style="text-align: right; font-size: 22px">
                     <input type="hidden" id="user_num" value="${view.USER_NUM }">
                     <!-- Ȱ���� -->
                        <img style="height: 50px;" src="images/offline_big.png" id="indicator" class="indicator">
                     <a href="friend?user_num=${view.USER_NUM }"> �ۼ��� :
                        ${view.NICKNAME }</a> | �ۼ��ð� : ${view.BOARD_DATE }
                  </p>
               </div>
               <p><br>
                  <img src="resources/upload/${view.BOARD_IMG }" alt=""
                     class="img-fluid" style="width: 80%; height: auto;">
               </p>
               <p style="font-size: 22px;">${view.BOARD_CONTENT }</p>
               <%-- <c:if test="${user_num eq view.user_num }"> --%>
               <form name="delUp" action="post">
                  <div class="ftco-section2">
                     <input type="hidden" name="board_num" id="board_num"
                        value="${view.BOARD_NUM }"> <br>
                     <br>
                     <br>

                     <c:if test="${sessionScope.user_num == view.USER_NUM}">
                        <div id="boardBtn_group" role="group" style="float: right;">
                           <button type="button" id="boardup">�Խñۼ���</button>
                           <button type="button" id="boardDel">�Խñۻ���</button>
                        </div>
                     </c:if>

                  </div>
               </form>
               <%-- </c:if> --%>
               <div class="pt-1 mt-5">
                  <div class="comment-form-wrap pt-5">
                     <div class="mb-1">Leave a comment</div>
                     <form class="bg-light">
                        <div class="form-group">
                           <input type="text" class="form-control" id="content"
                              name="content" onkeyup="Contententerkey()"
                              style="display: inline-block; color: black;"> <span>
                              <button type="button" id="replySubmit"
                                 class="btn py-2 px-2 btn-primary" style="float: right;">��۴ޱ�</button>
                           </span>
                        </div>
                     </form>
                  </div>
                  <h3 class="mb-5 font-weight-bold">��� ${replyCnt} ��</h3>
                  <ul class="comment-list">
                     <c:forEach var="item" items="${reply}" varStatus="r">
                        <li class="comment">
                           <div class="vcard bio">
                              <input type="hidden" id="${item.USER_NUM }"
                                 value="${item.USER_NUM }"> <a
                                 href="friend?user_num=${item.USER_NUM }"> <img
                                 src="resources/upload/${item.USER_IMG }"
                                 alt="Image placeholder">
                              <input type="hidden" id="user_number" class="user_number" name="user_number" value="${item.USER_NUM }">   
                              <!-- Ȱ���� -->
                                   <img style="width: 10px;" src="images/offline.png" id="indicator${r.count }" class="indicator1">
                              
                              
                              </a>
                           </div>
                           <div class="comment-body">
                              <input type="hidden" id="notifyNickname"
                                 value="${item.NICKNAME }">
                              <div>
                                 <div class="cmtup" style="color: black;">${item.NICKNAME}
                                    | ${item.CM_DATE}</div>
                                 <div id="cmt01" style="display: '';">
                                    <div style="float: right; font: bold; color: black;">
                                       <c:if test="${sessionScope.user_num == item.USER_NUM}">
                                          <div id="cmBtn_group">
                                             <button type="button" onclick="updatecmt_chk1()"
                                                id="cntUpdateBtn">����</button>
                                             <button type="button"
                                                onclick="deletedComment('${item.CM_NUM}')"
                                                id="cntDeleteBtn">����</button>
                                          </div>
                                       </c:if>
                                       <c:if test="${sessionScope.user_num ne item.USER_NUM}">
                                          <div id="cmBtn_group">
                                             <button type="button" data-toggle="modal"
                                                data-target="#myModal2" data-test='${item.CM_NUM}'
                                                onclick="here('${item.CM_NUM }')"
                                                id="modal_open_btn${item.CM_NUM }"
                                                class="modal_open_btn2">�Ű�</button>
                                          </div>
                                       </c:if>
                                    </div>


                                    <p>${item.CM_CONTENT}</p>
                                    <p>
                                       <a href="javascript:openReplyInput('${item.CM_NUM}');"
                                          class="reply">���۴ޱ�</a>
                                    </p>
                                 </div>
                                 <div id="cmt02" style="display: none;">
                                    <div>
                                       <input type="text" id="updatdtxt" name="updatdtxt"
                                          style="width: 450px; border: 1px solid gray; outline: none;">
                                    </div>
                                    <div id="cmBtn_group" style="float: right;">
                                       <button type="button"
                                          onclick="updatecmt_chk12('${item.CM_NUM}')"
                                          id="cntUpdateBtn2">����</button>
                                       <button type="button" onclick="cancel_updatecmt()"
                                          id="cntDeleteBtn2">���</button>
                                    </div>
                                 </div>
                              </div>


                              <%-- <h3>${item.NICKNAME}</h3>
                              <div class="meta">${item.CM_DATE}</div>
                              <c:if test = "${sessionScope.user_num == item.USER_NUM}">
                              <button type="button" id="cm_delete_btn" name="cm_delete_btn" onclick="deletedComment('${item.CM_NUM}')">����</button>
                              <button type="button" id="cm_update_btn" name="cm_update_btn">����</button>
                              </c:if>
                              <p>${item.CM_CONTENT}</p>
                              <p>
                                 <a href="javascript:openReplyInput('${item.CM_NUM}');" class="reply">���۴ޱ�</a>
                              </p> --%>
                           </div>
                        </li>
                        <c:if test="${not empty item.subList }">
                           <ul class="children">
                              <c:forEach var="sub" items="${item.subList }" varStatus="r">
                                 <li class="comment" style="margin-left: 30px;">
                                    <div class="vcard bio">
                                       <a href="friend?user_num=${sub.USER_NUM }"> <img
                                          src="resources/upload/${sub.USER_IMG }"
                                          alt="Image placeholder">
                                       
                                       <input type="hidden" id="user_number2" class="user_number2" name="user_number2" value="${sub.USER_NUM }">   
                                       <!-- Ȱ���� -->
                                            <img style="width: 10px;" src="images/offline.png" id="indicator_rc${r.count }" class="indicator1">
                                       </a>
                                    </div>
                                    <div class="comment-body">
                                       <h3>${sub.NICKNAME}</h3>
                                       <div class="meta">${sub.CM_DATE}</div>
                                       <p>${sub.CM_CONTENT }</p>
                                    </div>
                                 </li>
                              </c:forEach>
                           </ul>
                        </c:if>
                        <ul class="children" style="display: none;"
                           id="child${item.CM_NUM}">
                           <li class="comment">
                              <div class="vcard bio">
                                 <img src="resources/upload/${item.USER_IMG }"
                                    alt="Image placeholder">
                              </div>
                              <div class="comment-body">
                                 <form class="bg-light">
                                    <div class="form-group">
                                       <input type="text" id="replyContent${item.CM_NUM}"
                                          onkeyup="replyenterkey()" placeholder="������ �Է��ϼ���.">
                                       <span class="input-group-btn">
                                          <button type="button"
                                             onclick="applyRecomment('${item.CM_NUM}')"
                                             class="btn py-2 px-2 btn-primary">��۴ޱ�</button>
                                       </span>
                                    </div>
                                 </form>
                              </div>

                           </li>
                        </ul>
                     </c:forEach>
                  </ul>
                  <!-- END comment-list -->
               </div>
            </div>
         </div>
      </div>
      <!-- ������ڸ� -->
   </section>

   <!-- Modal -->
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog  modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <b><h2 class="modal-title" id="myModalLabel">�Խù� �Ű��ϱ�</h2></b>
               <button type="button" class="close" data-dismiss="modal"
                  aria-label="Close" style="float: right;">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <hr style="color: gray;">
               <br>
               <br>
               <form method="post" id="checked" action="reportBoard">
                  <input type="radio" name="report_board" value="�ǽɽ����ų� �����Դϴ�."
                     checked /> �ǽɽ����ų� �����Դϴ�. <br />
                  <br /> <input type="radio" name="report_board"
                     value="���� ��ŷ�� �ǽɵ˴ϴ�." /> ���� ��ŷ�� �ǽɵ˴ϴ�.<br />
                  <br /> <input type="radio" name="report_board"
                     value="�Ű��� ����,�Ǵ� Ÿ���� ��Ī�ϰ� �ֽ��ϴ�." /> �Ű��� ����,�Ǵ� Ÿ���� ��Ī�ϰ� �ֽ��ϴ�.<br />
                  <br /> <input type="radio" name="report_board"
                     value="�������̰ų� ���������� ���� �����Դϴ�." /> �������̰ų� ���������� ���� �����Դϴ�.<br />
                  <br /> <input type="radio" name="report_board"
                     value="��ü�̹��� �Ǵ� ���� ����" /> ��ü�̹��� �Ǵ� ���� ����<br />
                  <br /> <input type="radio" name="report_board"
                     value="�ҹ� �Ǵ� ���� ��ǰ �Ǹ�" /> �ҹ� �Ǵ� ���� ��ǰ �Ǹ�<br />
                  <br />
                  <br /> <input type="hidden" name="board_num" id="board_num"
                     value="${view.BOARD_NUM }">
            </div>
            <div class="modal-footer">
               <button type="submit" class="btn btn-primary" id="report_btn">����</button>
               </form>
               <button type="button" class="btn btn-secondary"
                  data-dismiss="modal" id="report_cancel">���</button>
            </div>
         </div>
      </div>
   </div>
   <!-- Modal2 -->
   <div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog  modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <b><h2 class="modal-title" id="myModalLabel">��� �Ű��ϱ�</h2></b>
               <button type="button" class="close" data-dismiss="modal"
                  aria-label="Close" style="float: right;">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <hr style="color: gray;">
               <br>
               <br>
               <form method="post" id="checked" action="reportComment">
                  <input type="radio" name="report_comment" value="�ǽɽ����ų� �����Դϴ�."
                     checked /> �ǽɽ����ų� �����Դϴ�. <br />
                  <br /> <input type="radio" name="report_comment"
                     value="���� ��ŷ�� �ǽɵ˴ϴ�." /> ���� ��ŷ�� �ǽɵ˴ϴ�.<br />
                  <br /> <input type="radio" name="report_comment"
                     value="�Ű��� ����,�Ǵ� Ÿ���� ��Ī�ϰ� �ֽ��ϴ�." /> �Ű��� ����,�Ǵ� Ÿ���� ��Ī�ϰ� �ֽ��ϴ�.<br />
                  <br /> <input type="radio" name="report_comment"
                     value="�������̰ų� ���������� ���� �����Դϴ�." /> �������̰ų� ���������� ���� �����Դϴ�.<br />
                  <br /> <input type="radio" name="report_comment"
                     value="��ü�̹��� �Ǵ� ���� ����" /> ��ü�̹��� �Ǵ� ���� ����<br />
                  <br /> <input type="radio" name="report_comment"
                     value="�ҹ� �Ǵ� ���� ��ǰ �Ǹ�" /> �ҹ� �Ǵ� ���� ��ǰ �Ǹ�<br />
                  <br />
                  <br /> <input type="hidden" name="board_num" id="board_num"
                     value="${view.BOARD_NUM }"> <input type="hidden"
                     name="comment_num" id="comment_num" value="">
            </div>
            <div class="modal-footer">
               <button type="submit" class="btn btn-primary" id="report_btn">����</button>
               </form>
               <button type="button" class="btn btn-secondary"
                  data-dismiss="modal" id="report_cancel">���</button>
            </div>
         </div>
      </div>
   </div>

   <%@include file="footer.jsp"%>

   <script>
      function here(comment_num) {
         $('#comment_num').val(comment_num);
      };

      $(document).ready(function() {
         $("#replySubmit").off("click");
         $("#replySubmit").on("click", function() {
            insertReplySubmit();
         });
         //----
         $("#modal_open_btn").click(function() {
            //alert('aa');
            $("#myModal").modal("show");
         });

         $("#close_modal").click(function() {
            $("#myModal").modal("hide");
         });

         $('#myModal2').on('show.bs.modal', function(e) {
            // var comment_num = $(e.relatedTarget).data('test');
         });

         /* $(".modal_open_btn2}").click(function(){
            alert('����');
            $("#myModal2").modal("show");
         });
         
          $("#close_modal2").click(function() {
             $("#myModal2").modal("hide");
         }); */

         $('#report_btn').click(function() {
            // var check = $('#checked input:radio[name="report_board"]:checked').val();
            //alert(check);
            //var user_num = ${sessionScope.user_num};
            //alert(user_num);
            //var board_num = $('#board_num').val();
            //alert(board_num);

            //var param = new Object();
            //param.check = check;
            //param.user_num = user_num;
            //param.board_num = board_num;
            //var paramJson = JSON.stringify(param);
            //console.log("���� ����"+paramJson);
            alert('�Ű� �����Ǿ����ϴ�.')
            /* $.ajax({
               type : "GET",
               url : "reportBoard?params="+paramJson,
               data : paramJson,
               contentType : "application/json; charset=utf-8",
               success :function(res){
                   $("#myModal").modal("hide");
                  alert('�Ű������Ǿ����ϴ�.');
               },
               error:function(request,status,error){
                  console.log(error);
                    alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
                   }
               }); */
         })

         //----

      });

      /* function submitA() {
      var check = $('#checked input:radio[name="report_board"]:checked').val();
      //alert(check);
      var user_num = ${sessionScope.user_num};
      //alert(user_num);
      var board_num = $('#board_num').val();
      //alert(board_num);
      
      var param = new Object();
      param.check = check;
      param.user_num = user_num;
      param.board_num = board_num;
      var paramJson = JSON.stringify(param);
      console.log("���� ����"+paramJson);
      $.ajax({
         type : "POST",
         url : "/reportBoard",
         data : paramJson,
         contentType : "application/json; charset=utf-8",
         success :function(res){
             $("#myModal").modal("hide");
            alert('�Ű������Ǿ����ϴ�.');
         },
         error:function(request,status,error){
            console.log(error);
              alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
             }
         });
      
       } */
      var notifyon;
      var link;
      var notifyLink = document.location.href;
      var usernum = $("#usernum").val();
      function insertReplySubmit() {
         var content = $("#content").val();
         var notifycontent = $("#notifyNickname").val();
         console.log("�̰Ź���?"+notifycontent);
         var boardNum = '${param.board_num}';
         var param = new Object();
         if (content == '') {
            alert("�ƹ������� �����ϴ�. ����� �Է��� �� �����ϴ�.");
            return;
         }
         if (boardNum == "") {
            alert("������ �߻��߽��ϴ�. ���ΰ�ħ �غ�����");
            return;
         }
         param.content = content;
         param.boardNum = boardNum;
         param.notifyLink = notifyLink;
         param.notifycontent = notifycontent + "���� ����� �޾ҽ��ϴ�.";
         param.usernum = usernum;
         var paramJson = JSON.stringify(param);
         $.ajax({
            type : "POST",
            url : "reply",
            contentType : "application/json; charset=utf-8",
            dataType : "json",
            data : paramJson,
            success : function(res) {
               console.log(res);
               if (res.result == "success") {
                  //��� �˶� �������� ����
                  link = '���|' + notifyLink + '|' + notifycontent;
                  notifyon(link);
                  document.location.href = document.location.href;
               } else {
                  alert("�������� ����߿� ������ �߻��Ͽ����ϴ�.");
               }
            },
            error : function(request, status, error) {
               alert("code = " + request.status + " message = "
                     + request.responseText + " error = " + error); // ���� �� ó��
            }
         });
      }

      function openReplyInput(replyNum) {
         $popup = $("#child" + replyNum);
         if ($popup.css("display") == "none") {
            $popup.fadeIn();
         } else {
            $popup.css("display", "none");
         }
      }

      function applyRecomment(replyNum) {
         var param = new Object();
         var content = $("#replyContent" + replyNum).val();
         var boardNum = '${param.board_num}';
         var recommentNum = replyNum;
         var notifycontent = $("#notifyNickname").val();
         if (content == '') {
            alert("�ƹ������� �����ϴ�. ����� �Է��� �� �����ϴ�.");
            return;
         }
         param.content = content;
         param.boardNum = boardNum;
         param.recommentNum = recommentNum;
         param.notifyLink = notifyLink;
         param.notifycontent = notifycontent + "���� ��ۿ� ����� �޾ҽ��ϴ�.";
         param.usernum = usernum;
         var paramJson = JSON.stringify(param);
         console.log(paramJson);
         $.ajax({
            type : "POST",
            url : "reply",
            contentType : "application/json; charset=utf-8",
            dataType : "json",
            data : paramJson,
            success : function(res) {
               console.log(res);
               if (res.result == "success") {
            	   link = '����|' + notifyLink + '|' + notifycontent;
                   notifyon(link);
                  document.location.href = document.location.href;
               } else {
                  alert("�������� ����߿� ������ �߻��Ͽ����ϴ�.");
               }
            },
            error : function(request, status, error) {
               alert("code = " + request.status + " message = "
                     + request.responseText + " error = " + error); // ���� �� ó��
            }
         });
      }

      $('#boardDel').click(function() {
         if (confirm("�����Ͻðڽ��ϱ�?")) {
            document.delUp.action = "boardDel";
            document.delUp.submit();

         }
      });
      $('#boardup').click(function() {
         document.delUp.action = "upboard";
         document.delUp.submit();
      });

      //--------------------
      function deletedComment(cm_num) {
         if (confirm("�����Ͻðڽ��ϱ�?")) {
            $.ajax({
               type : "GET",
               url : "commentDel?cm_num=" + cm_num,

               success : function(res) {
                  //alert("����� �����Ǿ����ϴ�.");
                  document.location.href = document.location.href;
               },

               error : function(request, status, error) {
                  alert("code = " + request.status + " message = "
                        + request.responseText + " error = " + error); // ���� �� ó��
               }
            });
         }
      }

      function updatecmt_chk1() {
         document.getElementById('cmt01').style.display = 'none';
         document.getElementById('cmt02').style.display = '';
      }

      function cancel_updatecmt() {
         document.getElementById('cmt02').style.display = 'none';
         document.getElementById('cmt01').style.display = '';
      }

      function updatecmt_chk12(cm_num) {
         if (confirm("����� �����Ͻðڽ��ϱ�?")) {
            var cm_content = $("#updatdtxt").val();
            var param = new Object();
            if (content == '') {
               alert("�ƹ������� �����ϴ�. ����� �Է����ּ���.");
               return;
            }
            param.cm_content = cm_content;
            param.cm_num = cm_num;
            var paramJson = JSON.stringify(param);

            $.ajax({
               type : "POST",
               url : "commentUpdate",
               contentType : "application/json; charset=utf-8",
               dataType : "text",
               data : paramJson,
               success : function(res) {
                  //alert("���������� ����� �����Ǿ����ϴ�.");
                  document.location.href = document.location.href;
               },
               error : function(request, status, error) {
                  alert("code = " + request.status + " message = "
                        + request.responseText + " error = " + error); // ���� �� ó��
               }
            });
         }
      }
      function Contententerkey() {
         if (window.event.keyCode == 13) {
            insertReplySubmit();
         }
      }
      function replyenterkey() {
         if (window.event.keyCode == 13) {
            applyRecomment();
         }
      }
   </script>