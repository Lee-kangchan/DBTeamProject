<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<% Integer sess = (Integer)request.getAttribute("sess"); %>
<% Integer book_isbn = (Integer)request.getAttribute("book_isbn");%>

<!DOCTYPE html>
 
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>리뷰등록</title>
    <link rel="stylesheet" href="/static/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Bungee">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do Hyeon:400,600,800">
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

<body style="font-family: 'Do Hyeon', sans-serif;">
    <div id="navigation-block" class="container ">
        <nav class="navbar navbar-light navbar-expand-md d-flex">
            <div class="container-fluid"><a class="navbar-brand" style="font-family: Bungee, cursive;padding-left: 20px;font-size: 31px;" href="MAIN.html">Local libarary</a><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
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
       
    
        .addReview-input-wrap{
            width: 465px;
            height :48px;
            border: solid 1px var(	--border-gray-color );
            background: white;
        }
        .addReview-select-wrap{
            width: 465px;
            height :48px;
            border: solid 1px var(	--border-gray-color );
            background: white;
        }
        .score-wrap{
            margin-top: 13px;
            margin-bottom: 13px;
        }
    
        .content-wrap textarea{
            width: 465px;
            height :100px;
            border: solid 1px var(	--border-gray-color );
            background: white;
        }
        
        .addReview-input-wrap input{
            border: none;
            width:430px;
            margin-top: 10px;
            font-size: 14px;
            margin-left: 10px;
            height:30px;
        }
        .addReview-select-wrap select{
            border: none;
            width:430px;
            margin-top: 10px;
            font-size: 14px;
            margin-left: 10px;
            height:30px;
        }
        .addReview-button-wrap {
            padding-top: 13px;
        }
        .addReview-button-wrap button{
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
    
    <form method="post" action="/addReview/<%=book_isbn%>">
        <div class="main-container" style="font-family: Do Hyeon, sans-serif;height: 100%; width: 40%; border:2px solid var(--naver-green-border-color); border-radius: 15px;">
            <div class="main-wrap" >
            <header style="font-family: 'Do Hyeon', sans-serif;">
               
                <div class="logo-wrap" >
                    <strong><h1 style="font-family: 'Do Hyeon', sans-serif;">리뷰 등록</h1></strong>
                </div>
            </header>
            </div>
            
                

                
                <div class="addReview-input-wrap" style="border-radius: 15px; ">	
                    <input placeholder="리뷰 제목" type="text" name="review_title" ></input>
                </div>
                
                <div class="addReview-select-wrap score-wrap" style="border-radius: 15px;" style="font-family: 'Do Hyeon', sans-serif;">
                    <select name="review_score" aria-placeholder="평점" style="font-family: 'Do Hyeon', sans-serif;" >
                        <option value="" disabled selected hidden>평점</option>
                        <option value="1" >1</option>
                        <option value="2" >2</option>
                        <option value="3" >3</option>
                        <option value="4" >4</option>
                        <option value="5" >5</option>
                    </select>
                </div>
                <div class="addReview-wrap content-wrap" style="border-radius: 15px;">	
                    <textarea placeholder="리뷰내용을 입력해주세요." name="review_detail" cols="300" rows="10"></textarea>
                <div class="addReview-button-wrap">
                    <button type="submit" value="리뷰등록">등록하기</button>
                </div>
                
           
            
        </div>
        
    </form>
 
</body>
</html>