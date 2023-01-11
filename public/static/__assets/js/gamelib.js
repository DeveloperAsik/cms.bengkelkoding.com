/*
 gamelib merupakan kumpulan kode yang digunakan untuk mempermudah pembuatan game menggunakan kode HTML 5
 Programer 		: Wandah Wibawanto
 Lisensi			: CC, SA, BY (Creative Common, Share Alike, Credit)
 //*/
var dataGambar = {};
var dataSuara = {};
var konten;
var canvas;
var score = 0;
var hiscore = 0;
var smoothing = true;
var warnaBG;
var funcDB = [];

//-----------------preload-------------------------------
function loading(img, snd, func) {
    siapkanGambar(img, function (images) {
        dataGambar = images;
        console.log("gfx loaded");
        siapkanSuara(snd, function (sound) {
            dataSuara = sound;
            console.log("sfx loaded");
            func();
        });
    });
}
//--------------------audio------------------------------
function Sound(src) {
    this.sound = document.createElement("audio");
    this.sound.src = src;
    this.sound.setAttribute("preload", "auto");
    this.sound.setAttribute("controls", "none");
    this.sound.style.display = "none";
    document.body.appendChild(this.sound);
    this.play = function () {
        this.sound.play();
    }
    this.stop = function () {
        this.sound.pause();
    }
    this.loop = function () {
        this.sound.setAttribute("loop", "loop");
        this.sound.play();
    }
    this.volume = function (vol) {
        this.sound.volume = vol;
    }
}
function siapkanSuara(sources, callback)
{
    var sound = {};
    var loadedSound = 0;
    var numSound = 0;
    // get num of sources
    for (var src in sources) {
        numSound++;
    }
    if (numSound > 0) {
        //gambar preloader
        hapusLayar();
        teks("loading sound", canvas.width / 2, canvas.height / 2 - 20);
        kotakr(canvas.width / 2 - 150, canvas.height / 2 - 10, 300, 15, 4, 2, "white", "none");
        for (var src in sources) {
            sound[src] = game.folder + "/" + sources[src];
            hapusLayar();
            teks("loading sound", canvas.width / 2, canvas.height / 2 - 20);
            var persen = loadedSound / numSound * 300; //300 = panjang preloader
            kotakr(canvas.width / 2 - 150, canvas.height / 2 - 10, persen, 15, 4, 2, "white", "white");
            kotakr(canvas.width / 2 - 150, canvas.height / 2 - 10, 300, 15, 4, 2, "white", "none");
            if (++loadedSound >= numSound) {
                callback(sound);
            }
        }
    } else {
        callback(sound);
    }
}

function siapkanGambar(sources, callback)
{
    var images = {};
    var loadedImages = 0;
    var numImages = 0;
    konten.webkitImageSmoothingEnabled = smoothing;
    konten.mozImageSmoothingEnabled = smoothing;
    konten.imageSmoothingEnabled = smoothing;
    // get num of sources
    for (var src in sources) {
        numImages++;
    }
    //gambar preloader
    hapusLayar();
    teks("loading graphic", canvas.width / 2, canvas.height / 2 - 20);
    kotakr(canvas.width / 2 - 150, canvas.height / 2 - 10, 300, 15, 4, 2, "white", "none");

    for (var src in sources) {
        images[src] = new Image();
        images[src].onload = function () {
            //tampilkan preloading baris
            hapusLayar();
            teks("loading graphic", canvas.width / 2, canvas.height / 2 - 20);
            var persen = loadedImages / numImages * 300; //300 = panjang preloader
            kotakr(canvas.width / 2 - 150, canvas.height / 2 - 10, persen, 15, 4, 2, "white", "white");
            kotakr(canvas.width / 2 - 150, canvas.height / 2 - 10, 300, 15, 4, 2, "white", "none");
            if (++loadedImages >= numImages) {
                callback(images);
            }
        };
        images[src].src = game.folder + "/" + sources[src];
    }
}
//--------------------
function animasi(data) {
    sprite(data);
    if (data.frameRate == undefined) {
        data.frameRate = 3;
        data.frameTimer = 0;
    }
    if (!game.pause)
        data.frameTimer++;
    if (data.frameTimer > data.frameRate) {
        data.frameTimer = 0;
        data.frame++;
        if (data.frame > data.maxFrame)
            data.frame = 1;
    }
}

function sprite(data) {
    var imgW = data.img.width;
    var imgH = data.img.height;
    if (data.lebar == undefined)
        data.lebar = imgW;
    if (data.tinggi == undefined)
        data.tinggi = imgH;
    var divX = Math.floor(imgW / data.lebar);
    var divY = Math.floor(imgH / data.tinggi);
    var maxFrame = divX * divY;
    if (data.maxFrame == undefined)
        data.maxFrame = maxFrame;
    if (data.frame == undefined)
        data.frame = 1;
    var fr = data.frame;
    var frameY = Math.floor((fr - 1) / divX);
    var frameX = (fr - 1) - frameY * divX;
    if (data.x == undefined || data.y == undefined) {
        data.x = 0;
        data.y = 0;
    }
    if (data.skalaX == undefined || data.skalaX == null)
        data.skalaX = 1;
    if (data.skalaY == undefined || data.skalaY == null)
        data.skalaY = 1;
    if (data.rotasi == undefined)
        data.rotasi = 0;
    if (data.mati == undefined || data.mati == false) {
        if (data.rotasi == 0) {
            konten.drawImage(data.img, frameX * data.lebar, frameY * data.tinggi, data.lebar, data.tinggi, data.x - (data.skalaX * data.lebar) / 2, data.y - (data.skalaY * data.tinggi) / 2, data.skalaX * data.lebar, data.skalaY * data.tinggi);
        } else {
            //gambar berotasi
            konten.save();
            konten.translate(data.x, data.y);
            konten.rotate(data.rotasi * Math.PI / 180.0);
            konten.translate(-data.x, -data.y);
            konten.drawImage(data.img, frameX * data.lebar, frameY * data.tinggi, data.lebar, data.tinggi, data.x - (data.skalaX * data.lebar) / 2, data.y - (data.skalaY * data.tinggi) / 2, data.skalaX * data.lebar, data.skalaY * data.tinggi);
            konten.restore();
        }
    }
}

function tampilkanGambar(img, px = 0, py = 0) {
    konten.drawImage(img, px - img.width / 2, py - img.height / 2);
}

function loopSprite(data) {
    data.frame++;
    if (data.frame > data.maxFrame) {
        data.frame = 1;
    }
    sprite(data);
}


function hapusLayar(wrn = warnaBG, ob = {}){
    warnaBG = wrn;
    konten.clearRect(0, 0, canvas.width, canvas.height);
    konten.fillStyle = warnaBG;
    konten.fillRect(0, 0, canvas.width, canvas.height);
    if (ob.stat == "run") {
        funcDB.push(ob.func);
    }
    if (ob.stat == "clear") {
        funcDB = [];
    }
    if (funcDB.length > 0)
        jalankan(funcDB[0]);

}

//kotak rounded
function kotakr(x, y, width, height, radius = 5, tbl = 1, stroke = "#000", fill = "#fff") {
    radius = {tl: radius, tr: radius, br: radius, bl: radius};
    konten.beginPath();
    konten.moveTo(x + radius.tl, y);
    konten.lineTo(x + width - radius.tr, y);
    konten.quadraticCurveTo(x + width, y, x + width, y + radius.tr);
    konten.lineTo(x + width, y + height - radius.br);
    konten.quadraticCurveTo(x + width, y + height, x + width - radius.br, y + height);
    konten.lineTo(x + radius.bl, y + height);
    konten.quadraticCurveTo(x, y + height, x, y + height - radius.bl);
    konten.lineTo(x, y + radius.tl);
    konten.quadraticCurveTo(x, y, x + radius.tl, y);
    konten.closePath();
    if (fill != "none") {
        konten.fillStyle = fill;
        konten.fill();
    }
    if (stroke != "none") {
        konten.lineWidth = tbl;
        konten.strokeStyle = stroke;
        konten.stroke();
}
}

function setgame(res = "") {
    canvas = document.getElementById("canvas");
    konten = canvas.getContext("2d");
    score = 0;
    if (res == "") {
        konten.canvas.width = window.innerWidth;
        konten.canvas.height = window.innerHeight;
        screenW = window.innerWidth;
        screenH = window.innerHeight;
    } else {
        var sz = res.split("x");
        screenW = parseInt(sz[0]);
        screenH = parseInt(sz[1]);
        konten.canvas.width = screenW;
        konten.canvas.height = screenH;
    }
    game = {};
    game.aktif = true;
    game.lebar = screenW;
    game.tinggi = screenH;
    game.smoothing = true;
    game.pause = false;
    game.folder = _base_assets_url  + "/games/matching_photos/";
    console.log("ukuran layar = " + konten.canvas.width + " x " + konten.canvas.height);
    aktifkanKeyboard();
    console.log("keyboard aktif");
    hapusLayar("#333");
    //mouse
    canvas.onmousedown = mouseDown;
    canvas.onmouseup = mouseUp;
    canvas.onmousemove = mouseMove;
}
//mouse
function mouseDown(e) {
    game.mouseDitekan = true;
    game.dragX = e.pageX - canvas.offsetLeft;
    game.dragY = e.pageY - canvas.offsetTop;
    game.clickX = e.pageX - canvas.offsetLeft;
    game.clickY = e.pageY - canvas.offsetTop;
    game.mouse = {x: game.clickX, y: game.clickY};
}
function mouseUp(e) {
    game.mouseDitekan = false;
    game.clickX = e.pageX - canvas.offsetLeft;
    game.clickY = e.pageY - canvas.offsetTop;
    game.mouse = {x: game.clickX, y: game.clickY};
}
function mouseMove(e) {
    game.mouseX = e.pageX - canvas.offsetLeft;
    game.mouseY = e.pageY - canvas.offsetTop;
}

//---------------------- keyboard --------------------
var atas = false;
var bawah = false;
var kiri = false;
var kanan = false;
var spasi = false;
var tombolP = false;
//-----------------keyboard listener -------------------------
function tombolditekan(event) {
    if (!game.pause && game.aktif) {
        if (event.keyCode == 37)
            kiri = true;
        if (event.keyCode == 38)
            atas = true;
        if (event.keyCode == 39)
            kanan = true;
        if (event.keyCode == 40)
            bawah = true;
        if (event.keyCode == 32)
            spasi = true;
    }
    if (event.keyCode == 80) {
        tombolP = true;
    }
}
function tomboldilepas(event) {
    if (event.keyCode == 37)
        kiri = false;
    if (event.keyCode == 38)
        atas = false;
    if (event.keyCode == 39)
        kanan = false;
    if (event.keyCode == 40)
        bawah = false;
    if (event.keyCode == 32)
        spasi = false;
    if (event.keyCode == 80) {
        tombolP = false;
        game.pause = !game.pause;
    }
}
function aktifkanKeyboard() {
    addEventListener("keydown", tombolditekan);
    addEventListener("keyup", tomboldilepas);
}

//---------------------- GAME RUNNING ----------------
var arena = {};
var game = {};
game.aktif = true;
var gravitasi = 10;
var screenW = 0;
var screenH = 0;
function jalankan(func, speed = 30) {
    movingOb = {};
    clearInterval(game.loop);
    game.loop = setInterval(func, speed);
}
//----------------------
function lompat(data, speed) {
    if (data.aksi == "" || data.aksi == "lari") {
        data.aksi = "lompat";
        data.vy = -speed * 5;
        var lbl = data["lompat"];
        var fr = lbl.split("-");
        data.frm1 = parseInt(fr[0]);
        data.frm2 = parseInt(fr[0]) + 1;
        data.frm3 = parseInt(fr[1]);
    }
}

function platform(data) {
    if (data.aksi == "lari") {
        var lbl = data["lari"];
        var fr = lbl.split("-");
        var frm = parseInt(fr[0]);
        var mfrm = parseInt(fr[1]);
        if (data.activeFrame == undefined || data.activeFrame < frm || data.activeFrame > mfrm)
            data.activeFrame = frm;
        data.activeFrame++;
        if (data.activeFrame > mfrm) {
            data.activeFrame = frm;
        }
        sprite(data, data.activeFrame);
    }
    if (data.aksi == "lompat") {
        data.vy += gravitasi;
        data.y += data.vy;
        //frame
        if (data.vy < 0) {
            sprite(data, data.frm2);
        } else {
            sprite(data, data.frm3);
        }
        //tanah
        if (data.y > arena.y - data.tinggi) {
            data.timer = 0;
            data.aksi = "mendarat";
            //sprite(data, data.x, data.y, data.frm3);
            data.y = arena.y - data.tinggi;
        }
    }
    if (data.aksi == "mendarat") {
        data.timer++;
        if (data.timer > 1) {
            data.aksi = "lari";
        }
        hapusLayar();
        sprite(data, data.frm1);
    }
    //console.log(fr);
}

function grid() {
    var totalX = screenW / 100;
    var totalY = screenH / 100;
    garis(3, 3, screenW, 3, 3, "#ff6969");
    garis(3, 3, 3, screenH, 3, "#4d94ff");
    for (var i = 0; i <= totalX; i++) {
        if (i > 0) {
            teks(i * 100, i * 100, 20, "bold 10pt Calibri-center-#ff6969");
            garis(i * 100, 25, i * 100, screenH, 0.8, "#ff6969");
        }
        for (var j = 0; j < 10; j++) {
            garis(i * 100 + j * 10, 3, i * 100 + j * 10, screenH, 0.3, "#ffffff");
        }
    }
    for (i = 0; i <= totalY; i++) {
        if (i > 0) {
            teks(i * 100, 8, i * 100 + 3, "bold 10pt Calibri-left-#4d94ff");
            garis(30, i * 100, screenW, i * 100, 0.8, "#4d94ff");
        }
        for (j = 0; j < 10; j++) {
            garis(3, i * 100 + j * 10, screenW, i * 100 + j * 10, 0.3, "#ffffff");
        }
    }

}
function garis(x1, y1, x2, y2, tbl = 1, clr = "#000", st = "") {
    if (st.length > 0) {
        var stx = st.split("-");
        if (stx[0] == "dash") {
            if (stx[1] == undefined || stx[1] == null)
                stx[1] = 5;
            if (stx[2] == undefined || stx[2] == null)
                stx[2] = 3;
            var dashArr = [];
            for (var i = 1; i < stx.length; i++) {
                dashArr.push(stx[i]);
            }
            konten.setLineDash(dashArr);
        }
    }
    konten.strokeStyle = clr;
    konten.lineWidth = tbl;
    konten.beginPath();
    konten.moveTo(x1, y1);
    konten.lineTo(x2, y2);
    konten.stroke();
    konten.setLineDash([]);
}

var kedip = 0;
function cekAlign(txt) {
    var res = txt;
    if (txt == "tengah")
        res = "center";
    if (txt == "kiri")
        res = "left";
    if (txt == "kanan")
        res = "kanan";
    return res;
}
function cekWarna(txt) {
    var res = txt;
    var cl = txt.split("|");
    if (cl[0] == "hitam")
        res = "black";
    if (cl[0] == "putih")
        res = "white";
    if (cl[0] == "biru")
        res = "#0066ff";
    if (cl[0] == "hijau")
        res = "#39f43e";
    if (cl[0] == "merah")
        res = "#ed2d2d";
    if (cl[0] == "jingga")
        res = "#ffd146";
    if (cl[0] == "kuning")
        res = "#ffea00";
    if (cl[0] == "ungu")
        res = "#b026ff";
    if (cl[0] == "pink")
        res = "#ff7e7e";
    if (cl[0] == "tosca")
        res = "#0faf9a";
    if (cl[0] == "abuabu")
        res = "#7a7a7a";
    var res2 = "none";
    if (cl.length > 1) {
        if (cl[1] == "hitam")
            res2 = "black";
        if (cl[1] == "putih")
            res2 = "white";
        if (cl[1] == "biru")
            res2 = "#0066ff";
        if (cl[1] == "hijau")
            res2 = "#39f43e";
        if (cl[1] == "merah")
            res2 = "#ed2d2d";
        if (cl[1] == "jingga")
            res2 = "#ffd146";
        if (cl[1] == "kuning")
            res2 = "#ffea00";
        if (cl[1] == "ungu")
            res2 = "#b026ff";
        if (cl[1] == "pink")
            res2 = "#ff7e7e";
        if (cl[1] == "tosca")
            res2 = "#0faf9a";
        if (cl[1] == "abuabu")
            res2 = "#7a7a7a";
    }
    var ob = {c1: res, c2: res2}
    return ob;
}
function teks(txt, px, py, stl = "") {
    var efek = 0;
    var st = stl.split("-");
    if (stl == "") {
        konten.font = "bold 14pt Calibri";
        konten.fillStyle = '#ffffff';
        konten.textAlign = 'center';
    } else {
        if (st[0].length < 8) {
            var fnt = "bold " + st[0] + "pt Calibri";
            st[0] = fnt;
        }
        if (st.length == 1) {
            konten.font = st[0];
            konten.fillStyle = '#ffffff';
            konten.textAlign = 'center';
        }
        if (st.length == 2) {
            konten.font = st[0];
            konten.fillStyle = '#ffffff';
            konten.textAlign = cekAlign(st[1]);
        }
        if (st.length == 3) {
            konten.font = st[0];
            konten.fillStyle = cekWarna(st[2]).c1;
            konten.textAlign = cekAlign(st[1]);
            //stroke
            if (cekWarna(st[2]).c2 != "none") {
                konten.strokeStyle = cekWarna(st[2]).c2;
            }
        }
        if (st.length == 4) {
            konten.font = st[0];
            konten.fillStyle = cekWarna(st[2]).c1;
            //stroke
            if (cekWarna(st[2]).c2 != "none") {
                konten.strokeStyle = cekWarna(st[2]).c2;
            }
            konten.textAlign = cekAlign(st[1]);
            //kedip
            if (st[3] == "kedip") {
                efek = 1;
                kedip++;
                if (kedip > 30)
                    kedip = 0;
            }
        }
    }
    if (efek == 1 && kedip < 13) {
        if (st.length > 3 && cekWarna(st[2]).c2 != "none")
            konten.strokeText(txt, px, py);
        konten.fillText(txt, px, py);
    }
    if (efek == 0) {
        if (st.length > 3 && cekWarna(st[2]).c2 != "none")
            konten.strokeText(txt, px, py);
        konten.fillText(txt, px, py);
}
}
//--- shoot ---
var shotTime = 0;
var bulletData = [];
function tembak(data, sx, sy) {
    if (shotTime == 0) {
        if (data.isiPeluru == undefined)
            data.isiPeluru = 10;
        shotTime = data.isiPeluru;
        var ob = new Object();
        ob.x = data.x;
        ob.y = data.y;
        ob.sx = sx;
        ob.sy = sy;
        ob.img = data.peluru;
        ob.lebar = ob.img.width;
        ob.tinggi = ob.img.height;
        ob.frame = 1;
        ob.owner = data;
        ob.cek = 0;
        ob.mati = false;
        bulletData.push(ob);
        //suara
        if (data.suaraPeluru != undefined) {
            playSound(data.suaraPeluru);
        }
    }
}

function playSound(snd) {
    var sa = new Sound(snd);
    sa.play();
}

var musikReady = 0;

function musik(snd) {
    if (musikReady == 0) {
        game.musik = new Sound(snd);
        game.musik.loop();
        game.musik.volume(0.20);
        musikReady = 1;
    }
}

function aturPeluru() {
    if (shotTime > 0 && !game.pause)
        shotTime--;
    for (var i = 0; i < bulletData.length; i++) {
        var ob = bulletData[i];
        if (!game.pause) {
            ob.x += ob.sx;
            ob.y += ob.sy;
        }
        //tampilkan
        sprite(ob);
        //cek musuh
        ob.cek++;
        if (ob.cek > enemyData.length)
            ob.cek = 0;
        if (enemyData[ob.cek] != undefined) {
            //cek tabrakan dengan musuh dengan sistem jarak
            var eb = enemyData[ob.cek];
            if (jarak(ob.x, ob.y, eb.x, eb.y) < eb.lebar * 0.8 && ob.owner == eb.hero) {
                if (eb.suaraLedakan != undefined)
                    playSound(eb.suaraLedakan);
                ledakan(eb.ledakan, eb.x, eb.y);
                ob.mati = true;
                eb.mati = true;
                if (eb.nilai == undefined)
                    eb.nilai = 1;
                tambahScore(eb.nilai);
            }
        }
        //cek hero
        if (ob.owner != hero) {
            if (jarak(ob.x, ob.y, hero.x, hero.y) < hero.lebar * 0.8) {
                if (hero.suaraLedakan != undefined)
                    playSound(hero.suaraLedakan);
                ledakan(hero.ledakan, hero.x, hero.y);
                ob.mati = true;
                hero.mati = true;
                game.aktif = false;
            }
        }
        if (ob.x < 0 || ob.x > screenW || ob.y < 0 || ob.y > screenH || ob.mati) {
            //keluar layar
            bulletData.splice(i, 1);
        }
    }
    aturLedakan();
}

function acak(num) {
    return Math.floor(Math.random() * num);
}

function jarak(x1, y1, x2, y2) {
    var res = 0;
    res = Math.sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1));
    return res;
}

var enemyData = [];

function aturMusuh(data, data2) {
    if (enemyData.length < data.jumlahMax && acak(100) == 34 && !data2.mati && !game.pause) {
        var ob = new Object();
        //kordinat awal keluarnya musuh
        if (data.start == undefined) {
            data.start = "acak";
            ob.x = 0;
            ob.y = 0;
        }
        if (data.start == "acak") {
            if (acak(10) < 5) {
                ob.x = acak(screenW - data.lebar) + data.lebar;
                if (acak(10) < 5) {
                    ob.y = -data.tinggi;
                } else {
                    ob.y = screenH + data.tinggi;
                }
            } else {
                ob.y = acak(screenH - data.tinggi);
                if (acak(10) < 5) {
                    ob.x = screnW + data.lebar;
                } else {
                    ob.x = -data.lebar;
                }
            }
        }
        if (data.start == "kiri") {
            ob.y = acak(screenH - data.tinggi * 4);
            ob.x = -data.lebar;
        }
        if (data.start == "kanan") {
            ob.y = acak(screenH - data.tinggi * 4);
            ob.x = screenW + data.lebar;
        }
        if (data.start == "atas") {
            ob.y = -data.tinggi;
            ob.x = acak(screenW - data.lebar * 4) + data.lebar;
        }
        if (data.start == "bawah") {
            ob.y = screenH + data.tinggi;
            ob.x = acak(screenW - data.lebar * 4) + data.lebar;
        }

        //jenis musuh
        if (data.jenisMusuh == undefined)
            ob.tipe = 1;
        ob.tipe = acak(data.jenisMusuh) + 1;
        ob.frame = ob.tipe;
        ob.aktif = 1;
        if (data.kecepatan == undefined)
            data.kecepatan = 4;
        ob.kecepatan = 1 + acak(data.kecepatan);
        ob.arah = 0;
        ob.lebar = data.lebar;
        ob.tinggi = data.tinggi;
        ob.nilai = data.nilai;
        ob.img = data.img;
        ob.start = data.start;
        ob.mati = false;
        ob.hero = data2;
        ob.suaraLedakan = data.suaraLedakan;
        ob.suaraPeluru = data.suaraPeluru;
        if (data.peluru != undefined) {
            ob.shoot = true;
            ob.peluru = data.peluru;
        } else {
            ob.shoot = false;
        }
        enemyData.push(ob);
        //console.log("musuh keluar " +ob.tipe +" >>"+enemyData.length);
    }
    //gerakkan semua musuh
    for (var i = 0; i < enemyData.length; i++) {
        var eb = enemyData[i];
        if (eb.start == "atas") {
            if (!game.pause) {
                eb.y += eb.kecepatan;
                if (eb.arah == 0 && acak(100) == 34) {
                    if (acak(10) < 5) {
                        eb.arah = 1;
                    } else {
                        eb.arah = 2;
                    }
                }
                if (eb.arah > 0 && acak(50) == 34)
                    eb.arah = 0;
                if (eb.arah == 1)
                    eb.x += 2;
                if (eb.arah == 2)
                    eb.x -= 2;
                //tembak
                if (eb.shoot && acak(100) == 34)
                    tembak(eb, 0, 10 + eb.tipe / 2);
            }
        }
        //tampilkan di layar
        sprite(eb);
        //menabrak hero
        if (jarak(eb.x, eb.y, eb.hero.x, eb.hero.y) < eb.lebar / 2 && !eb.hero.mati) {
            eb.mati = true;
            eb.hero.mati = true;
            game.aktif = false;
            if (eb.suaraLedakan != undefined)
                playSound(eb.suaraLedakan);
            ledakan(eb.ledakan, eb.x, eb.y);
            ledakan(eb.hero.ledakan, eb.hero.x, eb.hero.y);
        }
        //keluar dari layar
        if (eb.x < -eb.lebar * 2 || eb.x > screenW + eb.lebar * 2 || eb.y < -eb.tinggi * 2 || eb.y > screenH + eb.tinggi * 2 || eb.mati) {
            enemyData.splice(i, 1);
        }

    }
}
//-----------ledakan------
var blowData = [];
function ledakan(img, x, y) {
    var ob = new Object();
    ob.x = x;
    ob.y = y;
    ob.frame = 0;
    ob.maxFrame = 16;
    if (img == undefined) {
        ob.img = dataGambar.ledakan;
    } else {
        ob.img = img;
    }
    ob.lebar = ob.img.width / 4;
    ob.tinggi = ob.img.height / 4;
    ob.skala = (10 + acak(5)) / 10;
    ob.rotasi = acak(360)
    blowData.push(ob);
}

function aturLedakan() {
    for (var i = 0; i < blowData.length; i++) {
        var ob = blowData[i];
        if (!game.pause)
            ob.frame++;
        if (ob.frame > ob.maxFrame) {
            blowData.splice(i, 1);
            //game over
            if (game.gameOver) {
                resetGame();
                jalankan(game.func);
            }
        } else {
            sprite(ob, ob.frame);
        }
    }
}

function resetGame() {
    //if (game.musik != undefined) game.musik.stop();
    clearInterval(game.loop);
    game.aktif = true;
    hero.mati = false;
    enemyData = [];
    bulletData = [];
    blowData = [];
    score = 0;
}

function setGameOver(kondisi, func) {
    game.gameOver = kondisi;
    game.func = func;
}

//bg 
var bgx = 0;
var bgy = 0;
function latar(img, sx = 0, sy = 0) {
    if (!game.pause)
        bgx += sx;
    if (bgx > img.width)
        bgx -= img.width;
    if (bgx < 0)
        bgx += img.width;
    if (!game.pause)
        bgy += sy;
    if (bgy > img.height)
        bgy -= img.height;
    if (bgy < 0)
        bgy += img.height;
    //tile 
    var tx = Math.ceil(screenW / img.width);
    var ty = Math.ceil(screenH / img.height);
    for (var i = -1; i < tx; i++) {
        for (var j = -1; j < ty; j++) {
            konten.drawImage(img, 0, 0, img.width, img.height, i * img.width + bgx, j * img.height + bgy, img.width, img.height);
        }
}
}

function tambahScore(nl) {
    score += nl;
    if (score > hiscore)
        hiscore = score;
}


//-------- add to game lib
function acakArray(arr) {
    for (var i = 0; i < arr.length; i++) {
        var temp = arr[i];
        var ac = acak(arr.length)
        arr[i] = arr[ac];
        arr[ac] = temp;
    }
    return arr;
}

//-------- mouse ------
function cekHit(ob1, ob2) {
    var res = false;
    if (ob1.x > ob2.x - ob2.lebar / 2 && ob1.x < ob2.x + ob2.lebar / 2 && ob1.y > ob2.y - ob2.tinggi / 2 && ob1.y < ob2.y + ob2.tinggi / 2)
        res = true;
    return res;
}


var movingOb = {};
function efekMasuk(nama, img, px, py, asal) {
    if (movingOb[nama] == undefined) {
        movingOb[nama] = new Object();
        if (asal == "kiri") {
            movingOb[nama].x = -img.width * 2;
            movingOb[nama].y = py;
        }
        if (asal == "kanan") {
            movingOb[nama].x = game.lebar + img.width * 2;
            movingOb[nama].y = py;
        }
        if (asal == "atas") {
            movingOb[nama].x = game.lebar / 2;
            movingOb[nama].y = -img.height * 2;
        }
        if (asal == "bawah") {
            movingOb[nama].x = game.lebar / 2;
            movingOb[nama].y = game.tinggi + img.height * 2;
        }
        movingOb[nama].img = img;
    } else {
        //gerakkan
        if (jarak(movingOb[nama].x, movingOb[nama].y, px, py) < 2) {
            movingOb[nama].x = px;
            movingOb[nama].y = py;
        } else {
            movingOb[nama].x += (px - movingOb[nama].x) / 10;
            movingOb[nama].y += (py - movingOb[nama].y) / 10;
        }
    }
    sprite(movingOb[nama]);
}
