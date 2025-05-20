//utilizado no melhorias.jsp
keyPressed = function (evt){
    evt = evt || window.event;
    var key = evt.keyCode || evt.which;
    return String.fromCharCode(key); 
};

document.onkeypress = function(evt) {
    var str = keyPressed(evt);
    
    if(str === '\''){
        alert("Não utilizar aspas simples ou duplas. A gravação destes caracteres não é permitida");
    }
    
    var kent = window.event.keyCode;
    if(kent.keyCode === 13){
        alert("ENTER");
    }
};
//marcoslima82@gmail.com

onTestChange = function(evento) {
    var key = window.event.keyCode;

    // If the user has pressed enter
    if (key === 13) {
        document.getElementById("txtArea").value = document.getElementById("txtArea").value + "\n&#013";
        return false;
    }
    else {
        return true;
    }
};