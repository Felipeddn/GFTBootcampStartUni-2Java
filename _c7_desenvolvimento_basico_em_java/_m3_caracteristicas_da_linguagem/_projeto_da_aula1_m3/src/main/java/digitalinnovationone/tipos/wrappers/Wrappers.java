package digitalinnovationone.tipos.wrappers;

public class Wrappers {

    public static void main(String[] args){
        //Autoboxing
        // podemos acessar a classe desses objetos segurando ctrl e apertando o botão esquerdo do mouse
        // em cima do wrapper (tipo com maiúscula antes da variável).
        Byte b = 127;
        Byte b2 = -128;
        Byte nullByte = null;

        Character c = 'A';
        Character c2 = 15;

        Short s = 32767;
        Short s2 = -32768;

        Integer i = 2147483647;
        Integer i2 = -2147483648;

        Long l = 9223372036854775807l;
        Long l2 = -9223372036854775808L;

        Float f = 65f;
        Float f2 = 65.0f;
        Float f3 = -0.5f;

        Double d = 1024.99;
        Double d2 = 10.2456;

        Boolean verdadeiro = true;
        Boolean falso = false;

        // os wrappers possuem métodos que facilitam a programaçao
        Boolean metodoboleano = Boolean.getBoolean("false");
        Boolean metodobolean = Boolean.valueOf("true");
    }
}
