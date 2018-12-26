<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, adminUser-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>成功跳转中...</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }
        body {
            background-color: #fff;
            font-size: 16px;
        }

        .container {
            margin-left: auto;
            margin-right: auto;
            text-align: center;
            padding: 20px 10px;
        }
        @media (min-width: 510px) {
            body {
                background-color: #eee;
                color: #666;
            }
            .container {
                width: 500px;
                border: 2px solid #ddd;
                border-radius: 5px;
                margin-top: 5%;
                background-color: #fff;
                box-shadow: inset 0px 0px 15px #eeeeee;
            }
        }

        .btn {
            display: inline-block;
            padding: 10px 15px;
            cursor: pointer;
            border: 1px solid #c9c9c9;
            border-radius: 5px;
            text-decoration: none;
            color: #000;
            box-sizing: border-box;
            background-color: #fff;
            vertical-align: middle;
            font-size: 14px;
        }

        .btn-group .btn {
            margin-right: 10px;
        }
        .btn-group .btn:last-child {
            margin-right: 0;
        }

        .btn-normal {
            border: none;
            background-color: #1e9fff;
            color: #fff;
        }
        .btn-danger {
            border: none;
            background-color: #FF5722;
            color: #fff;
        }
        .btn-default {
            border: none;
            background-color: #009688;
            color: #fff;
        }

        .notice-text {
            line-height: 1.5em;
        }

        .progress {
            border-radius: 3px;
            height: 3px;
            background-color: #e2e2e2;
        }
        .progress-bar {
            width: 0%;
            height: 100%;
            background-color: #5FB878;
        }

        .notice-icon {
            background-image: url("data:image/png;base64,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");
            background-size: cover;
            width: 64px;
            height: 64px;
            margin-top: 25px;
            display: inline-block;
        }
        .notice-text, .notice-icon, .btn-group, .progress {
            margin-top: 25px;
        }

        #close {
            display: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <i class="notice-icon"></i>
        <div class="notice-text">${msg}</div>
        <div class="btn-group">
            <a href="${url}" class="btn btn-normal" id="url">立即跳转 ( <span id="wait">2</span> )</a>
            <button type="button" class="btn btn-danger" id="stop">停止跳转</button>
            <button type="button" class="btn btn-default" id="close">关闭窗口</button>
        </div>
        <div class="progress">
            <div class="progress-bar" id="progress"></div>
        </div>
    </div>
    <script>
        var url_ele = document.getElementById('url')
            ,wait_ele = document.getElementById('wait')
            ,progress_ele = document.getElementById('progress')
            ,stop_ele = document.getElementById('stop')
            ,close_ele = document.getElementById('close');

        var interval = setInterval(function () {
            var time, original_time;
            if (wait_ele.dataset.time == undefined) {
                time = wait_ele.innerHTML * 100;
                wait_ele.dataset.original = time;
            } else {
                time = wait_ele.dataset.time;
            }
            original_time = wait_ele.dataset.original;

            time = parseInt(time) - 10;

            if (time % 100 == 0) {
                wait_ele.innerHTML = (time / 100);
            }

            wait_ele.dataset.time = time;
            progress_ele.style.width = ((original_time - time) / original_time * 100).toFixed(2) + '%';

            if (time <= 0) {
                clearInterval(interval);
                location.href = url_ele.href;
                // parent.layer.close(parent.layer.getFrameIndex(window.name));
            }
        }, 100);

        stop_ele.onclick = function (ev) {
            clearInterval(interval);
        };
        close_ele.onclick = function (ev) {
            parent.layer.close(parent.layer.getFrameIndex(window.name));
        };

        if (typeof parent.layer != 'undefined') {
            close_ele.style.display = 'inline-block';
        }
    </script>
</body>
</html>