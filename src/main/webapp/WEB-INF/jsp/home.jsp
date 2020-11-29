<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>book</title>
    <link rel="stylesheet" href="../static/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Bungee">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:400,600,800">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700">
    <link rel="stylesheet" href="../static/assets/css/--mp---Multiple-items-slider-responsive.css">
    <link rel="stylesheet" href="../static/assets/css/Comment.css">
    <link rel="stylesheet" href="../static/assets/css/Footer-Clean.css">
    <link rel="stylesheet" href="../static/assets/css/Grid-and-List-view-V10-1.css">
    <link rel="stylesheet" href="../static/assets/css/Grid-and-List-view-V10.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/css/swiper.min.css">
    <link rel="stylesheet" href="../static/assets/css/Media-Slider-Bootstrap-3-1.css">
    <link rel="stylesheet" href="../static/assets/css/Media-Slider-Bootstrap-3.css">
    <link rel="stylesheet" href="../static/assets/css/Simple-Slider.css">
    <link rel="stylesheet" href="../static/assets/css/styles.css">
</head>

<body>
    <div class="container">
    <div id="navigation-block">
        <nav class="navbar navbar-light navbar-expand-md d-flex">
            <div class="container-fluid"><a class="navbar-brand" style="font-family: Bungee, cursive;padding-left: 20px;font-size: 28px;" href="#">Local libarary</a><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                <ul
                    class="nav navbar-nav"></ul>
                    <div class="collapse navbar-collapse d-flex" id="navcol-1">
                        <form class="form-inline d-flex" style="margin: 0 auto;"><input class="form-control d-flex ml-auto" type="search" placeholder="검색할 내용을 입력해주세요" name="SEARCH" style="padding: 5px;margin: 17px;width: 415px;padding-left: 0px;"></form>
                        <ul class="nav navbar-nav ml-auto">
                            <li class="nav-item"><a class="nav-link active" href="#" style="font-size: 19px;">MY PAGE</a></li>
                            <li class="nav-item"><a class="nav-link" href="#" style="font-size: 19px;">LOGOUT</a></li>
                        </ul>
                    </div>
            </div>
        </nav>
        <div>
            <nav class="navbar navbar-light navbar-expand-md d-flex">
                <div class="container-fluid"><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-2"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse text-center d-flex" id="navcol-2"
                        style="margin: 0 auto;">
                        <form class="form-inline" style="margin: 0 auto;">
                            <ul class="nav navbar-nav">
                                <li class="nav-item"><a class="nav-link active d-flex" data-bs-hover-animate="bounce" href="#" style="padding-left: 4px;padding-right: 12px;font-size: 20px;margin: 0 auto;">우리동네 도서</a></li>
                                <li class="nav-item"><a class="nav-link d-flex" data-bs-hover-animate="bounce" href="#" style="padding-left: 8px;padding-right: 8px;font-size: 20px;margin: 0 aitp;">나의 도서 현황</a></li>
                                <li class="nav-item"><a class="nav-link d-flex" data-bs-hover-animate="bounce" href="#" style="font-size: 20px;padding-right: 4px;padding-left: 12px;">도서별 리뷰 보기</a></li>
                            </ul>
                        </form>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <div class="simple-slider">
        <div class="swiper-container">
            <div class="swiper-wrapper" style="height: 420px;">
                <div class="d-flex swiper-slide" style="background-image: url(https://placeholdit.imgix.net/~text?txtsize=68&amp;txt=Slideshow+Image&amp;w=1920&amp;h=500);background-size: cover;height: 400px;"><img src="../static/assets/img/promotion2.jpg" style="height: 400px;margin: 0 auto;"></div>
                <div class="swiper-slide" style="background-image: url(https://placeholdit.imgix.net/~text?txtsize=68&amp;txt=Slideshow+Image&amp;w=1920&amp;h=500);background-size: cover;height: 400px;"><img class="d-flex" src="../static/assets/img/promotion1.jpg" style="width: 977px;margin: 0 auto;height: 400px;"></div>
                <div class="swiper-slide" style="background-image: url(https://placeholdit.imgix.net/~text?txtsize=68&amp;txt=Slideshow+Image&amp;w=1920&amp;h=500);background-size: cover;height: 400px;"><img class="d-flex" src="../static/assets/img/promotion3.jpg" style="margin: 0 auto;height: 400px;"></div>
            </div>
            <div class="swiper-pagination"></div>
            <form>
                <h1 style="font-family: Nunito, sans-serif;color: rgb(40,167,69);font-size: 26px;padding: 20px;">오늘 등록된 도서</h1>
                <section style="margin-top: 20px;">
                    <div class="d-flex flex-row multiple-item-slider">
                        <div class="justify-content-center spacer-slider">
                            <figure class="figure">
                                <div class="swiper-button-prev"></div><img class="img-fluid figure-img" src="https://picsum.photos/1080/1335?image=0" alt="alt text here">
                                <figcaption class="figure-caption">Caption</figcaption>
                            </figure>
                        </div>
                        <div class="justify-content-center spacer-slider">
                            <figure class="figure"><img class="img-fluid figure-img mx-auto d-block" src="https://picsum.photos/1080/1335?image=1083" alt="alt text here">
                                <figcaption class="figure-caption">Caption</figcaption>
                            </figure>
                        </div>
                        <div class="justify-content-center spacer-slider">
                            <figure class="figure"><img class="img-fluid figure-img" src="https://picsum.photos/1080/1335?image=1076" alt="alt text here">
                                <figcaption class="figure-caption">Caption</figcaption>
                            </figure>
                        </div>
                        <div class="justify-content-center spacer-slider">
                            <figure class="figure"><img class="img-fluid figure-img" src="https://picsum.photos/1080/1335?image=1075" alt="alt text here">
                                <figcaption class="figure-caption">Caption</figcaption>
                            </figure>
                        </div>
                        <div class="justify-content-center spacer-slider">
                            <figure class="figure"><img class="img-fluid figure-img" src="https://picsum.photos/1080/1335?image=1074" alt="alt text here">
                                <figcaption class="figure-caption">Caption</figcaption>
                            </figure>
                        </div>
                        <div class="justify-content-center spacer-slider">
                            <figure class="figure"><img class="img-fluid figure-img" src="https://picsum.photos/1080/1335?image=1071" alt="alt text here">
                                <figcaption class="figure-caption">Caption</figcaption>
                            </figure>
                        </div>
                        <div class="justify-content-center spacer-slider">
                            <figure class="figure"><img class="img-fluid figure-img" src="https://picsum.photos/1080/1335?image=1060" alt="alt text here">
                                <figcaption class="figure-caption">Caption</figcaption>
                            </figure>
                        </div>
                        <div class="justify-content-center spacer-slider">
                            <figure class="figure">
                                <div class="swiper-button-next"></div><img class="img-fluid figure-img d-flex" src="https://picsum.photos/1080/1335?image=1045" alt="alt text here">
                                <figcaption class="figure-caption">Caption</figcaption>
                            </figure>
                        </div>
                    </div>
                </section>
            </form>
            <h1 style="font-family: Nunito, sans-serif;color: rgb(68,178,93);font-size: 26px;padding: 20px;">오늘 등록된 리뷰</h1>
            <div class="card-group">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Title</h4>
                        <p class="card-text">Nullam id dolor id nibh ultricies vehicula ut id elit. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus.</p><button class="btn btn-link" type="button">Button</button></div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Title</h4>
                        <p class="card-text">Nullam id dolor id nibh ultricies vehicula ut id elit. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus.</p><button class="btn btn-primary" type="button">Button</button></div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Title</h4>
                        <p class="card-text">Nullam id dolor id nibh ultricies vehicula ut id elit. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus.</p><button class="btn btn-primary" type="button">Button</button></div>
                </div>
            </div>
        </div>
    </div>
</div>
    <script src="../static/assets/js/jquery.min.js"></script>
    <script src="../static/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="../static/assets/js/bs-init.js"></script>
    <script src="../static/assets/js/--mp---Multiple-items-slider-responsive-1.js"></script>
    <script src="../static/assets/js/--mp---Multiple-items-slider-responsive.js"></script>
    <script src="../static/assets/js/Grid-and-List-view-V10.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/js/swiper.jquery.min.js"></script>
    <script src="../static/assets/js/Media-Slider-Bootstrap-3.js"></script>
    <script src="../static/assets/js/Simple-Slider.js"></script>
</body>

</html>