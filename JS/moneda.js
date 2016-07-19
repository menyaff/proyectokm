formatoMoneda = function (numero){
    var output = "";
    //Decimal
    var decimales = 2;
    output = Math.round(numero).toFixed(decimales);


    //output = (numero + "").replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"); // 43,434

    return output;
};

console.log(formatoMoneda(500));

function redondeo(num, decimales) {
    var t=Math.pow(10, decimales);   
    return (Math.round((num * t) + (decimales>0?1:0)*(Math.sign(num) * (10 / Math.pow(100, decimales)))) / t).toFixed(decimales);
}