/**
 * Created by IntelliJ IDEA.
 * @File code.js
 * @Auth liuxing
 * @Date 2021/8/13 16:20
 * @Email liuxing997@foxmail.com
 **/
// 动态获取时间
function getTime() {
    var myDate = new Date();
    var myHour = myDate.getHours(); //获取当前小时数(0-23)
    var myMinute = myDate.getMinutes(); //获取当前分钟数(0-59)
    var mySecond = myDate.getSeconds(); //获取当前秒数(0-59)
    var myYear = myDate.getFullYear(); //获取完整的年份(4位,1970-????)
    var myMonth = myDate.getMonth() + 1; //获取当前月份(0-11,0代表1月)
    var myToday = myDate.getDate(); //获取当前日(1-31)
    var myDay = myDate.getDay(); //获取当前星期X(0-6,0代表星期天)
    var week = ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'];
    var nowDayWeek;
    nowDayWeek =  '&nbsp;&nbsp;'+myYear + '-' + fillZero(myMonth) + '-' + fillZero(myToday) + '&nbsp;&nbsp;' +fillZero(myHour)
        + ':' + fillZero(myMinute) + ':' + fillZero(mySecond)+ '&nbsp;&nbsp;' + week[myDay];
    $("#nowDate").html(nowDayWeek);
};

//填充零
function fillZero(str) {
    var realNum;
    if (str < 10) {
        realNum = '0' + str;
    } else {
        realNum = str;
    }
    return realNum;
}

//每秒获取
setInterval(getTime, 1000);