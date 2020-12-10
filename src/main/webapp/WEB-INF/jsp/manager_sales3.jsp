<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
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
    <div class="container">
        <div class="row" style="padding-top: 40px;">
            <div class="col" style="padding-right: 15px;width: 300px;max-width: 300px;">
                <div class="row" style="width: 250px;margin-left: -7px;border-style: solid;border-color: rgb(40,167,69);">
                    <div class="col" style="margin: 10px;width: 250px;margin-left: -7px;"><a href="/manager/sales/1"><strong style="width: 250px;margin-left: -7px;color: rgb(12,13,13);">월별 매출통계</strong></a></div>
                </div>
                <div class="row" style="width: 250px;margin-left: -7px;">
                    <div class="col" style="margin: 10px;width: 250px;margin-left: -7px;"><a href="/manager/sales/2"><strong style="width: 250px;margin-left: -7px;color: rgb(35,36,37);">요일별 매출통계</strong></a></div>
                </div>

            </div>
            <div class="col" style="width: 70px;border-style: solid;border-color: rgb(40,167,69);">
                <section><strong style="color: rgb(131,135,143);font-size: 20px;font-family: 'Roboto Condensed', sans-serif;margin-top: 20px;">월별 매출 통계</strong><img src="/static/img/month.jpg" style="width: 783px;"></section>
            </div>
        </div>
    </div>
    <script src="/static/assets/js/jquery.min.js"></script>
    <script src="/static/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="/static/assets/js/bs-init.js"></script>
    <script src="/static/assets/js/--mp---Multiple-items-slider-responsive-1.js"></script>
    <script src="/static/assets/js/--mp---Multiple-items-slider-responsive.js"></script>
    <script src="/static/assets/js/Grid-and-List-view-V10.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/js/swiper.jquery.min.js"></script>
    <script src="/static/assets/js/Media-Slider-Bootstrap-3.js"></script>
    <script src="/static/assets/js/Simple-Slider.js"></script>
    <script src="/static/assets/js/TextEditor.js"></script>
</body>

</html>