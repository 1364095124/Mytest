$(function(){

    var wsPath=wsPath();
    function wsPath(){
        var local=window.location;
        var contextPath=local.pathname.split("/")[1];
        return "ws://"+local.host+"/"+contextPath+"/";
    };

    //建立socket连接
    var sock;
    var lockReconnect = false,count=0;
    createWebSocket();


    function createWebSocket(){
        try {
            if ('WebSocket' in window) {
                sock = new WebSocket(wsPath+"socketServer");
            } else if ('MozWebSocket' in window) {
                sock = new MozWebSocket(wsPath+"socketServer");
            } else {
                sock = new SockJS(wsPath+"sockjs/socketServer");
            }
            init();
        } catch (e) {
            console.log('Ceate WebSocket Error ! Tring To RestConnection !'+e);
            restConnect();
        }

    }

    function init(){
        sock.onopen = function (e) {
            heartCheck.start();
            console.debug(" WebSocket Connection Success ! ");
        };
        sock.onmessage = function (e) {
            heartCheck.reset();
            if(e.data==""){
                return false;
            }
            console.log("----data"+e.data);
            var socketMSG=JSON.parse(e.data);
            //socketMSG.MSG 我这里后端传的是个json 所以这么写的
            if(socketMSG.MSG!=undefined){
                var n=$("#msgnum").text();
                console.log("----"+n);
                var msg=socketMSG.MSG;
                iziToast.error({
                    title: msg.sendName,
                    message: msg.content,
                    position: 'bottomRight',
                    transitionIn: 'bounceInLeft'
                });
                $("#msgnum").text(parseInt(n)+1);
            }
        };
        sock.onerror = function (e) {
            console.error(" WebSocket Connection Failure ! Tring To RestConnect !"+e);
            restConnect();
        };
        sock.onclose = function (e) {
            console.warn(" WebSocket Connection Close ! Tring To RestConnect !"+e);
            restConnect();
        }
    }


    function restConnect(){
        if(lockReconnect){
            return;
        }
        if(count<=3){
            createWebSocket();
            lockReconnect=true;
        }else{
            console.error('WebSocket Connection Timeout!');
        }
    }

    var heartCheck = {
        timeout: 300000,//60ms
        timeoutObj:null ,
        serverTimeoutObj:null ,
        reset: function(){
            clearTimeout(this.timeoutObj);
            clearTimeout(this.serverTimeoutObj);
            this.start();
        },
        start: function(){
            var _this = this;
            this.timeoutObj = setTimeout(function(){
                sock.send("");
                _this.serverTimeoutObj = setTimeout(function(){
                    sock.close();
                }, _this.timeout)
            }, this.timeout)
        }
    };


    //窗口关闭前,主动关闭websocket连接
    window.onbeforeunload = function () {
        sock.close();
    };

});
