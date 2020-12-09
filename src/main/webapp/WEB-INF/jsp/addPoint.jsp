<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<% Integer sess = (Integer)request.getAttribute("sess"); %>
<% HashMap<String, Object> customerInfo = (HashMap<String, Object>)request.getAttribute("customerInfo"); %>
<% List<HashMap<String, Object>> cardInfo = (List<HashMap<String, Object>>)request.getAttribute("cardInfo"); %>

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
<style type="text/css">
    :root{
        --body-background-color: white;
        --font-color: #4e4e4e;
        --border-gray-color : #dadada;
        --naver-green-color: rgb(38,166,67);
        --naver-green-border-color: rgb(38,166,67);
    }


    *{
        margin:0;
        padding:0;
    }

    .main-container{
        width:100%;
        display:flex;
        flex-direction:column;
        align-items:center;
        margin-top: 150px;
        margin: 0 auto;
        padding-bottom: 100px;

    }
    .main-container .main-wrap{
        width:768px;

    }

    .main-container .main-wrap .logo-wrap{
        padding-top:55px;
        color:rgb(38,166,67);
        padding-bottom: 60px;
    }


    .main-container .main-wrap header .sel-lang-wrap{
        display:flex;
        justify-content:flex-end;
    }

    .main-container .main-wrap header .logo-wrap{
        display:flex;
        flex-direction: column;
        align-items: center;

    }


    .addPoint-input-wrap{
        width: 465px;
        height :48px;
        border: solid 1px var(	--border-gray-color );
        background: white;
    }
    .addPoint-select-wrap{
        width: 465px;
        height :48px;
        border: solid 1px var(	--border-gray-color );
        background: white;
    }
    .card-wrap{
        margin-top: 13px;
        margin-bottom: 13px;
    }

    .pw-wrap{
        width: 465px;
        height :48px;
        border: solid 1px var(	--border-gray-color );
        background: white;
    }

    .addPoint-input-wrap input{
        border: none;
        width:430px;
        margin-top: 10px;
        font-size: 14px;
        margin-left: 10px;
        height:30px;
    }
    .addPoint-select-wrap select{
        border: none;
        width:430px;
        margin-top: 10px;
        font-size: 14px;
        margin-left: 10px;
        height:30px;
    }
    .addPoint-button-wrap {
        padding-top: 13px;
    }
    .addPoint-button-wrap button{
        width: 465px;
        height :48px;
        font-size: 18px;
        background: var(--naver-green-color);
        color: white;
        border: solid 1px var(--naver-green-border-color);
        border-radius: 15px;
        margin-bottom: 50px;
        margin-top: 20px;

    }

    </style>

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
    <div class="container" style="font-family: 'Do Hyeon', sans-serif;">
        <div class="col" style="border: 4px solid rgb(40,167,69);width: 700px;margin-left: 200px;margin-top: 20px;font-family: 'Do Hyeon', sans-serif;">
            <div class="row">
                <div class="col" style="padding: 13px;"><small style="font-size: 12px;margin-top: 3px;margin-left: 10px;">나의 대출등급</small><strong style="font-size: 20px;"><%=customerInfo.get("rental_membership_name")%></strong></div>
                <div class="col" style="padding: 13px;"><small style="font-size: 12px;margin-top: 3px;margin-left: 10px;">대출 중인 도서</small><strong style="font-size: 20px;"><%=customerInfo.get("rentalCount")%></strong></div>
                <div class="col" style="padding: 13px;"><small style="font-size: 12px;margin-top: 3px;margin-left: 10px;">나의 대여등급</small><strong style="font-size: 20px;"><%=customerInfo.get("borrow_membership_name")%></strong></div>
                <div class="col" style="padding: 13px;"><small style="font-size: 12px;margin-top: 3px;margin-left: 10px;">&nbsp;대여중인 도서</small><strong style="font-size: 20px;"><%=customerInfo.get("borrowCount")%></strong></div>
                <div class="col" style="padding: 13px;"><small style="font-size: 12px;margin-top: 3px;margin-left: 12px;">나의 포인트</small><strong style="font-size: 20px;"><%=customerInfo.get("customer_point")%>p</strong></div>
                <div class="col" style="padding: 13px;"><small style="font-size: 12px;margin-top: 3px;margin-left: 10px;">나의 추천인수</small><strong style="font-size: 20px;"><%=customerInfo.get("recommendCount")%></strong></div>
            </div>
        </div>
        <div class="row" style="padding-top: 40px;font-family: 'Do Hyeon', sans-serif;">
            <div class="col" style="padding-right: 15px;width: 300px;max-width: 300px;">
                <a href="/myPage" style="text-decoration:none; color:#212529"><div class="row" style="width: 250px;margin-left: -7px;">
                    <div class="col" style="margin: 10px;width: 250px;margin-left: -7px;"><strong style="width: 250px;margin-left: -7px;">대여/대출 목록</strong></div>
                </div></a>
                <a href="/updateUser" style="text-decoration:none; color:#212529"><div class="row" style="width: 250px;margin-left: -7px;">
                    <div class="col" style="margin: 10px;width: 250px;margin-left: -7px;"><strong style="width: 250px;margin-left: -7px;">회원 정보 수정</strong></div>
                </div></a>
                <a href="/myReserve" style="text-decoration:none; color:#212529"><div class="row" style="width: 250px;margin-left: -7px;">
                    <div class="col" style="margin: 10px;width: 250px;margin-left: -7px;"><strong style="width: 250px;margin-left: -7px;">예약 목록</strong></div>
                </div></a>
                <a href="/addPoint" style="text-decoration:none; color:#212529"><div class="row" style="width: 250px;margin-left: -7px; border-style: solid;border-color: rgb(40,167,69);">
                    <div class="col" style="margin: 10px;width: 250px;margin-left: -7px;"><strong style="width: 250px;margin-left: -7px;">포인트 충전</strong></div>
                </div></a>
                <a href="/myPoint" style="text-decoration:none; color:#212529"><div class="row" style="width: 250px;margin-left: -7px;">
                    <div class="col" style="margin: 10px;width: 250px;margin-left: -7px;"><strong style="width: 250px;margin-left: -7px;">결재 내역</strong></div>
                </div></a>
                <a href="/myCard" style="text-decoration:none; color:#212529"><div class="row" style="width: 250px;margin-left: -7px;">
                    <div class="col" style="margin: 10px;width: 250px;margin-left: -7px;"><strong style="width: 250px;margin-left: -7px;">나의 카드</strong></div>
                </div></a>
                <a href="/myReview" style="text-decoration:none; color:#212529"><div class="row" style="width: 250px;margin-left: -7px;">
                    <div class="col" style="margin: 10px;width: 250px;margin-left: -7px;"><strong style="width: 250px;margin-left: -7px;">나의 리뷰</strong></div>
                </div></a>
                <a href="/myReport" style="text-decoration:none; color:#212529"><div class="row" style="width: 250px;margin-left: -7px;">
                    <div class="col" style="margin: 10px;width: 250px;margin-left: -7px;"><strong style="width: 250px;margin-left: -7px;">신고 목록</strong></div>
                </div></a>
            </div>
            <div class="col" style="display:flex; flex-direction:column; justify-content:center;border-style: solid;border-color: rgb(40,167,69);">
                <section>
                    <strong><h2 style="font-family: 'Do Hyeon', sans-serif;">포인트 충전</h2></strong>
                </section>

            <!--여기를 고치면 됨 -->
            <div style="display:flex; flex-direction:column; justify-content:center; margin:0 auto">
                <form method="post" action="/addPoint">
                    <div class="addPoint-input-wrap" style="border-radius: 15px;font-family: 'Do Hyeon', sans-serif; ">
                        <input placeholder="충전할 포인트 금액" type="text" name="customer_point" ></input>
                    </div>

                    <div class="addPoint-select-wrap card-wrap" style="border-radius: 15px;font-family: 'Do Hyeon', sans-serif;">
                        <select name="card_num" id="" >
                        <% for(int i = 0; i < cardInfo.size(); i++) { %>
                            <option value='<%= cardInfo.get(i).get("card_num")%>'><%=cardInfo.get(i).get("card_type")%></option>
                        <% } %>
                        </select>
                    </div>
                    <div class="addPoint-input-wrap pw-wrap" style="border-radius: 15px;font-family: 'Do Hyeon', sans-serif;">
                        <input placeholder="결제 비밀번호" type="text" name="card_pw"></input>

                    <div class="addPoint-button-wrap">
                        <button type="submit" value="충전하기" style="font-family: 'Do Hyeon', sans-serif;">충전하기</button>
                    </div>

                </form>
            </div>
        </div>
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