package digitalinnovationone.tipos.primitivos;

public class Primitivos {
    //documentação dos tipos : https://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html

//    atalho para comentar e descomentar um valor: ctrl + /

    public static void main(String[] args1){
        //nenhum valor definido com tipos primitivos aceita valores nullos (null)

// tipo byte de tamanho 8 bits
//        byte nullbyte = null;

        byte b;
        byte maximob = 127;
        byte minimob = -128;
//        byte invalidob = 129;

//        tipo char tamanho 16 bits

        char c;
        char alfanumericoc = 'A';
        char numericoc = 15;
//        char alfanumericoinvalidoc = 'AA';
//        char numericoinvalidoc = -100;

//        tipo short tamanho 16 bits

        short s;
        short maximos = 32767;
        short minimos = -32768;

//        tipo int tamanho 32 bits

        int maximoint = 2147483647;
        int minimoint = -2147483648;
//        int invalidoint = -2147483649;

//        tipo long tamanho 64 bits
        long maximolong = 9223372036854775807l;
        long minimolong = -9223372036854775808l;
//        long invalidolong = 9223372036854775808l;

        // tipo float (numeros decimais) tamanho 32 bits

        float exemplofloat = 65f;
        float exemplo2float = 65.0f;
        float exemplo3float = -0.5f;

        // tipo double (decimal) tamanho 64 bits

        double exemplodouble = 1024.99;
        double exemplo2double = 10.2456;

        // tipo booleano apenas true e false

        boolean verdadeiro = true;
        boolean falso = false;
//        boolean naoarmazenaverdadeiro = "true";
//        boolean naoarmazenafalso = 'false';

        // variáveis não inicializadas não podem ser usadas
//        System.out.println("byte :" + b);

    }
}
