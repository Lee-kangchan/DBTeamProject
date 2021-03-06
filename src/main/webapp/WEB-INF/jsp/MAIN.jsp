<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<% Integer sess = (Integer)request.getAttribute("sess"); %>
<% List<HashMap<String, Object>> review = (List<HashMap<String, Object>>)request.getAttribute("review"); %>
<% List<HashMap<String, Object>> book = (List<HashMap<String, Object>>)request.getAttribute("book"); %>
<% List<HashMap<String, Object>> promotion = (List<HashMap<String, Object>>)request.getAttribute("promotion"); %>
<% HashMap<String, Object> rank = (HashMap<String, Object>)request.getAttribute("rank");  %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>book</title>
    <link rel="stylesheet" href="static/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Bungee">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:400,600,800">
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
</head>

<body>
    <div id="navigation-block" class="container">
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
                            <li class="nav-item"><a class="nav-link active" href="/myPage" style="font-size: 19px;font-family: 'Roboto Condensed', sans-serif;">MY PAGE</a></li>
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
                                <li class="nav-item"><a class="nav-link d-flex" data-bs-hover-animate="bounce" href="/myBook" style="padding-left: 20px;padding-right: 20px;font-size: 20px;margin: 0 aitp;font-family: Nunito, sans-serif;">나의 도서 현황</a></li>
                                <li class="nav-item"><a class="nav-link d-flex" data-bs-hover-animate="bounce" href="/review" style="font-size: 20px;padding-left: 20px;font-family: Nunito, sans-serif;">도서별 리뷰 보기</a></li>
                            </ul>
                        </form>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <%if(sess!=null){%>
    <div class="container" style="width: 500px;padding-bottom: 18px;font-family: 'Do Hyeon', sans-serif;">
        <div class="row">
            <div class="col" style="padding-right: 5px;padding-left: 5px;border-style: solid;border-color: rgb(40,167,69);"><strong style="text-align: center;font-size: 20px;border-style: none;border-bottom-style: solid;border-bottom-color: rgb(40,167,69);width: 460px;"><%=rank.get("best_borrow_area_name")%> 순위</strong>
                <div class="row">
                    <div class="col" style="padding-right: 0px;padding-left: 0px;"><strong style="font-size: 18px;width: 250px;">거래 순위</strong></div>
                    <div class="col" style="padding-right: 0px;padding-left: 0px;font-size: -1px;"><strong style="font-size: -1px;">거래량</strong></div>
                </div>
                <div class="row">
                    <div class="col" style="padding-right: 0px;padding-left: 0px;font-size: -1px;"><strong style="font-size: -1px;"><%=rank.get("best_borrow_area_seq")%>등</strong></div>
                    <div class="col" style="padding-right: 0px;padding-left: 0px;"><strong><%=rank.get("best_borrow_area_count")%>회</strong></div>
                </div>
            </div>
        </div>
    </div>
    <%}%>
    <div class="simple-slider">
        <div class="swiper-container container">
            <div class="swiper-wrapper" style="height: 420px;">
                <%for(int num =0 ; num < promotion.size(); num++ ){%>
                <div class="swiper-button-prev"></div>
                    <%if(num==0){%>
                        <div class="d-flex swiper-slide" style="background-image: url(https://placeholdit.imgix.net/~text?txtsize=68&amp;txt=Slideshow+Image&amp;w=1920&amp;h=500);background-size: cover;height: 400px;"><img width ="70%" src="<%= promotion.get(num).get("promotion_image")%>" style="height: 400px;margin: 0 auto;"></div>
                    <%}else{%>
                        <div class="swiper-slide" style="background-image: url(https://placeholdit.imgix.net/~text?txtsize=68&amp;txt=Slideshow+Image&amp;w=1920&amp;h=500);background-size: cover;height: 400px;"><img width="70%" class="d-flex" src="<%= promotion.get(num).get("promotion_image")%>" style="width: 977px;margin: 0 auto;height: 400px;"></div>
                    <%}%>
                <%}%>

                <div class="swiper-button-next"></div>
            </div>
            <div class="swiper-pagination"></div>
        </div>
        <form>
            <h1 class="container" style="font-family: Bungee, cursive;color: rgb(40,167,69);font-size: 26px;padding: 20px;">Current's BOOK</h1>
            <section style="margin-top: 20px;" class="c">
                <div class="d-flex  multiple-item-slider container">
                    <%for(int num = book.size()-1 ; num >= 0 ; num--){%>
                        <%if(num==0){%>
                            <div class="justify-content-center spacer-slider">
                                <figure class="figure">
                                    <a href="/book/<%=book.get(num).get("customer_book_seq")%>"><img class="img-fluid figure-img" width="200px" height="300px" src="<%= book.get(num).get("currents_book_img")%>" alt="alt text here"></a></figure>
                            </div>
                        <%}else if(num == book.size()-1){%>
                            <div class="justify-content-center spacer-slider">
                                <a href="/book/<%=book.get(num).get("customer_book_seq")%>"><img class="img-fluid figure-img" width="200px" height="300px" src="<%= book.get(num).get("currents_book_img")%>" alt="alt text here"></a>
                            </div>
                        <%}else{%>
                            <div class="justify-content-center spacer-slider">
                                <figure class="figure">
                                    <a href="/book/<%=book.get(num).get("customer_book_seq")%>"><img class="img-fluid figure-img" width="200px" height="300px" src="<%= book.get(num).get("currents_book_img")%>" alt="alt text here"></a></figure>
                            </div>
                        <%}%>
                    <%}%>
                </div>
            </section>
        </form>
        <h1 class="container" style="font-family: Bungee, cursive;color: rgb(68,178,93);font-size: 26px;padding: 20px;">Today's REVIEW</h1>
        <div class="card-group bg-light container d-flex  " style="margin-bottom: 20px">
            <%for(int i = review.size()-1 ; i>= review.size()-4; i--){ if(i == -1)break; %>
            <div class="card " style="padding:20px;border-radius:8px; border:3px solid rgb(40,167,69);">
                <div class="card-body">
                    <a href="#" style="text-decoration:none;"><p class="card-title" style="font-family: 'Roboto Condensed', sans-serif; color:rgb(40,167,69); height:20%; font-weight:bold"><%=review.get(i).get("currents_review_title")%></p></a>
                    <p> </p>
                    <p class="card-text" style="font-family: 'Roboto Condensed', sans-serif;text-align: center; height:60%"><%=review.get(i).get("currents_review_content")%></p>
                    <p class="card-title" style="font-family: 'Roboto Condensed', sans-serif;"><%=review.get(i).get("currents_review_name")%></p>
                </div>
            </div>
            <%}%>
        </div>
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