/**
 * Created by IntelliJ IDEA.
 * @File timeout.js
 * @Auth liuxing
 * @Date 2021/8/14 16:45
 * @Email liuxing997@foxmail.com
 **/
var lastTime = new Date().getTime();
var currentTime = new Date().getTime();
var timeOut = 1 * 60 * 1000; //设置超时时间： 15分钟

$(function(){
    /* 鼠标移动事件 */
    $(document).mouseover(function(){
        lastTime = new Date().getTime(); //更新操作时间

    });
});

function toLoginPage(){
    currentTime = new Date().getTime(); //更新当前时间
    if(currentTime - lastTime > timeOut){ //判断是否超时
        $.ajax({
            url: "user/logout",
            dataType: "json",
            success: function (data) {
                if (data.code === 200) {
                    layer.msg("登录超时！请重新登录", {icon: 2, time: 5000}, function () {
                        localStorage.removeItem("user");
                        window.location.href = "login.jsp";
                    });
                }
            },
            error: function (err) {
                layer.msg('服务器被吃啦！', {icon: 7, time: 3000});
            }
        });
    }
}

/* 定时器
 * 间隔1秒检测是否长时间未操作页面
 */
window.setInterval(toLoginPage, 1000);
