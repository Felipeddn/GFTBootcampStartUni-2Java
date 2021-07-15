package digitalinnovationone.tipos.tipagem;

public class TipagemForte {

    public static void main(String[] args){

        String text = "my text.";

        // esse comando comprova que não podemos alterar o tipo de uma variavel atribuindo outro valor.
        // text = 1000;

        Integer number = Integer.valueOf(1024);

        number = 512;
    }
}
