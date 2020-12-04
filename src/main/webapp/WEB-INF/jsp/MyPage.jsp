<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<% Integer sess = (Integer)request.getAttribute("sess"); %>
<% HashMap<String, Object> customerInfo = (HashMap<String, Object>)request.getAttribute("customerInfo"); %>

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
                        <form class="form-inline d-flex" style="margin: 0 auto;"><input class="form-control d-flex ml-auto" type="search" placeholder="검색할 내용을 입력해주세요" name="SEARCH" style="padding: 5px;margin: 17px;width: 415px;padding-left: 23px;font-family: 'Do Hyeon', sans-serif;margin-right: 8px;">
                            <i
                                class="fa fa-search" style="width: 20px;height: 20px;font-size: 20px;color: rgb(38,166,67);"></i>
                        </form>
                        <ul class="nav navbar-nav ml-auto">
                            <li class="nav-item"><a class="nav-link active" href="#" style="font-size: 19px;font-family: 'Do Hyeon', sans-serif;">MYPAGE</a></li>
                            <li class="nav-item"><a class="nav-link" href="#" style="font-size: 19px;font-family: 'Do Hyeon', sans-serif;">LOGOUT</a></li>
                            <li class="nav-item"><a class="nav-link active" href="#" style="font-size: 19px;font-family: 'Do Hyeon', sans-serif;">도서등록</a></li>
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
                                <li class="nav-item"><a class="nav-link active d-flex" data-bs-hover-animate="bounce" href="gridBook1.html" style="padding-right: 20px;font-size: 20px;margin: 0 auto;font-family: Do Hyeon, sans-serif;">우리동네 도서</a></li>
                                <li class="nav-item"><a class="nav-link d-flex" data-bs-hover-animate="bounce" href="#" style="padding-left: 20px;padding-right: 20px;font-size: 20px;margin: 0 aitp;font-family: Do Hyeon, sans-serif;">나의 도서 현황</a></li>
                                <li class="nav-item"><a class="nav-link d-flex" data-bs-hover-animate="bounce" href="#" style="font-size: 20px;padding-left: 20px;font-family: Do Hyeon, sans-serif;">도서별 리뷰 보기</a></li>
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
                <a href="/myPage" style="text-decoration:none; color:#212529"><div class="row" style="width: 250px;margin-left: -7px; border-style: solid;border-color: rgb(40,167,69);">
                    <div class="col" style="margin: 10px;width: 250px;margin-left: -7px;"><strong style="width: 250px;margin-left: -7px;">대여/대출 목록</strong></div>
                </div></a>
                <a href="/updateUser" style="text-decoration:none; color:#212529"><div class="row" style="width: 250px;margin-left: -7px;">
                    <div class="col" style="margin: 10px;width: 250px;margin-left: -7px;"><strong style="width: 250px;margin-left: -7px;">회원 정보 수정</strong></div>
                </div></a>
                <a href="/myReserve" style="text-decoration:none; color:#212529"><div class="row" style="width: 250px;margin-left: -7px;">
                    <div class="col" style="margin: 10px;width: 250px;margin-left: -7px;"><strong style="width: 250px;margin-left: -7px;">예약 목록</strong></div>
                </div></a>
                <a href="/addPoint" style="text-decoration:none; color:#212529"><div class="row" style="width: 250px;margin-left: -7px;">
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
            <div class="col" style="width: 70px;border-style: solid;border-color: rgb(40,167,69);">
                <section><strong style="color: rgb(131,135,143);font-size: 20px;font-family: 'Do Hyeon', sans-serif;margin-top: 20px;">나의 대여 등급</strong><strong style="color: rgb(131,135,143);font-size: 35px;margin-top: 4px;font-family: 'Do Hyeon', sans-serif;"><%=customerInfo.get("borrow_membership_name")%></strong>
                    <div class="row" style="border-bottom-style: solid;border-bottom-color: rgb(40,167,69);padding-bottom: 15px;margin-top: 15px;">
                        <div class="col"><strong style="font-family: 'Do Hyeon', sans-serif;font-size: 20px;">도서 사진</strong></div>
                        <div class="col" style="font-family: 'Do Hyeon', sans-serif;font-size: 20px;"><strong style="font-family: 'Do Hyeon', sans-serif;font-size: 20px;">도서명</strong></div>
                        <div class="col" style="font-family: 'Do Hyeon', sans-serif;font-size: 20px;"><strong style="font-family: 'Do Hyeon', sans-serif;font-size: 20px;">대여상태</strong></div>
                        <div class="col" style="font-family: 'Do Hyeon', sans-serif;font-size: 20px;"><strong style="font-family: 'Do Hyeon', sans-serif;font-size: 20px;"></strong></div>
                        <div class="col"><strong>대출날짜</strong></div>
                    </div>
                </section>
                <div class="row" style="border-bottom-style: none;border-bottom-color: rgb(40,167,69);margin-top: 0px;">
                    <div class="col"><a href="#"></a><img style="height: 120px;"></div>
                    <div class="col"><a href="#"><strong class="text-center text-body" style="margin-top: 45px;font-family: 'Do Hyeon', sans-serif;">도서명</strong></a></div>
                    <div class="col" style="font-family: 'Do Hyeon', sans-serif;"><strong class="text-center" style="margin-top: 45px;font-family: 'Do Hyeon', sans-serif;">대여 대기</strong></div>
                    <div class="col" style="font-family: 'Do Hyeon', sans-serif;">
                        <div style="display:flex; flex-direction:column; justify-content:center;"><button class="btn btn-primary btn-sm" type="button" style="margin-top:20px;position:relative;font-family: 'Do Hyeon', sans-serif;height: 35px;">대여확인</button><button class="btn btn-primary btn-sm" type="button" style="position:relative;font-family: 'Do Hyeon', sans-serif;height: 35px;">신고하기</button></div>
                    </div>
                    <div class="col" style="font-family: 'Do Hyeon', sans-serif;"><strong class="text-center" style="margin-top: 40px;font-family: 'Do Hyeon', sans-serif;">2020.00.00<br>~2020.00.00</strong></div>
                </div>

                <section><strong style="color: rgb(131,135,143);font-size: 20px;font-family: 'Do Hyeon', sans-serif;margin-top: 20px;">나의 대출 등급</strong><strong style="color: rgb(131,135,143);font-size: 35px;margin-top: 4px;font-family: 'Do Hyeon', sans-serif;"><%=customerInfo.get("rental_membership_name")%></strong>
                    <div class="row" style="border-bottom-style: solid;border-bottom-color: rgb(40,167,69);padding-bottom: 15px;">
                        <div class="col"><strong style="font-family: 'Do Hyeon', sans-serif;font-size: 20px;">도서 사진</strong></div>
                        <div class="col" style="font-family: 'Do Hyeon', sans-serif;font-size: 20px;"><strong style="font-family: 'Do Hyeon', sans-serif;font-size: 20px;">도서명</strong></div>
                        <div class="col" style="font-family: 'Do Hyeon', sans-serif;font-size: 20px;"><strong style="font-family: 'Do Hyeon', sans-serif;font-size: 20px;">대출상태</strong></div>
                        <div class="col" style="font-family: 'Do Hyeon', sans-serif;font-size: 20px;"><strong style="font-family: 'Do Hyeon', sans-serif;font-size: 20px;"></strong></div>
                        <div class="col"><strong>대출날짜</strong></div>
                    </div>
                </section>


                <div class="row" style="border-bottom-style: none;border-bottom-color: rgb(40,167,69);margin-top: 0px;">
                    <div class="col"><a href="#"></a><img style="height: 120px;"></div>
                    <div class="col"><a href="#"><strong class="text-center text-body" style="margin-top: 45px;font-family: 'Do Hyeon', sans-serif;">도서명</strong></a></div>
                    <div class="col" style="font-family: 'Do Hyeon', sans-serif;"><strong class="text-center" style="margin-top: 45px;font-family: 'Do Hyeon', sans-serif;">대출 대기</strong></div>
                    <div class="col" style="font-family: 'Do Hyeon', sans-serif;">
                        <div><button class="btn btn-primary btn-sm" type="button" style="margin-top: 10px;margin-left: 50px;font-family: 'Do Hyeon', sans-serif;height: 35px;">대출확인</button><button class="btn btn-primary btn-sm" type="button" style="margin-top: 45px;margin-left: 50px;font-family: 'Do Hyeon', sans-serif;height: 35px;">대출연장</button>
                            <button
                                class="btn btn-primary btn-sm" type="button" style="margin-top: 79px;margin-left: 50px;font-family: 'Do Hyeon', sans-serif;height: 35px;">신고하기</button>
                        </div>
                    </div>
                    <div class="col" style="font-family: 'Do Hyeon', sans-serif;"><strong class="text-center" style="margin-top: 40px;font-family: 'Do Hyeon', sans-serif;">2020.00.00<br>~2020.00.00</strong></div>
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