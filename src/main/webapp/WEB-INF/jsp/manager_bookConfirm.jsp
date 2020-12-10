
<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<% HashMap<String, Object> book = (HashMap<String, Object>)request.getAttribute("book"); %>
<% List<HashMap<String, Object>> bookImage = (List<HashMap<String, Object>>)request.getAttribute("bookImage"); %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>book</title>
    <link rel="stylesheet" href="/static/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Bungee">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:400,600,800">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto+Condensed">
    <link rel="stylesheet" href="/static/assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="/static/assets/css/--mp---Multiple-items-slider-responsive.css">
    <link rel="stylesheet" href="/static/assets/css/Comment.css">
    <link rel="stylesheet" href="/static/assets/css/Footer-Clean.css">
    <link rel="stylesheet" href="/static/assets/css/Grid-and-List-view-V10-1.css">
    <link rel="stylesheet" href="/static/assets/css/Grid-and-List-view-V10.css">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/css/swiper.min.css">
    <link rel="stylesheet" href="/static/assets/css/Media-Slider-Bootstrap-3-1.css">
    <link rel="stylesheet" href="/static/assets/css/Media-Slider-Bootstrap-3.css">
    <link rel="stylesheet" href="/static/assets/css/Simple-Slider.css">
    <link rel="stylesheet" href="/static/assets/css/styles.css">
    <link rel="stylesheet" href="/static/assets/css/TextEditor.css">
</head>

<body>
<div id="navigation-block" style="padding-bottom: 38px;">
    <nav class="navbar navbar-light navbar-expand-md d-flex" style="border-bottom-style: solid;border-bottom-color: rgb(40,167,69);">
        <div class="container-fluid"><a class="navbar-brand" style="font-family: Bungee, cursive;padding-left: 20px;font-size: 31px;" href="/manager/main">Local libarary</a>
            <div class="collapse navbar-collapse d-flex" id="navcol-1">
                <ul class="nav navbar-nav ml-auto" style="margin-right: 6px;">
                    <li class="nav-item" style="margin-right: 5px;"><a class="nav-link active" href="/manager/book" style="font-size: 19px;font-family: 'Roboto Condensed', sans-serif;">도서 목록</a></li>
                    <li class="nav-item" style="margin-right: 3px;"><a class="nav-link active" href="/manager/promotion" style="font-size: 19px;font-family: 'Roboto Condensed', sans-serif;">프로모션 목록</a></li>
                    <li class="nav-item" style="margin-right: 5px;"><a class="nav-link active" href="/manager/report" style="font-size: 19px;font-family: 'Roboto Condensed', sans-serif;">신고 목록</a></li>
                    <li class="nav-item"><a class="nav-link active" href="/manager/sales/1" style="font-size: 19px;font-family: 'Roboto Condensed', sans-serif;">매출 통계</a></li>
                </ul>
            </div>
        </div>
    </nav>
</div>
    <div class="container" style="width: 1000px;font-size: 24px;">
        <div class="row">
            <div class="col"><strong style="font-size: 24px;padding: 12px;font-family: 'Do Hyeon', sans-serif;">회원 도서 승인</strong></div>
        </div>
        <div class="row">
            <div class="col" style="width: 100px;padding-left: 15px;font-family: 'Do Hyeon', sans-serif;"><img src="/<%=book.get("book_img")%>" style="width: 300px;height: 400px;"></div>
            <div class="col" style="width: 100px;padding-left: 15px;border-right: 3px solid rgb(40,167,69);font-family: 'Do Hyeon', sans-serif;">
                <div class="row" style="text-align: right;font-family: 'Do Hyeon', sans-serif;">
                    <div class="col" style="width: 178px;"><strong style="font-size: 20px;text-align: right;margin: 3px;margin-right: 10px;">도서명</strong></div>
                </div>
                <div class="row" style="text-align: right;font-size: 20px;">
                    <div class="col" style="width: 200px;font-size: 20px;"><strong style="font-size: 20px;text-align: right;margin: 3px;margin-right: 10px;">작가</strong></div>
                </div>
                <div class="row" style="text-align: right;font-size: 20px;">
                    <div class="col" style="width: 200px;font-size: 20px;"><strong style="font-size: 20px;text-align: right;margin: 3px;margin-right: 10px;">출판사</strong></div>
                </div>
                <div class="row" style="text-align: right;font-size: 20px;">
                    <div class="col" style="width: 200px;font-size: 20px;"><strong style="font-size: 20px;text-align: right;margin: 3px;margin-right: 10px;">출판연도</strong></div>
                </div>
                <div class="row" style="text-align: right;font-size: 20px;">
                    <div class="col" style="width: 200px;font-size: 20px;"><strong style="font-size: 20px;text-align: right;margin: 3px;margin-right: 10px;">장르</strong></div>
                </div>
                <div class="row" style="text-align: right;font-size: 20px;">
                    <div class="col" style="width: 200px;font-size: 20px;"><strong style="font-size: 20px;text-align: right;margin: 3px;margin-right: 10px;">예치금</strong></div>
                </div>
                <div class="row" style="text-align: right;font-size: 20px;">
                    <div class="col" style="width: 200px;font-size: 20px;"><strong style="font-size: 20px;text-align: right;margin: 3px;margin-right: 10px;"> 회원 도서 사진</strong></div>
                </div>
            </div>
            <div class="col" style="font-family: 'Do Hyeon', sans-serif;">
                <div class="row" style="text-align: right;font-size: 20px;font-family: 'Do Hyeon', sans-serif;">
                    <div class="col" style="width: 200px;font-size: 20px;"><strong style="font-size: 20px;text-align: center;margin: 3px;"><%=book.get("book_name")%></strong></div>
                </div>
                <div class="row" style="text-align: right;font-size: 20px;">
                    <div class="col" style="width: 200px;font-size: 20px;"><strong style="font-size: 20px;text-align: center;margin: 3px;"><%=book.get("book_author")%></strong></div>
                </div>
                <div class="row" style="text-align: right;font-size: 20px;">
                    <div class="col" style="width: 200px;font-size: 20px;"><strong style="font-size: 20px;text-align: center;margin: 3px;"><%=book.get("book_publisher")%></strong></div>
                </div>
                <div class="row" style="text-align: right;font-size: 20px;">
                    <div class="col" style="width: 200px;font-size: 20px;"><strong style="font-size: 20px;text-align: center;margin: 3px;"><%=book.get("book_year")%></strong></div>
                </div>
                <div class="row" style="text-align: right;font-size: 20px;">
                    <div class="col" style="width: 200px;font-size: 20px;"><strong style="font-size: 20px;text-align: center;margin: 3px;"><%=book.get("category_name")%></strong></div>
                </div>
                <div class="row" style="text-align: right;font-size: 20px;">
                    <div class="col" style="width: 200px;font-size: 20px;"><strong style="font-size: 20px;text-align: center;margin: 3px;"><%=book.get("customer_book_deposit")%></strong></div>
                </div>
                <div class="col" style="width: 200px;font-size: 20px;">
                    <button class="btn btn-primary btn-block" data-toggle="modal" data-target="#modal1" type="button" style="text-align: center;margin-left: 40px;">확인하기</button>
                </div>
            </div>
        </div>
        <div class="row" style="margin-bottom: 50px;margin-top: 50px;padding-bottom: 15px;">
            <div class="col "><button class="btn btn-primary" type="button" style="margin-left: 100%;padding-right: 80px;padding-left: 80px;padding-top: 10px;padding-bottom: 10px;margin-bottom: 31px;font-size: 20px;text-align: center;margin-top: 0px;font-family: 'Do Hyeon', sans-serif;">도서 승인</button></div>
            <div class="col "><button id="SBtn"class="btn btn-primary" type="button" style="margin-left: 60%;padding-right: 80px;padding-left: 80px;padding-top: 10px;padding-bottom: 10px;margin-bottom: 31px;font-size: 20px;text-align: center;margin-top: 0px;font-family: 'Do Hyeon', sans-serif;">도서 거절</button></div>
        </div>
    </div>
    <div class="modal fade" role="dialog" tabindex="-1" id="modal1">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" style="margin-left: 150px;">도서 상세 사진</h4></div>
                <div class="modal-body">
                    <%for(HashMap<String, Object> map : bookImage){%>
                    <img src="<%=map.get("customer_book_img")%>" style="width: 300px;height: 360px;">
                    <%}%>
                </div>
                <div class="modal-footer" style="padding-bottom: 42px;"><button class="btn btn-block close" type="button" data-dismiss="modal" aria-label="Close" style="font-size: 20px;border: 3px solid rgb(20,150,33);width: 473px;color: rgb(0,0,0);background: rgb(229,238,231);">확인</button></div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="BModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold">거절 사유</h4>

                </div>
                <form class="modal-body mx-3" action="/manager/book/yn" method="POST">
                    <div class="md-form mb-3">
                        <input name="customer_book_reason" id="defaultForm-text" class="form-control validate" placeholder="거절사유" >
                        <input type="hidden" name="customer_book_certification_yn" value="2">
                        <input type="hidden" name="<%=book.get("customer_book_seq")%>">
                    </div>

                    <div class="modal-footer d-flex justify-content-center">
                        <button class="btn btn-default" style="margin-top:50px; margin-bottom: 50px;width: 100%">승인 거절</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="/static/assets/js/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="../static/assets/js/jquery.min.js"></script>
    <script src="/static/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="/static/assets/js/--mp---Multiple-items-slider-responsive-1.js"></script>
    <script src="/static/assets/js/--mp---Multiple-items-slider-responsive.js"></script>
    <script src="/static/assets/js/Grid-and-List-view-V10.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/js/swiper.jquery.min.js"></script>
    <script src="/static/assets/js/Media-Slider-Bootstrap-3.js"></script>
    <script src="/static/assets/js/Simple-Slider.js"></script>
    <script src="/static/assets/js/TextEditor.js"></script>
    <script>
        $(document).ready(function(){

            $("#SBtn").click(function(){
                $("#BModal").modal("show")
            })
            $("SBtn2").click(function(){
                $("#BModal").modal("hide")
            })

        })

    </script>
</body>

</html>