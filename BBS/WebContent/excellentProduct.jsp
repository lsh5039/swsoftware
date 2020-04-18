<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>



<head>

    <meta charset="UTF-8">

    <title>연간 우수작</title>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

    <script>
        $(function() {

            var i = 0;

            var isanimate = false;

            $(window).on("mousewheel DOMMousewheel", function(e) {

                if (isanimate == true) {

                    return;

                }

                isanimate = true;

                var dt = e.originalEvent.wheelDelta;

                if (dt < 0) {

                    i++;

                    if (i > 4) {

                        i = 4;

                        isanimate = false;

                        return;

                    }

                } else {

                    i--;

                    if (i < 0) {

                        i = 0;

                        isanimate = false;

                        retrun;

                    }

                }



                pageSlide();



            });



            $(window).keydown(function(e) {

                if (isanimate == true) {

                    return;

                }

                isanimate = true;

                if (e.keyCode == 40) {

                    i++;

                    if (i > 4) {

                        i = 4;

                        isanimate = false;

                        return;

                    }

                } else if (e.keyCode == 38) {

                    i--;

                    if (i < 0) {

                        i = 0;

                        isanimate = false;

                        retrun;

                    }

                }

                pageSlide();







            });



            $(".pager").click(function() {

                if (isanimate == true) {

                    return;

                }

                isanimate = true;



                i = $(this).index();



                pageSlide();





            });



            function pageSlide() {

                //

                //				$("html, body").stop().animate({

                //					scrollTop: i * $("section").height()

                //				}, 1000, function() {

                //					isanimate = false;

                //				});

                //				$(".pager").removeClass("active");

                //				$(".pager").eq(i).addClass("active");

                //						스크롤이없으면 안된다.

                /////////////////////////////////////////////////////////////////////////



                $("section").stop().animate({

                    top: -i * $("section").height()

                }, 1000, function() {

                    isanimate = false;

                });

                $(".pager").removeClass("active");

                $(".pager").eq(i).addClass("active");

            }





        }) //ready
    </script>

    <style>
        * {

            margin: 0;

            padding: 0;

        }



        main {

            height: 100vh;

            position: relative;

            overflow: hidden;

        }



        section {

            height: 100vh;

            position: relative;

        }



        /*section의 top을 이벤트에따라 0~400vh로 조정하면 된다.*/

        section:nth-child(1) {

            background-color: #fab;

        }



        section:nth-child(2) {

            background-color: #abc;

        }



        section:nth-child(3) {

            background-color: slateblue;

        }



        section:nth-child(4) {

            background-color: #afb;

        }



        section:nth-child(5) {

            background-color: #ddd;

        }



        .pager_area {

            position: fixed;

            right: 20px;

            top: 50%;

            transform: translateY(-50%);

        }



        .pager {

            width: 15px;

            height: 15px;

            border-radius: 5px;

            border: 1px solid #fff;

            margin: 10px 0;

            cursor: pointer;

        }



        .pager.active {

            background-color: #333;

        }

        section h1 {
            text-align: center;
            padding-top: 40px;
            font-size: 50px;
        }

        section .desc {
            width: 1200px;
            margin: 0 auto;
        }

        .desc h2 {
            text-align: center;
            margin: 40px;
        }

        a {
            text-decoration: none;
            color: #333;
            display: inline-block;
            padding: 20px;
            color: #fff;
        }

        .btn {
            position: absolute;
            bottom: 50px;
            right: 50px;
            border: 1px solid #333;
            border-radius: 30px;
            background-color: #333;
        }

        .btn:hover {
            background-color: yellow;
        }

        .btn:hover.btn>a {
            font-weight: bold;
            color: #333;
            letter-spacing: 1px;
        }
    </style>

</head>



<body>

    <main>

        <section>
            <h1>2020 우수작</h1>
            <div class="desc">
                <h2 class="title">준비중입니다.</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste sequi repellat nemo vitae minus expedita est quos, doloribus suscipit repudiandae placeat obcaecati fugit iure cumque fugiat. Totam tenetur fugit harum corporis aperiam dolor, ex qui architecto, fuga dolorem suscipit, odit.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste sequi repellat nemo vitae minus expedita est quos, doloribus suscipit repudiandae placeat obcaecati fugit iure cumque fugiat. Totam tenetur fugit harum corporis aperiam dolor, ex qui architecto, fuga dolorem suscipit, odit.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste sequi repellat nemo vitae minus expedita est quos, doloribus suscipit repudiandae placeat obcaecati fugit iure cumque fugiat. Totam tenetur fugit harum corporis aperiam dolor, ex qui architecto, fuga dolorem suscipit, odit.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste sequi repellat nemo vitae minus expedita est quos, doloribus suscipit repudiandae placeat obcaecati fugit iure cumque fugiat. Totam tenetur fugit harum corporis aperiam dolor, ex qui architecto, fuga dolorem suscipit, odit.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste sequi repellat nemo vitae minus expedita est quos, doloribus suscipit repudiandae placeat obcaecati fugit iure cumque fugiat. Totam tenetur fugit harum corporis aperiam dolor, ex qui architecto, fuga dolorem suscipit, odit.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste sequi repellat nemo vitae minus expedita est quos, doloribus suscipit repudiandae placeat obcaecati fugit iure cumque fugiat. Totam tenetur fugit harum corporis aperiam dolor, ex qui architecto, fuga dolorem suscipit, odit.</p>
            </div>
            <div class="btn">
                <a href="#">바로가기</a>
            </div>
        </section>

        <section>
            <h1>2019 우수작</h1>
            <div class="desc">
                <h2 class="title">운영체제 시스템</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste sequi repellat nemo vitae minus expedita est quos, doloribus suscipit repudiandae placeat obcaecati fugit iure cumque fugiat. Totam tenetur fugit harum corporis aperiam dolor, ex qui architecto, fuga dolorem suscipit, odit.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste sequi repellat nemo vitae minus expedita est quos, doloribus suscipit repudiandae placeat obcaecati fugit iure cumque fugiat. Totam tenetur fugit harum corporis aperiam dolor, ex qui architecto, fuga dolorem suscipit, odit.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste sequi repellat nemo vitae minus expedita est quos, doloribus suscipit repudiandae placeat obcaecati fugit iure cumque fugiat. Totam tenetur fugit harum corporis aperiam dolor, ex qui architecto, fuga dolorem suscipit, odit.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste sequi repellat nemo vitae minus expedita est quos, doloribus suscipit repudiandae placeat obcaecati fugit iure cumque fugiat. Totam tenetur fugit harum corporis aperiam dolor, ex qui architecto, fuga dolorem suscipit, odit.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste sequi repellat nemo vitae minus expedita est quos, doloribus suscipit repudiandae placeat obcaecati fugit iure cumque fugiat. Totam tenetur fugit harum corporis aperiam dolor, ex qui architecto, fuga dolorem suscipit, odit.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste sequi repellat nemo vitae minus expedita est quos, doloribus suscipit repudiandae placeat obcaecati fugit iure cumque fugiat. Totam tenetur fugit harum corporis aperiam dolor, ex qui architecto, fuga dolorem suscipit, odit.
                </p>
                <div class="btn">
                <a href="#">바로가기</a>
            </div>
            </div>
        </section>

        <section>
            <h1>2017 우수작</h1>
            <div class="desc">
                <h2 class="title">운영체제 시스템</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste sequi repellat nemo vitae minus expedita est quos, doloribus suscipit repudiandae placeat obcaecati fugit iure cumque fugiat. Totam tenetur fugit harum corporis aperiam dolor, ex qui architecto, fuga dolorem suscipit, odit.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste sequi repellat nemo Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste sequi repellat nemo vitae minus expedita est quos, doloribus suscipit repudiandae placeat obcaecati fugit iure cumque fugiat. Totam tenetur fugit harum corporis aperiam dolor, ex qui architecto, fuga dolorem suscipit, odit.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste sequi repellat nemo vitae minus expedita est quos, doloribus suscipit repudiandae placeat obcaecati fugit iure cumque fugiat. Totam tenetur fugit harum corporis aperiam dolor, ex qui architecto, fuga dolorem suscipit, odit.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste sequi repellat nemo vitae minus expedita est quos, doloribus suscipit repudiandae placeat obcaecati fugit iure cumque fugiat. Totam tenetur fugit harum corporis aperiam dolor, ex qui architecto, fuga dolorem suscipit, odit.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste sequi repellat nemo vitae minus expedita est quos, doloribus suscipit repudiandae placeat obcaecati fugit iure cumque fugiat. Totam tenetur fugit harum corporis aperiam dolor, ex qui architecto, fuga dolorem suscipit, odit.vitae minus expedita est quos, doloribus suscipit repudiandae placeat obcaecati fugit iure cumque fugiat. Totam tenetur fugit harum corporis aperiam dolor, ex qui architecto, fuga dolorem suscipit, odit.</p>
            </div>
            <div class="btn">
                <a href="#">바로가기</a>
            </div>
        </section>

        <section>
            <h1>2016 우수작</h1>
            <div class="desc">
                <h2 class="title">운영체제 시스템</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste sequi repellat nemo vitae minus expedita est quos, doloribus suscipit repudiandae placeat obcaecati fugit iure cumque fugiat. Totam tenetur fugit harum corporis aperiam dolor, ex qui architecto, fuga dolorem suscipit, odit.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste sequi repellat neLorem ipsum dolor sit amet, consectetur adipisicing elit. Iste sequi repellat nemo vitae minus expedita est quos, doloribus suscipit repudiandae placeat obcaecati fugit iure cumque fugiat. Totam tenetur fugit harum corporis aperiam dolor, ex qui architecto, fuga dolorem suscipit, odit.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste sequi repellat nemo vitae minus expedita est quos, doloribus suscipit repudiandae placeat obcaecati fugit iure cumque fugiat. Totam tenetur fugit harum corporis aperiam dolor, ex qui architecto, fuga dolorem suscipit, odit.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste sequi repellat nemo vitae minus expedita est quos, doloribus suscipit repudiandae placeat obcaecati fugit iure cumque fugiat. Totam tenetur fugit harum corporis aperiam dolor, ex qui architecto, fuga dolorem suscipit, odit.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste sequi repellat nemo vitae minus expedita est quos, doloribus suscipit repudiandae placeat obcaecati fugit iure cumque fugiat. Totam tenetur fugit harum corporis aperiam dolor, ex qui architecto, fuga dolorem suscipit, odit.mo vitae minus expedita est quos, doloribus suscipit repudiandae placeat obcaecati fugit iure cumque fugiat. Totam tenetur fugit harum corporis aperiam dolor, ex qui architecto, fuga dolorem suscipit, odit.</p>
            </div>
            <div class="btn">
                <a href="#">바로가기</a>
            </div>
        </section>
        <section>
            <h1>2015 우수작</h1>
            <div class="desc">
                <h2 class="title">운영체제 시스템</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste sequi repellat nemo vitae minus expedita est quos, doloribus suscipit repudiandae placeat obcaecati fugit iure cumque fugiat. Totam tenetur fugit harum corporis aLorem ipsum dolor sit amet, consectetur adipisicing elit. Iste sequi repellat nemo vitae minus expedita est quos, doloribus suscipit repudiandae placeat obcaecati fugit iure cumque fugiat. Totam tenetur fugit harum corporis aperiam dolor, ex qui architecto, fuga dolorem suscipit, odit.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste sequi repellat nemo vitae minus expedita est quos, doloribus suscipit repudiandae placeat obcaecati fugit iure cumque fugiat. Totam tenetur fugit harum corporis aperiam dolor, ex qui architecto, fuga dolorem suscipit, odit.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste sequi repellat nemo vitae minus expedita est quos, doloribus suscipit repudiandae placeat obcaecati fugit iure cumque fugiat. Totam tenetur fugit harum corporis aperiam dolor, ex qui architecto, fuga dolorem suscipit, odit.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste sequi repellat nemo vitae minus expedita est quos, doloribus suscipit repudiandae placeat obcaecati fugit iure cumque fugiat. Totam tenetur fugit harum corporis aperiam dolor, ex qui architecto, fuga dolorem suscipit, odit.periam dolor, ex qui architecto, fuga dolorem suscipit, odit.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste sequi repellat nemo vitae minus expedita est quos, doloribus suscipit repudiandae placeat obcaecati fugit iure cumque fugiat. Totam tenetur fugit harum corporis aperiam dolor, ex qui architecto, fuga dolorem suscipit, odit.</p>
            </div>
            <div class="btn">
                <a href="#">바로가기</a>
            </div>
        </section>



    </main>



    <div class="pager_area">

        <div class="pager active"></div>

        <div class="pager"></div>

        <div class="pager"></div>

        <div class="pager"></div>

        <div class="pager"></div>

    </div>

</body>



</html>