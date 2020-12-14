<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<% Integer sess = (Integer)request.getAttribute("sess"); %>
<% List<HashMap<String, Object>> book = (List<HashMap<String, Object>>)request.getAttribute("book"); %>
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
    <div class="col text-justify " style="width: 100px;margin-left: 860px;margin-bottom: 6px;"><a class="text-black-50" href="gridBook1.html" style="border-color: rgb(40,167,69);"><i class="fa fa-th-large" style="font-size: 29px;border-color: rgb(40,167,69);"></i></a><a class="text-black-50" href="listBook1.jsp" style="border-color: rgb(40,167,69);"><i class="fa fa-th-list" style="margin-left: 10px;font-size: 29px;"></i></a></div>
<div class="container">
<% int count = 0; %>
    <%for(int i =0 ; i<book.size()/3; i++){ %>
    <div class="row ">
        <% for(int j =0; j<3 ;j++){%>
                <%if(book.get(count).get("customer_book_type").toString().equals("대여가능")){%>
                <div class="col" style="padding-right: 5px;padding-left: 5px;">
                    <a href="/book/<%=book.get(count).get("customer_book_seq")%>" style="text-decoration:none;">
                        <picture><img src="<%=book.get(count).get("book_img")%>"style="width: 152px;height: 225px;"></picture><strong style="font-size: 20px;text-align: center;color: rgb(8,9,9);"><%=book.get(count).get("book_name")%><button class="btn btn-sm" type="button" style="font-size: 12px;margin-left: 5px;">대여가능</button></strong>
                        <strong
                            style="font-size: 16px;text-align: center;color: rgb(40,167,69);"><%=book.get(count).get("customer_address")%> <strong style="font-size:15px;color:black"><%=book.get(count).get("distance")%></strong></strong>
                    </a>
                </div>
                <%}%>
                <%if(book.get(count).get("customer_book_type").toString().equals("대여중")){%>
                <div class="col" style="padding-right: 5px;padding-left: 5px;">
                    <a href="/book/<%=book.get(count).get("customer_book_seq")%>" style="text-decoration:none;">
                        <picture><img src="<%=book.get(count).get("book_img")%>" style="width: 152px;height: 225px;"></picture><strong style="font-size: 20px;text-align: center;color: rgb(8,9,9);"><%=book.get(count).get("book_name")%><button class="btn btn-sm" type="button" style="font-size: 12px;margin-left: 5px;background: rgb(255,255,255);border-width: 2px;border-color: rgb(40,167,69);color: rgb(40,167,69);">대여중</button></strong>
                        <strong
                                style="font-size: 16px;text-align: center;color: rgb(40,167,69);"><%=book.get(count).get("customer_address")%> <strong style="font-size:15px;color:black"><%=book.get(count).get("distance")%></strong></strong>
                    </a>
                </div>
                <%}%>
            <%count++;%>
        <%} %>
    </div>
    <% } %>
    <div class="row">
    <%if(book.size()%3==2){%>
    <%if(book.get(count).get("customer_book_type").toString().equals("대여가능")){%>
    <div class="col" style="padding-right: 5px;padding-left: 5px;">
        <a href="/book/<%=book.get(count).get("customer_book_seq")%>" style="text-decoration:none;">
            <picture><img src="<%=book.get(count).get("book_img")%>"style="width: 152px;height: 225px;"></picture><strong style="font-size: 20px;text-align: center;color: rgb(8,9,9);"><%=book.get(count).get("book_name")%><button class="btn btn-sm" type="button" style="font-size: 12px;margin-left: 5px;">대여가능</button></strong>
            <strong
                    style="font-size: 16px;text-align: center;color: rgb(40,167,69);"><%=book.get(count).get("customer_address")%> <strong style="font-size:15px;color:black"><%=book.get(count).get("distance")%></strong></strong>
        </a>
    </div>
    <%}%>
    <%if(book.get(count).get("customer_book_type").toString().equals("예약중")){%>
    <div class="col" style="padding-right: 5px;padding-left: 5px;">
        <a href="/book/<%=book.get(count).get("customer_book_seq")%>" style="text-decoration:none;">
            <picture><img src="<%=book.get(count).get("book_img")%>" style="width: 152px;height: 225px;"></picture><strong style="font-size: 20px;text-align: center;color: rgb(8,9,9);"><%=book.get(count).get("book_name")%><button class="btn btn-sm" type="button" style="font-size: 12px;margin-left: 5px;background: rgb(255,255,255);border-width: 2px;border-color: rgb(40,167,69);color: rgb(40,167,69);">대여중</button></strong>
            <strong
                    style="font-size: 16px;text-align: center;color: rgb(40,167,69);"><%=book.get(count).get("customer_address")%> <strong style="font-size:15px;color:black"><%=book.get(count).get("distance")%></strong></strong>
        </a>
    </div>
    <%}%>
    <%count++;%>
    <%if(book.get(count).get("customer_book_type").toString().equals("대여가능")){%>
    <div class="col" style="padding-right: 5px;padding-left: 5px;">
        <a href="/book/<%=book.get(count).get("customer_book_seq")%>" style="text-decoration:none;">
            <picture><img src="<%=book.get(count).get("book_img")%>"style="width: 152px;height: 225px;"></picture><strong style="font-size: 20px;text-align: center;color: rgb(8,9,9);"><%=book.get(count).get("book_name")%><button class="btn btn-sm" type="button" style="font-size: 12px;margin-left: 5px;">대여가능</button></strong>
            <strong
                    style="font-size: 16px;text-align: center;color: rgb(40,167,69);"><%=book.get(count).get("customer_address")%> <strong style="font-size:15px;color:black"><%=book.get(count).get("distance")%></strong></strong>
        </a>
    </div>
    <%}%>
    <%if(book.get(count).get("customer_book_type").toString().equals("예약중")){%>
    <div class="col" style="padding-right: 5px;padding-left: 5px;">
        <a href="/book/<%=book.get(count).get("customer_book_seq")%>" style="text-decoration:none;">
            <picture><img src="<%=book.get(count).get("book_img")%>" style="width: 152px;height: 225px;"></picture><strong style="font-size: 20px;text-align: center;color: rgb(8,9,9);"><%=book.get(count).get("book_name")%><button class="btn btn-sm" type="button" style="font-size: 12px;margin-left: 5px;background: rgb(255,255,255);border-width: 2px;border-color: rgb(40,167,69);color: rgb(40,167,69);">대여중</button></strong>
            <strong
                    style="font-size: 16px;text-align: center;color: rgb(40,167,69);"><%=book.get(count).get("customer_address")%> <strong style="font-size:15px;color:black"><%=book.get(count).get("distance")%></strong></strong>
        </a>
    </div>
    <%}%>
    <div class="col"></div>
    <%}%>
    <%if(book.size()%3==1){%>
    <%if(book.get(count).get("customer_book_type").toString().equals("대여가능")){%>
    <div class="col" style="padding-right: 5px;padding-left: 5px;">
        <a href="/book/<%=book.get(count).get("customer_book_seq")%>" style="text-decoration:none;">
            <picture><img src="<%=book.get(count).get("book_img")%>"style="width: 152px;height: 225px;"></picture><strong style="font-size: 20px;text-align: center;color: rgb(8,9,9);"><%=book.get(count).get("book_name")%><button class="btn btn-sm" type="button" style="font-size: 12px;margin-left: 5px;">대여가능</button></strong>
            <strong
                    style="font-size: 16px;text-align: center;color: rgb(40,167,69);"><%=book.get(count).get("customer_address")%> <strong style="font-size:15px;color:black"><%=book.get(count).get("distance")%></strong></strong>
        </a>
    </div>
    <%}%>
    <%if(book.get(count).get("customer_book_type").toString().equals("예약중")){%>
    <div class="col" style="padding-right: 5px;padding-left: 5px;">
        <a href="/book/<%=book.get(count).get("customer_book_seq")%>" style="text-decoration:none;">
            <picture><img src="<%=book.get(count).get("book_img")%>" style="width: 152px;height: 225px;"></picture><strong style="font-size: 20px;text-align: center;color: rgb(8,9,9);"><%=book.get(count).get("book_name")%><button class="btn btn-sm" type="button" style="font-size: 12px;margin-left: 5px;background: rgb(255,255,255);border-width: 2px;border-color: rgb(40,167,69);color: rgb(40,167,69);">대여중</button></strong>
            <strong
                    style="font-size: 16px;text-align: center;color: rgb(40,167,69);"><%=book.get(count).get("customer_address")%> <strong style="font-size:15px;color:black"><%=book.get(count).get("distance")%></strong></strong>
        </a>
    </div>
    <%}%>
    <div class="col">&nbsp;</div>
    <div class="col">&nbsp;</div>
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