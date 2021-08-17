/**
 * Created by IntelliJ IDEA.
 * @File code.js
 * @Auth liuxing
 * @Date 2021/8/13 16:09
 * @Email liuxing997@foxmail.com
 **/
//生成验证码
function draw(show_num) {
    var code_width = $('#code').width();
    var code_height = $('#code').height();
    var code = document.getElementById("code");
    var context = code.getContext("2d");
    code.width = code_width;
    code.height = code_height;
    var sCode = "A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0";
    var aCode = sCode.split(",");
    var aLength = aCode.length;//获取到数组的长度

    for (var i = 0; i <= 5; i++) {
        var j = Math.floor(Math.random() * aLength);
        var deg = Math.random() * 30 * Math.PI / 180;
        var txt = aCode[j];
        show_num[i] = txt.toLowerCase();
        var x = 10 + i * 20;
        var y = 20 + Math.random() * 8;
        context.font = "bold 23px 微软雅黑";

        context.translate(x, y);
        context.rotate(deg);

        context.fillStyle = randomColor();
        context.fillText(txt, 0, 0);

        context.rotate(-deg);
        context.translate(-x, -y);
    }
    for (var i = 0; i <= 5; i++) { //验证码上显示线条
        context.strokeStyle = randomColor();
        context.beginPath();
        context.moveTo(Math.random() * code_width, Math.random() * code_height);
        context.lineTo(Math.random() * code_width, Math.random() * code_height);
        context.stroke();
    }
    for (var i = 0; i <= 30; i++) { //验证码上显示小点
        context.strokeStyle = randomColor();
        context.beginPath();
        var x = Math.random() * code_width;
        var y = Math.random() * code_height;
        context.moveTo(x, y);
        context.lineTo(x + 1, y + 1);
        context.stroke();
    }
}

function randomColor() {//得到随机的颜色值
    var r = Math.floor(Math.random() * 256);
    var g = Math.floor(Math.random() * 256);
    var b = Math.floor(Math.random() * 256);
    return "rgb(" + r + "," + g + "," + b + ")";
}