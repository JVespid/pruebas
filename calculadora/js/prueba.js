
const numerosHexadecimal = "ABCDEFGHIJK";
const numerosHexadecimalMin = "abcdefghijk";

const BaseInicial = document.querySelector(".baseI");
const BaseFinal = document.querySelector(".baseF");

const NumeroInicial = document.querySelector("#NumeroI");
const NumeroFinal = document.querySelector(".resultado");


let PrimerParteCatena = 0;


const Main = () => {

    NumeroInicial.addEventListener("keyup", Operacion_Completa);
    BaseInicial.addEventListener("keyup", Operacion_Completa);
    BaseFinal.addEventListener("keyup", Operacion_Completa);

}

const Operacion_Completa = () => {

    let primer_condicionalLetras, segudo_condicionalLetras, condicionalPunto, primer_condicionalNumeros, segudo_condicionalNumeros;

    let entrar = true;

    for (let i = 0; i < NumeroInicial.value.length; i++) {

        primer_condicionalLetras = NumeroInicial.value[i] >= "a" || NumeroInicial.value[i] >= "A";
        segudo_condicionalLetras = NumeroInicial.value[i] <= "k" || NumeroInicial.value[i] <= "K";

        condicionalPunto = NumeroInicial.value[i] <= ".";

        primer_condicionalNumeros = parseInt(NumeroInicial.value[i]) >= 0;
        segudo_condicionalNumeros = parseInt(NumeroInicial.value[i]) <= 9;

        if (!((primer_condicionalLetras && segudo_condicionalLetras) || (primer_condicionalNumeros && segudo_condicionalNumeros) || condicionalPunto)) {
            entrar = false;
            break;
        }
    }


    if (entrar) {

        const baseFinal = BaseFinal.value;
        const ObtensionDatos = NumeroInicial.value.split(".", 2);

        let unidad_decimal, ResultadoCualquierBase;

        if (ObtensionDatos.length != 2) {

            unidad_decimal = CualquieraADecimal(ObtensionDatos[0], "00");

        } else if (ObtensionDatos.length === 2) {
            unidad_decimal = CualquieraADecimal(ObtensionDatos[0], ObtensionDatos[1]);
        }



        if (baseFinal === "") {

            NumeroFinal.value = unidad_decimal;

        } else if(baseFinal != 1 && unidad_decimal != "Valores no aprobados") {

            ResultadoCualquierBase = DeDecimalACualquiera(unidad_decimal + "");
            NumeroFinal.value = ResultadoCualquierBase;

        }else NumeroFinal.value = "Hay un valor Invalido";

    } else NumeroFinal.value = "Hay un valor Invalido";


}

const Obtener_Unidad = (_Datos, _i) => {

    let unidad, unidadInt;

    unidad = _Datos[_i];
    unidadInt = parseFloat(unidad)

    if ((unidad >= "a" && unidad <= "k") || unidad >= "A" && unidad <= "K")  for (let i = 0; i < 11; i++) {

            if (numerosHexadecimal[i] === unidad || numerosHexadecimalMin[i] === unidad) {
                unidadInt = i + 10;
                break;
            }

        }
    

    return unidadInt;


}

const CualquieraADecimal = (_ObtensionDatos1, _ObtensionDatos2) => {

    let baseInicial = BaseInicial.value;

    if (baseInicial == "") baseInicial = 10;

    let unidadInt; let totalDecimal = 0, aprobado = true;

    let multiplicar;

    if (_ObtensionDatos2 === "00") {


        multiplicar = (Math.pow(baseInicial, (_ObtensionDatos1.length - 1)));

        for (let i = 0; i < _ObtensionDatos1.length; i++) {

            unidadInt = Obtener_Unidad(_ObtensionDatos1, i);

            if (unidadInt < baseInicial) {

                totalDecimal += unidadInt * multiplicar;
                multiplicar = multiplicar / baseInicial;
            } else {
                aprobado = false;
                break;
            }
        }

        PrimerParteCatena = totalDecimal;


    } else {

        for (let i = 0; i < _ObtensionDatos2.length; i++) {

            unidadInt = Obtener_Unidad(_ObtensionDatos2, i);

            if (unidadInt < baseInicial) {

                multiplicar = Math.pow(baseInicial, 0 - (i + 1));
                totalDecimal += unidadInt * multiplicar;

            } else {
                aprobado = false;
                break;
            }

        }

        totalDecimal = Number(PrimerParteCatena + totalDecimal).toFixed(15);

    }

    if (!aprobado)  return totalDecimal = "Valores no aprobados";
    else return totalDecimal;

}

const DeDecimalACualquiera = (_unidad_decimal) => {

    let baseFinal = parseInt(BaseFinal.value);

    let arrayUnidadDecimal = _unidad_decimal.split(".", 2);

    let unidadInt, unidad = "", resultado = [];

    unidadInt = parseInt(arrayUnidadDecimal[0]);

    for (let i = 0; (unidadInt != 0 || resultado[i - 1] != 0); i++) {

        resultado[i] = (unidadInt % baseFinal);
        unidadInt = Math.trunc(unidadInt / baseFinal);
    }

    for (let i = (resultado.length - 2); i >= 0; i--) {

        if (resultado[i] >= 10 && resultado[i] <= 20) unidad = unidad + numerosHexadecimal[resultado[i] - 10];
        else unidad = unidad + resultado[i];
        

    }


    if(arrayUnidadDecimal.length === 2){
        
        let temp = Number(parseFloat(_unidad_decimal) - Math.trunc(parseFloat(_unidad_decimal))).toFixed(15) ;
        
        let decimalArray = [], decimal = "";

        for (let i = 0; temp != 0 && i <15; i++) {
            
            decimalArray[i] = Math.trunc(temp * baseFinal);

            temp = Number(temp * baseFinal).toFixed(15) - decimalArray[i];
            
        }

        for (let i = 0; i < decimalArray.length; i++) {

            if (decimalArray.length == 15 && i == 14) decimalArray[i]++

            if (decimalArray[i] >= 10 && decimalArray[i] <= 20) decimal = decimal + numerosHexadecimal[decimalArray[i] - 10];
            else decimal = decimal + decimalArray[i];
            
        }
        
        unidad = unidad + "." + decimal;
    }
    

    
    return unidad



}

Main();


document.getElementById('NumeroI').addEventListener('keydown', inputCharacters);
document.getElementById('BaseI').addEventListener('keydown', inputCharacters1);
document.getElementById('BaseF').addEventListener('keydown', inputCharacters2);

function inputCharacters(event) {

    if (event.keyCode == 13) {
    document.getElementById('BaseI').focus();
    }

}

function inputCharacters1(event) {

    if (event.keyCode == 13) {
    document.getElementById('BaseF').focus();
    }

}

function inputCharacters2(event) {

    if (event.keyCode == 13) {
    document.getElementById('NumeroI').focus();
    }

}

