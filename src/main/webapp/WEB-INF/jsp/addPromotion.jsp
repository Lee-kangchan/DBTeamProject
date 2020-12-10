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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/css/swiper.min.css">
    <link rel="stylesheet" href="/static/assets/css/Media-Slider-Bootstrap-3-1.css">
    <link rel="stylesheet" href="/static/assets/css/Media-Slider-Bootstrap-3.css">
    <link rel="stylesheet" href="/static/assets/css/Simple-Slider.css">
    <link rel="stylesheet" href="/static/assets/css/styles.css">
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
<style type="text/css">
    :root{
        --body-background-color: white;
        --font-color: #4e4e4e;
        --border-gray-color : #dadada;
        --naver-green-color: #04c75a;
        --naver-green-border-color: #06b350;
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
        color:green;
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
    .container{
        padding-top: 60px;
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-top: 50px;
    }

    .addPromotion-input-wrap{
        width: 465px;
        height :48px;
        border: solid 1px var(	--border-gray-color );
        background: white;
    }
    .author-wrap{
        margin-top: 13px;
        margin-bottom: 13px;
    }

    .publisher-wrap{
        width: 465px;
        height :48px;
        border: solid 1px var(	--border-gray-color );
        background: white;
    }
    .publishyear-wrap{
        margin-top: 13px;
        margin-bottom: 13px;
    }
    .category-wrap{
        width: 465px;
        height :48px;
        border: solid 1px var(	--border-gray-color );
        background: white;
    }
    .deposit-wrap{
        margin-top: 13px;
        margin-bottom: 13px;
    }
    .promotionimage-wrap{
        width: 465px;
        height :48px;
        border: solid 1px var(	--border-gray-color );
        background: white;
    }
    .comment-wrap{
        margin-top: 13px;
        margin-bottom: 13px;
    }

    .addPromotion-input-wrap input{
        border: none;
        width:430px;
        margin-top: 10px;
        font-size: 14px;
        margin-left: 10px;
        height:30px;
    }
    .addPromotion-button-wrap {
        padding-top: 13px;
    }
    .addPromotion-button-wrap button{
        width: 465px;
        height :48px;
        font-size: 18px;
        background: var(--naver-green-color);
        color: white;
        border: solid 1px var(--naver-green-border-color);
        border-radius: 15px;
        margin-bottom: 50px;

    }

</style>

<form method="post" action="/addPromotion">
    <div class="main-container" style="height: 100%; width: 40%; border:2px solid var(--naver-green-border-color); border-radius: 15px;margin-top: 50px;">
        <div class="main-wrap" >
            <header>

                <div class="logo-wrap" >
                    <strong><h1 style="font-family: 'Roboto Condensed', sans-serif;">프로모션 등록</h1></strong>
                </div>
            </header>
        </div>
        <div class="container" >



            <div class="addPromotion-input-wrap" style="border-radius: 15px; ">
                <input placeholder="프로모션 제목" type="text" name="promotion_name" id="promotion_name"></input>
            </div>
            <div class="addPromotion-input-wrap promotionimage-wrap" style="border-radius: 15px;">
                <input type="file" placeholder="프로모션 포스터" name="promotion_board_image" accept="image/*" ></input>
            </div>
            <div class="addPromotion-input-wrap author-wrap" style="border-radius: 15px;">
                <input placeholder="프로모션 시작일" type="password" name="promotion_startAt"></input>
            </div>
            <div class="addPromotion-input-wrap publisher-wrap" style="border-radius: 15px;">
                <input placeholder="프로모션 마감일" type="text" name="promotion_endAt"></input>
            </div>

            <div class="addPromotion-button-wrap">
                <button type="submit">프로모션 등록</button>
            </div>

        </div>

    </div>

</form>

    <script src="/static/assets/js/jquery.min.js"></script>
    <script src="/static/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="/static/assets/js/bs-init.js"></script>
    <script src="/static/assets/js/--mp---Multiple-items-slider-responsive-1.js"></script>
    <script src="/static/assets/js/--mp---Multiple-items-slider-responsive.js"></script>
    <script src="/static/assets/js/Grid-and-List-view-V10.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/js/swiper.jquery.min.js"></script>
    <script src="/static/assets/js/Media-Slider-Bootstrap-3.js"></script>
    <script src="/static/assets/js/Simple-Slider.js"></script>
</body>

</html>