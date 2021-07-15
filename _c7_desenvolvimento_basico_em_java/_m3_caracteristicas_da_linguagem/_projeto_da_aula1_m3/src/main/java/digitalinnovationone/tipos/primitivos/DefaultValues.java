package digitalinnovationone.tipos.primitivos;

// Esse programa comprova a atribuição de valores padrões, esses valores podem ser consultados na documentaçao
// https://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html

public class DefaultValues {

    public static void main (String[] args){
        final Default d = new Default();

        // imprime 0, valor padrão atribuido a um valor inteiro.
        System.out.println(d.getI());

        // imprime false, valor padrão atribuído a um valor boolean.
        System.out.println(d.isActive());
    }
}

class Default {

    int i;
    boolean active;

    public int getI(){
        return i;
    }

    public boolean isActive(){
        return active;
    }
}