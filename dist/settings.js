var DOSWASMSETTINGS = {
    CLOUDSAVEURL: "",
    DEFAULTIMG: "",
    EXPORTDIR: "" // Default: export
}

var rando = Math.floor(Math.random() * Math.floor(100000));
var script = document.createElement('script');
script.src = 'script.js?v=' + rando;
document.getElementsByTagName('head')[0].appendChild(script);