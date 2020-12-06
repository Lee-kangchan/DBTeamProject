<%@ page language="java" contentType="text/html; charset=utf-8" %>
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
<div id="navigation-block">
    <nav class="navbar navbar-light navbar-expand-md d-flex" style="border-bottom-style: solid;border-bottom-color: rgb(40,167,69);">
        <div class="container-fluid"><a class="navbar-brand" style="font-family: Bungee, cursive;padding-left: 20px;font-size: 31px;" href="MAIN.html">Local libarary</a>
            <div class="collapse navbar-collapse d-flex" id="navcol-1">
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link active" href="#" style="font-size: 19px;font-family: 'Roboto Condensed', sans-serif;">관리자 님</a></li>
                    <li class="nav-item"></li>
                    <li class="nav-item"><a class="nav-link active" href="#" style="font-size: 19px;font-family: 'Roboto Condensed', sans-serif;">로그아웃</a></li>
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
    }




    .main-container .main-wrap header .logo-wrap{
        display:flex;
        flex-direction: column;
        align-items: center;

    }
    .login-input-section-wrap{
        padding-top: 60px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .login-input-wrap{
        width: 465px;
        height :48px;
        border: solid 1px var(	--border-gray-color );
        background: white;
    }
    .password-wrap{
        margin-top: 13px;
    }
    .login-input-wrap input{
        border: none;
        width:430px;
        margin-top: 10px;
        font-size: 14px;
        margin-left: 10px;
        height:30px;
    }
    .login-button-wrap {
        padding-top: 13px;
    }
    .login-button-wrap button{
        width: 465px;
        height :48px;
        font-size: 18px;
        background: var(--naver-green-color);
        color: white;
        border: solid 1px var(--naver-green-border-color);
        border-radius: 15px;
        margin-bottom: 50px;
        outline: none;

    }

    input {
        outline: none;
    }

    a { text-decoration:none }

</style>





<form method="post" action="/login">
    <div class="main-container" style="font-family: 'Do Hyeon', sans-serif;height: 100%; width: 40%; border:2px solid var(--naver-green-border-color); border-radius: 15px;">
        <div class="main-wrap" >
            <header>

                <div class="logo-wrap" >
                    <h2 style="font-family: 'Do Hyeon', sans-serif;">로그인</h2>
                </div>
            </header>
        </div>
        <section class="login-input-section-wrap">
            <div class="login-input-wrap" style="border-radius: 15px; ">
                <input placeholder="아이디" type="text" name="customer_id"></input>
            </div>
            <div class="login-input-wrap password-wrap" style="border-radius: 15px;">
                <input placeholder="비밀번호" type="password" name="customer_pw"></input>
            </div>
            <div class="login-button-wrap">
                <button type="submit" value="로그인">로그인</button>
            </div>

        </section>
        <div class="side">
            <a href="signup" style="padding : 0 30px 0; color: rgb(38,166,67);">회원가입</a>
        </div>
    </div>
</form>

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