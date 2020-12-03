<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<% Integer sess = (Integer)request.getAttribute("sess"); %>
<% List<HashMap<String, Object>> point = (List<HashMap<String, Object>>)request.getAttribute("point"); %>
<% HashMap<String, Object> userInfo = (HashMap<String, Object>)request.getAttribute("userInfo"); %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>book</title>
    <link rel="stylesheet" href="static/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Bungee">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do Hyeon:400,600,800">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto+Condensed">
    <link rel="stylesheet" href="static/assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="static/assets/css/--mp---Multiple-items-slider-responsive.css">
    <link rel="stylesheet" href="static/assets/css/Comment.css">
    <link rel="stylesheet" href="static/assets/css/Footer-Clean.css">
    <link rel="stylesheet" href="static/assets/css/Grid-and-List-view-V10-1.css">
    <link rel="stylesheet" href="static/assets/css/Grid-and-List-view-V10.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/css/swiper.min.css">
    <link rel="stylesheet" href="static/assets/css/Media-Slider-Bootstrap-3-1.css">
    <link rel="stylesheet" href="static/assets/css/Media-Slider-Bootstrap-3.css">
    <link rel="stylesheet" href="static/assets/css/Simple-Slider.css">
    <link rel="stylesheet" href="static/assets/css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
</head>

<body>
<div id="navigation-block">
    <nav class="navbar navbar-light navbar-expand-md d-flex">
        <div class="container-fluid"><a class="navbar-brand" style="font-family: Bungee, cursive;padding-left: 20px;font-size: 31px;" href="/home">Local libarary</a><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <ul
                    class="nav navbar-nav"></ul>
            <div class="collapse navbar-collapse d-flex" id="navcol-1">
                <form action="/search" class="form-inline d-flex" style="margin: 0 auto;"><input class="form-control d-flex ml-auto" type="search" placeholder="검색할 내용을 입력해주세요" name="SEARCH" style="padding: 5px;margin: 17px;width: 415px;padding-left: 23px;font-family: 'Roboto Condensed', sans-serif;margin-right: 8px;">
                    <i
                            class="fa fa-search" style="width: 20px;height: 20px;font-size: 20px;color: rgb(38,166,67);"></i>
                </form>
                <ul class="nav navbar-nav ml-auto">
                    <% if(sess == null) { %>
                    <li class="nav-item"><a class="nav-link active" href="/login" style="font-size: 19px;font-family: 'Roboto Condensed', sans-serif;">LOGIN</a></li>
                    <li class="nav-item"><a class="nav-link" href="/signup" style="font-size: 19px;font-family: 'Roboto Condensed', sans-serif;">SIGNUP</a></li>
                    <% } else { %>
                    <li class="nav-item"><a class="nav-link active" href="/mypage" style="font-size: 19px;font-family: 'Roboto Condensed', sans-serif;">MY PAGE</a></li>
                    <li class="nav-item"><a class="nav-link" href="/logout" style="font-size: 19px;font-family: 'Roboto Condensed', sans-serif;">LOGOUT</a></li>
                    <li class="nav-item"><a class="nav-link active" href="/bookInsert" style="font-size: 19px;font-family: 'Roboto Condensed', sans-serif;">도서등록</a></li>
                    <% } %>
                </ul>
            </div>
        </div>
    </nav>
    <div>
        <nav class="navbar navbar-light navbar-expand-md d-flex" style="box-shadow: 0px 0px;">
            <div class="container-fluid"><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-2"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse text-center d-flex" id="navcol-2"
                     style="margin: 0 auto;">
                    <form class="form-inline" style="margin: 0 auto;">
                        <ul class="nav navbar-nav">
                            <li class="nav-item"><a class="nav-link active d-flex" data-bs-hover-animate="bounce" href="/book" style="padding-right: 20px;font-size: 20px;margin: 0 auto;font-family: Nunito, sans-serif;">우리동네 도서</a></li>
                            <li class="nav-item"><a class="nav-link d-flex" data-bs-hover-animate="bounce" href="#" style="padding-left: 20px;padding-right: 20px;font-size: 20px;margin: 0 aitp;font-family: Nunito, sans-serif;">나의 도서 현황</a></li>
                            <li class="nav-item"><a class="nav-link d-flex" data-bs-hover-animate="bounce" href="/review" style="font-size: 20px;padding-left: 20px;font-family: Nunito, sans-serif;">도서별 리뷰 보기</a></li>
                        </ul>
                    </form>
                </div>
            </div>
        </nav>
    </div>
</div>
    <div class="container" style="width: 1000px;color: rgb(76,82,75);"><strong style="color: rgb(131,135,143);font-size: 20px;font-family: 'Do Hyeon', sans-serif;">나의 포인트</strong><strong style="color: rgb(131,135,143);font-size: 30px;margin-top: -20px;font-family: 'Do Hyeon', sans-serif;"><%=userInfo.get("customer_point")%>p</strong></div>
    <div
        class="container" style="margin-top: 3px;border-bottom-style: none;border-bottom-color: rgb(40,167,69);width: 1000px;">
        <div class="row" style="border-bottom-style: solid;border-bottom-color: rgb(40,167,69);padding-bottom: 15px;">
            <div class="col"><strong style="font-family: 'Do Hyeon', sans-serif;font-size: 20px;">결제 일자</strong></div>
            <div class="col" style="font-family: 'Do Hyeon', sans-serif;font-size: 20px;"><strong style="font-family: 'Do Hyeon', sans-serif;font-size: 20px;">지출 내용</strong></div>
            <div class="col" style="font-family: 'Do Hyeon', sans-serif;font-size: 20px;"><strong style="font-family: 'Do Hyeon', sans-serif;font-size: 20px;">지출/지급 여부</strong></div>
        </div>
        <% for(int i = 0; i < point.size(); i++) { %>
            <div class="row" style="border-bottom-style: none;border-bottom-color: rgb(40,167,69);margin-top: 0px;">
                <div class="col" style="height: 100px;"><strong class="text-center text-body" style="margin-top: 30px;font-family: 'Do Hyeon', sans-serif;"><%=point.get(i).get("approval_createAt")%></strong></div>
                <div class="col" style="height: 100px;"><strong class="text-center text-body" style="margin-top: 25px;font-family: 'Do Hyeon', sans-serif;font-size: 14px;"></strong>
                <strong class="text-center" style="margin-top: 8px;font-family: 'Do Hyeon', sans-serif;"><%=point.get(i).get("approval_detail")%></strong></div>
                <div class="col" style="font-family: 'Do Hyeon', sans-serif;height: 100px;"><strong class="text-center" style="margin-top: 30px;font-family: 'Do Hyeon', sans-serif;"><%=point.get(i).get("approval_yn")%> <%=point.get(i).get("approval_point")%>p</strong></div>

            </div>
        <% } %>

        </div>
        <script src="static/assets/js/jquery.min.js"></script>
        <script src="static/assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="static/assets/js/bs-init.js"></script>
        <script src="static/assets/js/--mp---Multiple-items-slider-responsive-1.js"></script>
        <script src="static/assets/js/--mp---Multiple-items-slider-responsive.js"></script>
        <script src="static/assets/js/Grid-and-List-view-V10.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/js/swiper.jquery.min.js"></script>
        <script src="static/assets/js/Media-Slider-Bootstrap-3.js"></script>
        <script src="static/assets/js/Simple-Slider.js"></script>
</body>

</html>