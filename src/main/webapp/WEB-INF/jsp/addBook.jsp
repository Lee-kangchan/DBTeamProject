<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<% Integer sess = (Integer)request.getAttribute("sess"); %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>도서 등록</title>
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
    <link rel = "preconnect"href = "https://fonts.gstatic.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
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
    
    
        .main-container .main-wrap header .sel-lang-wrap{
            display:flex;
            justify-content:flex-end;
        }
    
        .main-container .main-wrap header .logo-wrap{
            display:flex;	
            flex-direction: column;
            align-items: center;
            
        }
        .addBook-input-section-wrap{
            padding-top: 60px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        input[type="radio"] {
            margin-top: -1px;
            vertical-align: middle;
            margin-left: 8px;
        }
        .addBook-input-wrap{
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
        .bookimage-wrap{
            width: 465px;
            height :48px;
            border: solid 1px var(	--border-gray-color );
            background: white;
        }
        .comment-wrap{
            margin-top: 13px;
            margin-bottom: 13px;
        }
        
        .addBook-input-wrap input{
            border: none;
            width:430px;
            margin-top: 10px;
            font-size: 14px;
            margin-left: 10px;
            height:30px;
        }
        .addBook-button-wrap {
            padding-top: 13px;
        }
        .addBook-button-wrap button{
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
    
    <form method="post" action="/addBook">
        <div class="main-container" style=" margin-bottom:20px;width: 700px; border:2px solid var(--naver-green-border-color); border-radius: 15px;" >
            <div class="main-wrap" >
            <header>
               
                <div class="logo-wrap" >
                    <strong><h2 style="font-family: Bungee, cursive;">Local Library</h2></strong>
                </div>
            </header>
            </div>
            <section class="addBook-input-section-wrap">

                <div class="addBook-input-wrap" style="border-radius: 15px; font-family: 'Do Hyeon', sans-serif; ">	
                    <input placeholder="도서명" type="text" name="book_name" id="book_name"></input>
                </div>
                <div class="addBook-input-wrap author-wrap" style="border-radius: 15px;font-family: 'Do Hyeon', sans-serif;">	
                    <input placeholder="작가" type="password" name="book_author"></input>
                </div>
                <div class="addBook-input-wrap publisher-wrap" style="border-radius: 15px;font-family: 'Do Hyeon', sans-serif;">	
                    <input placeholder="출판사" type="text" name="book_publisher"></input>
                </div>
                <div class="addBook-input-wrap publishyear-wrap" style="border-radius: 15px;font-family: 'Do Hyeon', sans-serif;">	
                    <input placeholder="출판연도" type="text" name="book_year"></input>
                </div>
                <div class="addBook-input-wrap deposit-wrap" style="border-radius: 15px;font-family: 'Do Hyeon', sans-serif;">	
                    <input placeholder="예치금" type="text" name="customer_book_deposit"></input>
                </div>
                <div class="addBook-input-wrap comment-wrap" style="border-radius: 15px;font-family: 'Do Hyeon', sans-serif;">	
                    <input placeholder="코멘트" type="text" name="customer_book_comment">
                </div>

                <label  style="font-weight: bold; text-align: left ; width:100%">장르</label>
                <div class=" " style="font-family: 'Do Hyeon', sans-serif;">

                    <input type="radio" name="category_seq" value="1">수필
                    <input type="radio" name="category_seq" value="2">소설
                    <input type="radio" name="category_seq" value="3">시
                    <input type="radio" name="category_seq" value="4">유아
                    <input type="radio" name="category_seq" value="5">여행
                    <input type="radio" name="category_seq" value="6">역사
                    <input type="radio" name="category_seq" value="7">과학
                    <input type="radio" name="category_seq" value="8">고전
                    <input type="radio" name="category_seq" value="9">외국어
                </div>
                <label  style="margin-top: 10px ;font-weight: bold; text-align: left ; width:100%">책 이미지</label>
                <div class="addBook-input-wrap bookimage-wrap" style="border-radius: 15px;font-family: 'Do Hyeon', sans-serif;">
                    <input type="file" placeholder="도서 이미지" name="book_image" accept="image/*" >
                </div>
                <br>
                <label style="font-weight: bold; text-align: left ; width:100%">책 실물 사진 <button type="button" id="bookplus" class="btn btn-primary" style=" padding-top:3px;margin-left:10px;padding-bottom: 20px ; font-size: 13px;  height: 25px ">추가 </button></label>
                <div id="customerBook">
                    <div class="addBook-input-wrap bookimage-wrap" id = "bookPicture" style="border-radius: 15px;font-family: 'Do Hyeon', sans-serif;">
                        <input type="file" placeholder="도서 이미지" name="customer_book_img" accept="image/*" >
                    </div>
                </div>

                <div class="addBook-button-wrap">
                    <button type="submit" style="font-family: 'Do Hyeon', sans-serif;">도서 등록</button>
                </div>
                <div id="customerBook2" style="visibility: hidden">
                    <div class="addBook-input-wrap bookimage-wrap" id = "bookPicture2" style="border-radius: 15px;margin-top:10px;font-family: 'Do Hyeon', sans-serif;">
                        <input type="file" placeholder="도서 이미지" name="customer_book_img" accept="image/*" >
                    </div>
                </div>
            </section>
            
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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script>
      $(document).ready(function(){
            $("#bookplus").click(function(){
                var picture = $("#customerBook2").html();
                $("#customerBook").append(picture)
            })
        });
    </script>
</body>

</html>