<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%  response.setStatus(HttpServletResponse.SC_OK); %>
<html>
<head>
<title>타바404</title>
</head>
<style>

* {margin: 0; padding: 0;}

html,body {width: 100%; height: 100%; overflow: hidden;}
.container {width: 100%; height: 100%; overflow: hidden; position: relative;}
.background {display: block; position: absolute; top: 0; left: 0; object-fit: cover; width: 100%; height: 100%; mask-image: radial-gradient(white 0%, white 30%, transparent 80%, transparent);
}
.circle-container {position: absolute; transform: translateY(-10vh); animation-iteration-count: infinite; animation-timing-function: linear;}
.circle-container .circle {width: 100%; height: 100%; border-radius: 50%; mix-blend-mode: screen; background-image: radial-gradient(#99CC99,#ff9933 10%, rgba(255, 153, 51, 0) 70%);
  animation: fadein-frames 200ms infinite, scale-frames 2s infinite;}
@keyframes fade-frames {
0% {
    opacity: 1;
  }
  50% {
    opacity: 0.7;
  }
  100% {
    opacity: 1;
  }
}
@keyframes scale-frames {
  0% {
    transform: scale3d(0.4, 0.4, 1);
  }
  50% {
    transform: scale3d(2.2, 2.2, 1);
  }
  100% {
    transform: scale3d(0.4, 0.4, 1);
  }
}
.circle-container:nth-child(1) {width: 30px; height: 30px;
  animation-name: move-frames-1;
  animation-duration: 31458ms;
  animation-delay: 400ms;
}
@keyframes move-frames-1 {
  from {
    transform: translate3d(60vw, 108vh, 0);
  }
  to {
    transform: translate3d(3vw, -119vh, 0);
  }
}
.circle-container:nth-child(1) .circle {
  animation-delay: 580ms;
}
.circle-container:nth-child(2) {
  width: 2px;
  height: 2px;
  animation-name: move-frames-2;
  animation-duration: 29204ms;
  animation-delay: 29638ms;
}
@keyframes move-frames-2 {
  from {
    transform: translate3d(18vw, 104vh, 0);
  }
  to {
    transform: translate3d(68vw, -115vh, 0);
  }
}
.circle-container:nth-child(2) .circle {
  animation-delay: 3381ms;
}
.circle-container:nth-child(3) {
  width: 1px;
  height: 1px;
  animation-name: move-frames-3;
  animation-duration: 30333ms;
  animation-delay: 31643ms;
}
@keyframes move-frames-3 {
  from {
    transform: translate3d(11vw, 110vh, 0);
  }
  to {
    transform: translate3d(49vw, -113vh, 0);
  }
}
.circle-container:nth-child(3) .circle {
  animation-delay: 8ms;
}
.circle-container:nth-child(4) {
  width: 7px;
  height: 7px;
  animation-name: move-frames-4;
  animation-duration: 36555ms;
  animation-delay: 3314ms;
}
@keyframes move-frames-4 {
  from {
    transform: translate3d(61vw, 102vh, 0);
  }
  to {
    transform: translate3d(63vw, -123vh, 0);
  }
}
.circle-container:nth-child(4) .circle {
  animation-delay: 1829ms;
}
.circle-container:nth-child(5) {
  width: 7px;
  height: 7px;
  animation-name: move-frames-5;
  animation-duration: 28969ms;
  animation-delay: 6801ms;
}
@keyframes move-frames-5 {
  from {
    transform: translate3d(30vw, 108vh, 0);
  }
  to {
    transform: translate3d(64vw, -111vh, 0);
  }
}
.circle-container:nth-child(5) .circle {
  animation-delay: 3957ms;
}
.circle-container:nth-child(6) {
  width: 8px;
  height: 8px;
  animation-name: move-frames-6;
  animation-duration: 34557ms;
  animation-delay: 17103ms;
}
@keyframes move-frames-6 {
  from {
    transform: translate3d(49vw, 101vh, 0);
  }
  to {
    transform: translate3d(39vw, -106vh, 0);
  }
}
.circle-container:nth-child(6) .circle {
  animation-delay: 2619ms;
}
.circle-container:nth-child(7) {
  width: 7px;
  height: 7px;
  animation-name: move-frames-7;
  animation-duration: 36790ms;
  animation-delay: 12789ms;
}
@keyframes move-frames-7 {
  from {
    transform: translate3d(15vw, 108vh, 0);
  }
  to {
    transform: translate3d(85vw, -120vh, 0);
  }
}
.circle-container:nth-child(7) .circle {
  animation-delay: 948ms;
}
.circle-container:nth-child(8) {
  width: 5px;
  height: 5px;
  animation-name: move-frames-8;
  animation-duration: 34868ms;
  animation-delay: 4217ms;
}
@keyframes move-frames-8 {
  from {
    transform: translate3d(31vw, 107vh, 0);
  }
  to {
    transform: translate3d(73vw, -109vh, 0);
  }
}
.circle-container:nth-child(8) .circle {
  animation-delay: 1908ms;
}
.circle-container:nth-child(9) {
  width: 7px;
  height: 7px;
  animation-name: move-frames-9;
  animation-duration: 30933ms;
  animation-delay: 12966ms;
}
@keyframes move-frames-9 {
  from {
    transform: translate3d(6vw, 103vh, 0);
  }
  to {
    transform: translate3d(37vw, -115vh, 0);
  }
}
.circle-container:nth-child(9) .circle {
  animation-delay: 1779ms;
}
.circle-container:nth-child(10) {
  width: 5px;
  height: 5px;
  animation-name: move-frames-10;
  animation-duration: 33161ms;
  animation-delay: 8076ms;
}
@keyframes move-frames-10 {
  from {
    transform: translate3d(15vw, 108vh, 0);
  }
  to {
    transform: translate3d(53vw, -128vh, 0);
  }
}
.circle-container:nth-child(10) .circle {
  animation-delay: 856ms;
}
.circle-container:nth-child(11) {
  width: 7px;
  height: 7px;
  animation-name: move-frames-11;
  animation-duration: 31072ms;
  animation-delay: 16128ms;
}
@keyframes move-frames-11 {
  from {
    transform: translate3d(96vw, 107vh, 0);
  }
  to {
    transform: translate3d(51vw, -112vh, 0);
  }
}
.circle-container:nth-child(11) .circle {
  animation-delay: 3013ms;
}
.circle-container:nth-child(12) {
  width: 1px;
  height: 1px;
  animation-name: move-frames-12;
  animation-duration: 29832ms;
  animation-delay: 18653ms;
}


.message {
  position: absolute;
  right: 20px;
  bottom: 10px;
  color: white;
  font-family: "Josefin Slab", serif;
  line-height: 27px;
  font-size: 18px;
  text-align: right;
  pointer-events: none;
  animation: message-frames 1.5s ease 5s forwards;
  opacity: 0;
}
@keyframes message-frames {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}


*,
*::before,
*::after {
  box-sizing: border-box;
}

:root {
  --color-primary: #ff9933;
  --color-secondary: #e67d00;
  --color-tertiary: #d46c00;
  --color-quaternary: #c25b00;
  --color-quinary: #ae4a00;
}


body {
  min-height: 100vh;
  font-weight: 300;
  font-size: 1.25rem;
  display: flex;
  flex-direction: column;
  justify-content: center;
  overflow: hidden;
}

.content {
  display: flex;
  align-content: center;
  justify-content: center;
}

.text-shadows {
  text-shadow: 3px 3px 0 var(--color-secondary), 6px 6px 0 var(--color-tertiary), 9px 9px var(--color-quaternary), 12px 12px 0 var(--color-quinary);
  font-family: bungee, sans-serif;
  font-weight: 400;
  text-transform: uppercase;
  font-size: calc(2rem + 5vw);
  text-align: center;
  margin: 0;
  color: var(--color-primary);
  animation: shadows 2s ease-in infinite;
  letter-spacing: 0.4rem;
}

@keyframes shadows {
  0% {
    text-shadow: none;
  }
  10% {
    transform: translate(-3px, -3px);
    text-shadow: 3px 3px 0 var(--color-secondary);
  }
  20% {
    transform: translate(-6px, -6px);
    text-shadow: 3px 3px 0 var(--color-secondary), 6px 6px 0 var(--color-tertiary);
  }
  30% {
    transform: translate(-9px, -9px);
    text-shadow: 3px 3px 0 var(--color-secondary), 6px 6px 0 var(--color-tertiary), 9px 9px var(--color-quaternary);
  }
  40% {
    transform: translate(-12px, -12px);
    text-shadow: 3px 3px 0 var(--color-secondary), 6px 6px 0 var(--color-tertiary), 9px 9px var(--color-quaternary), 12px 12px 0 var(--color-quinary);
  }
  50% {
    transform: translate(-12px, -12px);
    text-shadow: 3px 3px 0 var(--color-secondary), 6px 6px 0 var(--color-tertiary), 9px 9px var(--color-quaternary), 12px 12px 0 var(--color-quinary);
  }
  60% {
    text-shadow: 3px 3px 0 var(--color-secondary), 6px 6px 0 var(--color-tertiary), 9px 9px var(--color-quaternary), 12px 12px 0 var(--color-quinary);
  }
  70% {
    text-shadow: 3px 3px 0 var(--color-secondary), 6px 6px 0 var(--color-tertiary), 9px 9px var(--color-quaternary);
  }
  80% {
    text-shadow: 3px 3px 0 var(--color-secondary), 6px 6px 0 var(--color-tertiary);
  }
  90% {
    text-shadow: 3px 3px 0 var(--color-secondary);
  }
  100% {
    text-shadow: none;
  }
}

@font-face {
    font-family: 'omyu_pretty';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
.content{margin-top:7%;}
.container2 {display: flex; flex-direction: column; justify-content: center; align-items: center; height: 40vh;}
.container2 img {max-width: 20%; height: auto;}
  p{ font-family: 'omyu_pretty';  }
button{width:100px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}

</style>
<body>

<div class="container">

<div class="content">
  <h2 class="text-shadows">404</h2>
</div>

  <script>
    for (let i = 1; i <= 100; i++) {
      document.write('<div class="circle-container"><div class="circle"></div></div>');
    }
  </script> 
  <div class="container2">
 <img src="${pageContext.request.contextPath}/resources/mobile/fix.gif" alt="자전거대여소">			

<p>타바고장남</p>
<p>지속적으로 오류 발생시 타바로 연락주시기 바랍니다</p>
<button onclick="location.href='<%=request.getContextPath()%>/index.jsp'">메인으로</button>


</div>
</div>


</body>
</html>