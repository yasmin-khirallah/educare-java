<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/fragments/header.jspf" %>
<!DOCTYPE html>
<html>
<head>
    <title>🎮 Jeux disponibles</title>
    <style>
        body {
            font-family: 'Helvetica Neue', sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }
        #ghost {
            position: relative;
            scale: 0.8;
        }
        .card {
            position: relative;
            width: 300px;
            height: 200px;
            background: linear-gradient(-45deg, #f89b29 0%, #ff0f7b 100% );
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            transition: all 0.6s cubic-bezier(0.23, 1, 0.320, 1);
        }

        .card svg {
            width: 48px;
            fill: #333;
            transition: all 0.6s cubic-bezier(0.23, 1, 0.320, 1);
        }

        .card:hover {
            transform: rotate(-5deg) scale(1.1);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .card__content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%) rotate(-45deg);
            width: 100%;
            height: 100%;
            padding: 20px;
            box-sizing: border-box;
            background-color: #fff;
            opacity: 0;
            transition: all 0.6s cubic-bezier(0.23, 1, 0.320, 1);
        }

        .card:hover .card__content {
            transform: translate(-50%, -50%) rotate(0deg);
            opacity: 1;
        }

        .card__title {
            margin: 0;
            font-size: 24px;
            color: #333;
            font-weight: 700;
        }

        .card__description {
            margin: 10px 0 0;
            font-size: 14px;
            color: #777;
            line-height: 1.4;
        }

        .card:hover svg {
            scale: 0;
            transform: rotate(-45deg);
        }

        #red {
            animation: upNDown infinite 0.5s;
            position: relative;
            width: 140px;
            height: 140px;
            display: grid;
            grid-template-columns: repeat(14, 1fr);
            grid-template-rows: repeat(14, 1fr);
            grid-column-gap: 0px;
            grid-row-gap: 0px;
            grid-template-areas:
    "a1  a2  a3  a4  a5  top0  top0  top0  top0  a10 a11 a12 a13 a14"
    "b1  b2  b3  top1 top1 top1 top1 top1 top1 top1 top1 b12 b13 b14"
    "c1 c2 top2 top2 top2 top2 top2 top2 top2 top2 top2 top2 c13 c14"
    "d1 top3 top3 top3 top3 top3 top3 top3 top3 top3 top3 top3 top3 d14"
    "e1 top3 top3 top3 top3 top3 top3 top3 top3 top3 top3 top3 top3 e14"
    "f1 top3 top3 top3 top3 top3 top3 top3 top3 top3 top3 top3 top3 f14"
    "top4 top4 top4 top4 top4 top4 top4 top4 top4 top4 top4 top4 top4 top4"
    "top4 top4 top4 top4 top4 top4 top4 top4 top4 top4 top4 top4 top4 top4"
    "top4 top4 top4 top4 top4 top4 top4 top4 top4 top4 top4 top4 top4 top4"
    "top4 top4 top4 top4 top4 top4 top4 top4 top4 top4 top4 top4 top4 top4"
    "top4 top4 top4 top4 top4 top4 top4 top4 top4 top4 top4 top4 top4 top4"
    "top4 top4 top4 top4 top4 top4 top4 top4 top4 top4 top4 top4 top4 top4"
    "st0 st0 an4 st1 an7 st2 an10 an10 st3 an13 st4 an16 st5 st5"
    "an1 an2 an3 an5 an6 an8 an9 an9 an11 an12 an14 an15 an17 an18";
        }

        @keyframes upNDown {
            0%,
            49% {
                transform: translateY(0px);
            }
            50%,
            100% {
                transform: translateY(-10px);
            }
        }

        #top0,
        #top1,
        #top2,
        #top3,
        #top4,
        #st0,
        #st1,
        #st2,
        #st3,
        #st4,
        #st5 {
            background-color: red;
        }

        #top0 {
            grid-area: top0;
        }

        #top1 {
            grid-area: top1;
        }

        #top2 {
            grid-area: top2;
        }

        #top3 {
            grid-area: top3;
        }

        #top4 {
            grid-area: top4;
        }

        #st0 {
            grid-area: st0;
        }

        #st1 {
            grid-area: st1;
        }

        #st2 {
            grid-area: st2;
        }

        #st3 {
            grid-area: st3;
        }

        #st4 {
            grid-area: st4;
        }

        #st5 {
            grid-area: st5;
        }

        #an1 {
            grid-area: an1;
            animation: flicker0 infinite 0.5s;
        }

        #an18 {
            grid-area: an18;
            animation: flicker0 infinite 0.5s;
        }

        #an2 {
            grid-area: an2;
            animation: flicker1 infinite 0.5s;
        }

        #an17 {
            grid-area: an17;
            animation: flicker1 infinite 0.5s;
        }

        #an3 {
            grid-area: an3;
            animation: flicker1 infinite 0.5s;
        }

        #an16 {
            grid-area: an16;
            animation: flicker1 infinite 0.5s;
        }

        #an4 {
            grid-area: an4;
            animation: flicker1 infinite 0.5s;
        }

        #an15 {
            grid-area: an15;
            animation: flicker1 infinite 0.5s;
        }

        #an6 {
            grid-area: an6;
            animation: flicker0 infinite 0.5s;
        }

        #an12 {
            grid-area: an12;
            animation: flicker0 infinite 0.5s;
        }

        #an7 {
            grid-area: an7;
            animation: flicker0 infinite 0.5s;
        }

        #an13 {
            grid-area: an13;
            animation: flicker0 infinite 0.5s;
        }

        #an9 {
            grid-area: an9;
            animation: flicker1 infinite 0.5s;
        }

        #an10 {
            grid-area: an10;
            animation: flicker1 infinite 0.5s;
        }

        #an8 {
            grid-area: an8;
            animation: flicker0 infinite 0.5s;
        }

        #an11 {
            grid-area: an11;
            animation: flicker0 infinite 0.5s;
        }

        @keyframes flicker0 {
            0%,
            49% {
                background-color: red;
            }
            50%,
            100% {
                background-color: transparent;
            }
        }

        @keyframes flicker1 {
            0%,
            49% {
                background-color: transparent;
            }
            50%,
            100% {
                background-color: red;
            }
        }

        #eye {
            width: 40px;
            height: 50px;
            position: absolute;
            top: 30px;
            left: 10px;
        }

        #eye::before {
            content: "";
            background-color: white;
            width: 20px;
            height: 50px;
            transform: translateX(10px);
            display: block;
            position: absolute;
        }

        #eye::after {
            content: "";
            background-color: white;
            width: 40px;
            height: 30px;
            transform: translateY(10px);
            display: block;
            position: absolute;
        }

        #eye1 {
            width: 40px;
            height: 50px;
            position: absolute;
            top: 30px;
            right: 30px;
        }

        #eye1::before {
            content: "";
            background-color: white;
            width: 20px;
            height: 50px;
            transform: translateX(10px);
            display: block;
            position: absolute;
        }

        #eye1::after {
            content: "";
            background-color: white;
            width: 40px;
            height: 30px;
            transform: translateY(10px);
            display: block;
            position: absolute;
        }

        #pupil {
            width: 20px;
            height: 20px;
            background-color: blue;
            position: absolute;
            top: 50px;
            left: 10px;
            z-index: 1;
            animation: eyesMovement infinite 3s;
        }

        #pupil1 {
            width: 20px;
            height: 20px;
            background-color: blue;
            position: absolute;
            top: 50px;
            right: 50px;
            z-index: 1;
            animation: eyesMovement infinite 3s;
        }

        @keyframes eyesMovement {
            0%,
            49% {
                transform: translateX(0px);
            }
            50%,
            99% {
                transform: translateX(10px);
            }
            100% {
                transform: translateX(0px);
            }
        }

        #shadow {
            background-color: black;
            width: 140px;
            height: 140px;
            position: absolute;
            border-radius: 50%;
            transform: rotateX(80deg);
            filter: blur(20px);
            top: 80%;
            animation: shadowMovement infinite 0.5s;
        }

        @keyframes shadowMovement {
            0%,
            49% {
                opacity: 0.5;
            }
            50%,
            100% {
                opacity: 0.2;
            }
        }

        .container {
            max-width: 1200px;
            margin: 50px auto;
            padding: 30px;
        }

        h1 {
            text-align: center;
            margin-bottom: 40px;
            color: #2c3e50;
        }

        .cards-wrapper {
            display: flex;

            gap: 20px;
            justify-content: center;
        }

        .card {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            padding: 25px;
            width: 300px;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            animation: fadeInUp 0.6s ease forwards;
            opacity: 0;
        }

        .card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
        }

        .card h2 {
            margin-top: 0;
            color: #2980b9;
            font-size: 1.4em;
        }

        .card .theme {
            font-weight: bold;
            color: #16a085;
            margin-bottom: 10px;
        }

        .card .description {
            color: #555;
        }

        @keyframes fadeInUp {
            from {
                transform: translateY(30px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

    </style>
</head>
<body>
<div class="container">
    <div id="ghost">
        <div id="red">
            <div id="pupil"></div>
            <div id="pupil1"></div>
            <div id="eye"></div>
            <div id="eye1"></div>
            <div id="top0"></div>
            <div id="top1"></div>
            <div id="top2"></div>
            <div id="top3"></div>
            <div id="top4"></div>
            <div id="st0"></div>
            <div id="st1"></div>
            <div id="st2"></div>
            <div id="st3"></div>
            <div id="st4"></div>
            <div id="st5"></div>
            <div id="an1"></div>
            <div id="an2"></div>
            <div id="an3"></div>
            <div id="an4"></div>
            <div id="an5"></div>
            <div id="an6"></div>
            <div id="an7"></div>
            <div id="an8"></div>
            <div id="an9"></div>
            <div id="an10"></div>
            <div id="an11"></div>
            <div id="an12"></div>
            <div id="an13"></div>
            <div id="an14"></div>
            <div id="an15"></div>
            <div id="an16"></div>
            <div id="an17"></div>
            <div id="an18"></div>
        </div>
        <div id="shadow"></div>
    </div>

    <h1>🎲 Liste des Jeux</h1>


    <div class="cards-wrapper">

        <c:forEach items="${jeux}" var="jeu"><div class="card">
                <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M20 5H4V19L13.2923 9.70649C13.6828 9.31595 14.3159 9.31591 14.7065 9.70641L20 15.0104V5ZM2 3.9934C2 3.44476 2.45531 3 2.9918 3H21.0082C21.556 3 22 3.44495 22 3.9934V20.0066C22 20.5552 21.5447 21 21.0082 21H2.9918C2.44405 21 2 20.5551 2 20.0066V3.9934ZM8 11C6.89543 11 6 10.1046 6 9C6 7.89543 6.89543 7 8 7C9.10457 7 10 7.89543 10 9C10 10.1046 9.10457 11 8 11Z"></path></svg>
                <div class="card__content" >
            <div class="card" onclick="window.location='jeux?action=edit&id=${jeu.id}'">
                <h2>${jeu.nomJeu}</h2><br>
                <div class="theme">Thème : ${jeu.theme.nomTheme}</div><br>
                <div class="description">${jeu.description}</div>
            </div></div>
        </div>
        </c:forEach>

    </div>


</div>
</body>
</html>
