<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, adminUser-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>失败跳转中...</title>
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
            background-color: #FF5722;
        }

        .notice-icon {
            background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIAAAACACAYAAADDPmHLAAAU/klEQVR4Xu1deZwbxZX+vh75wDaYEE6f0yJcDhhsssEcARvCmXDYRpKBgO1lw/IjsAtLFjaELAYSlhA2m3CEcAUDIYxaMTdZFliwA5hdLh/cBro1xrA2GDDGNsx4pt/+uiWPLXW31C11a6QZ9T/6Q69evePrquqq914RzadfW4D9Wvum8mgCoJ+DoAmAJgD6uQX6ufr9agSQROvOIHcHMByUoTA51P6FMhSQFoDroch6CNdDzPUQWQvFbGf6/ff6Kk76LAAkpe4LcCIE40HsA8hEgF+ryJEiXwJYDOA1EEthcjEz+rMV8aqzRn0CAJIYtRXYMglQDgZwCMBJIIZHamtBJ4iXAHkOJp4FNj7LzIpPI+0zAuYNCwABiGT8CBBnQjAVxKAI7OOfpYiAfApi3g7JzmMGnf4b9x5lwwFAEqNGQomdCXA2wNbeM12pnuUzCP4I4a3M6K/Wp4w5qRoGAJKK/w2AfwEwLRSDinwKcB2AdaB8AdhvrDVtDINwa0CGgdyq+r7kGYDXMK0/Uj2v8DnUPQAkFf8+IBcB/E5w9eVNCKw3cBkEy9Aiy7Bh3Rt8aLXlcF+PpEbvDTMWh8JxAHYHZBzAA3w1LiCSt/JAuCN42+ha1C0AJKEeCQW/BbiXb/VFDABPQjgfMJ9iJrvSd9sAhJLYYRiUId8BlCkAvgtwgu/mIishuJQZ43bfbSIkrDsAyLSRoxAbdB2Iqf70llUA7gHM25huf9Nfm3Cp8vsLP7DXJYQ1UpR/RF5At3k257UvKk8cHUVdAUCS8ctAzPGlrshDIG+tt7lVEuq3oXAWIGcAHFpeF7kFnZ2X8P4PPilPGz5FXQBAUvHdkXPoHqVVFBOgBlPmMGO8Hb45wuMoiVHbgQMvAuXcskAQfAzIydSMv4YngT9OvQ4ASakJAHcBHOwtsuV4ZGDisnp3fLEOcsqI7dE96GIA54AcUlpHuRx7ZX/OObD0rcnTawCQWa2DsYG/BzmzpKaCl9Etf8t5xtKaWCSiTmTG6BGQ2K8BpkrrKwvQ0nEy7/1wdUSiFLDtFQDI1F13xAB5MrdH7/GIfAKRHzOTnVsLQ9SqD5nROhnCmwH7UMr9sb4U2HUk0++/FrVcNQeAzBgxGjJoPsC4twHwe3y19qIg3+tRGyps/pJsvRhUri5hg89BHMm0/mLYfW/Jr6YAkIS6B4inQe7iAX3rKHYmNX1elErXC297d1NwP4iRnvYweUyUJ481A4AkWvcDaTl/Ww9l34S58QRmVrxbLw6qhRxy6pivoatFA/ld1/4EHRDzJGayj0UhT00AIIn4PiAWghjm4fwMzI0zmVlhnbv3y0eS8TkgLvNU3pSjmDGeCNs4kQMgv7P3MogdPYS/iWn9nLAVa0R+koifCkXuBqg45Zf1MOUQZrJWYEpoT6QAsDdDlAEvui747PNzXMy08avQtOkDjCTRegwU3u+6L2J9GXV3f5vzluthqRoZAHIHJlsvADDRVVgTpzGj/yksRfoSH0mMPRBKizXnb+MyErTDlElhHXRFB4Ckam3tHu9QwHrzgRnUDK0vOS1sXWRG/FswZYHr7qHIi/jIOIjz0VVtv5EAQJLqhSCv9Vjw/ZBp47ZqBe8P7SXRehioPA5ioMuLdD014x+qtUPoAJBU6ySI8gyImIvQ51IzbqxW6P7UXhLx74HyIMgWh96mnMiM8VA19ggVADJ15NcxYNAS140NkRupGedWI2x/bSsp1TpRvN75QuELSOfEavZOwgVAMv4oiONcFi5LmDb2668ODENvScatHcOTXEDwMjX9W5X2ERoAcrF7eNhl2N8A2bhvNSitVLm+1E5Oat0WgxTrRHS0Uy/zbKazN1eibygAkAQGQolbW7hO4cScRS17ZyXCNdsUWiAXbYTnnRtF8hk6JM4HsmuC2iwcACTVS0Fe6dL5fUzr04MK1aT3toCk4v+WD48vQof8jprxo6C2qxoA+a3edx2ZOVY+XQtU3mtYQZvNJyQL5NLgBrznOFHN7axOYNpYEqSr6gGQUu8EeIZz7jcvppa9JogwTVp/FpCEejIUZlwW248zbRztj0uOqioASGr0rkBsmWNOEnkbHxl7h7FTFUSZ/kQrqfiTAI5w6Gx2H8RM+/N+bVEdAJLqXNeYvoiOLv0q1R/oZHrrnogpzjwIkceoGcf6tUHFAPB8+4FXmNb39ytAk65yC0hKbXMNMu3qnug34aQKAMStHLdZziEI32dGf7RytZot/VogXwTDGR8geJSabu3LlH0qAoAcP2IIhgy2vjkHFPXwOtP63mV7bRKEZgFJxh8B8b0ChtYXQVfnGN73wYpyHVUGgIR6JhQ6T/RMcwYz2XS5TsP6X1KtJ0KU/QAzCwUL2JbNhsU7CJ/cLh0O65GlEw9WsikTpM9NtJIYsz+U2EvOtnKRn2CbygCQUp8GOLmo09VI6zsSsM77I33yAaZ3gNx8viCyBiIX1DqPwJYlF8GzuViFJQtkNrXsA5EaIs9cUvGXnYE3spRpY99y/QcGgEwbuwtiygcgi9tezbT+k3IdVvt/7m3jIs/qIKY5u1YgKBvpbJoTwo7hc7Of52mh2fVNZpa/UcrmwQHgldBgYiwz+vJqHVyuvSRaZ0FRShdZqAEIyjrfVkQeZNpwnuCVUzLg/5KID4diJZgWrckEv6SmW1VVPJ8KAKA+D3JS4aIDz1LTK6jgEVBTy6Reew/FrCIEgT/n2wDIMm2owbUM3kJSqgbQSrTd4pG3mDZKFtgIBAA5bbtt0LXt5w7xRM6iZtwaXOzgLcrGz2/JMgIQ+He+5X9ZQM0oXisFV9pHC0moJ0Dhgw7Sjd0jeF/7/3mxCAYAa9UNxbmwMbvjzLRb5Vkif3LJlcrTvjsKEQSBnG8PALicmu6v4IVvhdwJ5fSdhqJzyFrHtrwpZzBj3B0SANTrARaGdQk+oqbvVKX8gZpLKv4bAP/ou1EIIAjsfMgSdMjkWn0O2nhLqi+AtKqpbX5E7qRmODfs8hQBRwD1TYB7Fhl+LtP6bN/OCInQ91pgU39VgKARnG8DIKVeA/CfiwCwkprhkYwb4DTQTmLsjjlLoZYZYkLytyubWoCgUZyfA8DYY4GWvziMxa/GsO3D992M6HsEyGerLHQwqeH876ZAlCCowPnt6JD9ajnsF4z2J2y/NbbaZq3DToIjqenW8bETG37fUNfvb0EHNb1EbR+/3KujiwIEgZ0v+BxiTq7Fxk8pa0kqbu3FFMdm/ohp/XfVASDZehWoFO30ySKmDffcv+p8Gri1pNTFAMtuffYwLrEmKLvbWCxdnTjfngaS6hOOWgOC31DTL6gSAOqfQRYGeArupaafGthbETTIO80qPeMfBDSnsC07v2AYtbaaB9qFLPzlMdSR8/MAuAFkYXCo4C/U9MITw7zS/tcAyfhSZ1En8zKms1dE4M+KWAYGQe4AacqmYdtu38DOzy0E1fMAXldgQMG71PTdqhsBUupKgIXf+3WY4l0pCLAR2UZ3fm4EaD0aVArLyYh8Sc1wrVHofwRIxa0t4MJ89RCSEyt61cs0qggEQLZRh/2CKcwrPmCtMpj/+W5Hsen8AyAZ73CmKcvRTBuPR+HEankGBoHfDutsznesRxNjVSgtzgoiZucoZlZ8UDkAUnFnoIdpf/ZYVUDq8gkdBHXufHsKyB0NO1PETIx3u73E1whgl3X9UnFW8KI5iW3Z/61L7+eFCg0EDeD8TX6QlNrtPBRyf1n9AcDrGBiyX9BUpN4AS9UgaCDn5xaC8Y9A7FBoa/MkprOO42J/ADj2G4OwjfmVw3kBs1B6w/k9b0UulCzYPoFtzfrY4QtiO0mqn4DcrqjN8W53K/gCQP770mVYiaZ4YRBlg9DKjNZWiBIsbqGKU8QgsoVJ6zoFiBzmdh9BEABYt2wV3rxpdk9jpv3+MIWPilfgTZ6eoaNwsygq+cLiK16jtUe2UAAAuBwy9OJRcBCDVez8BgSBfUGFOdgKEC1aAnTu5lalxT8AkvHXXS5EOodp/aYgzqg1bdXObzAQiNc+gCI7u9Vq8A+AVPw5AAcVOFDkSmrGv9baqX77C835DQQCmTH2IEiL5auCh2nd1dcBAOBWCEIyTBtJvw6pNZ0k1UW+t3f9Cld0gOS3Wa3oxD1t732m9TFuMvgHQFK9BOQvCpn4Sz+qlfJb9iMpj+xlL2Gszz2/N45bIFBkQm/lIpaypyTVX4H8cdFI/QQ146gqARCfDuLPhYzrIyKoWLHAzjdNK6h1MajMDwCCxeiUKb0V/uWJ45T6MMDC1HARz7Ky/keA6WO+iVjMeYkRTbWe3oRKnL8plzAXBtbYIJBk/B0Q3ygCSAghYblagI7jRAhOrpc7fqpxfs86r4FBYB8EUT5zJO6a3Ucw0/5UVVOA1VhS6hKA44vWATcwbZzXG/N8VXN+qZjABgWBJMZOhdJyX9H8L/iyYxgf/nBD9QBIqr8FWVyi/DWmde/7/2qAjDDefMc6ogFBIG7+EZSsJex7DWCPAG4Is/5o6dqOf1r+WQ187egiCuc36nQgbnGbIv9OzSj8KtjCisEA4JUd1EvrgCid32ggKBEIUrJoVyAAlFgH3MO08YNajgC1cH4jgUBS6t8BLEzRt4pFlZj/Lf2CAyCpXgvyQoezY2uG855PnWlJEaCi97KDg30iUjMmRKC+K0tJqgtBHlj050Km9YNLyRAcANPHTkCs5RUHU8rfs824JWqFe78+QBAQ1KY+gEyP74YYlrnYvuxhXWAA5KcBZ5q4yP9QM4oRGDoe6qNCiE8Q1KhCiGtaOLARsTXblxuVKwRA/HwA/+Hwbpe5F+dl3wrd61sw9D38RxjJ43/HUNqZNjaXj4vIMOKWtOMzba8yANhBB4NWudxccRfTxsyI9LTZSsoDfFt2GqHzgy0Mo68SJjPUsyB0uS7GX85GRQDIO8K64n2aw9kRl4vLR/hamcBj3VdDpUuihAnOsiOBS/JpmP3np2PDUTNRsJya7m6fIgEqB4BXCpJUdnVJEMPkq3M+4ABBDYsy9YwEVtEqU3mg4BQxF0l8ftQFKyUVPw3AH522k/OYNm7wY9OKAZBHn7NkrKATLV+N5L0frvYjQKU09kgwACeBSm6OVcy5vXUqmb/RaxYE24JYA5oP1EIWScWtlX9x1u9qDNdH8BZs9GPbagFwFMD/cnQkuJmafrYfAZo0lVlAUnErhuEPLra/hJpuXSzl66kKAPm1wKsACkvEWztQwn3dctF8SdUkKmmB/LavdU3f9gWEgnUYtH5n3r1qvV8TVg+AZKs1DLvlBrzEtF5Ys86vVE260gBIqjeCPMeF6Aqm9cuCmK9qANijQFK1rjk/1GUx0rwpPIg3fNBKavTekNhSR9CHyEoMEZVzs84UvhJ8wwGA9wVGn0Lp2odt73/oQ7cmiQ8LSEp9BaDzjMGUBDNGYcymD36hACA3CrT+GlSclahE/krNOMyHLE2SMhbwtDFQ9tDHi3V4AEjsMAzcWnemJdtVs39Gzfh508OVW8CzCqhIN8hxTOtuh0FlOwwNAPYo4BUxZP/ZdQi15Y6MlbISNgkgM0aPgGnP+193mEMwh5p+eaVmChUAtp+9KnkLVkDZeEBzPRDMVbkb2gY9BfAAp/PlSWrGkcE4FlKHD4DJiGFHOzjB5RNQlsHceCAzK5xFp6vRoo+2lbMwAGvUJ12/sAQfQDrHV2vL0AFgjwK5Iet1kNu6fBougbnuEGY+XtdH/RaKWjIHCt6IPwziOJdhvwvsPoDpdmdgTsDeIwFA/qvAWbBws3ALMXD9UUF2rALq1fDkklLvAni6hyKemT5BFY8MAPn1gMdplf1lsBix7sN7K5w8qKFqRS92BpZ9AdSJrn0KrqGmXxyWPJECIDcSxH8C4ioPgd+DicNrcd1cWAaLko99KdfG4Y+5BHfmuvUZ5RNExsgBkAOB6qxgvUlKwceQrsnlLjgMolQj0sop6k7ohrWlvoe7/PI49jKO5RyYYepXEwDkQXA3SPfcAZENoJzJdLYtTOUahZck1UNBWMO+++VbgqcxxDwu6D6/H/1rBoA8CK4EeWkJwW6CqZ/PDDr9CN8XaOwpEmLZpcVDnzas0k/nfHRFoW9NAZBfGM4G5DZnQGnPnLAI7DjR65KjKIzQGzzzl3BaI96xnv2LXEXN+GmU8tUcADYIEq3HgJwH0rWGPQRfgJiDVfp1USE/SqOW4y0p9QwIfglyZ1daa39fMLvUhY/l+vD7f68AwAZB7gj5IZeYts2yi7wNBT9km/GMX4XqmU4SY8ZBafmD67Zuj+CyCpQTa1WEu9cAYIMgd93pzQCt/YJSTxvMzp+5FTqsZ4f3TGrTxu6CmHKpRxTPFirI41A6Tos6oHZLm/UqAHoMZJU2I64HuVWJ+dA69rwbZvcVtbqnuFpwydRdd8QA86cgzgLofb2eNeQDc6AZv6D1tV/Dpy4AkFsXjBkHxu4Csb8P/eeiC1dxnv6OD9qak8i0kaMQG3QhKGeXdHxOsnfA7llsa3deylkDyesGADYI7AMQ9Z8AXFFyNOgZOvAcKHPx5RdpPrT6ixrYy3uAsi7V2MCTAcwEcbj3V06ehaALxLVYq8xxu8unVrrUFQB6/Dp9TBwtLXe4B5q6mUasQMh5gDwC86v/Zmals1hyBBaVxKjtwIFTQLGKMJ4GcKi/bmQRTM6sh7D5ugTA5rVBawpUrDk0aBGq1wF5Gqb5FMyW18KaKsQCZiw2DmIeDnKya3BmKQQI3oXI1cwYt/sDSvRUdQ2AHiCk4lblSysl/YiKTWJ9UsIqosA3ATjvP3JnPBiUPQHsDnCvyvvGy4BcQ83QKuYRUcOGAMDmESG+DxRcAMgpPhZXEZksENs2mLiRGf3ZQK1qSNxQAOgBgn1N+rBTITzTPfSshhYs7krwKmjejg7cWW91hN2s0pAA2FKR/OfjGYAc6nmOHjUeRF4EsACCDDPGC1F3Fyb/hgeA4wW0jlbBg0GxLreYCHBEmAaDlYJFLoLIQsB8DkP4fBTHtKHKXIJZnwOAAxD2jeAyAeR4CMaDjEN8lsejtSvHLARLId1LMEAW9bUQtj4PgFq9SY3aTxMAjeq5kORuAiAkQzYqmyYAGtVzIcndBEBIhmxUNk0ANKrnQpK7CYCQDNmobJoAaFTPhSR3EwAhGbJR2TQB0KieC0nu/wcMx/f5+DeZ6gAAAABJRU5ErkJggg==");
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