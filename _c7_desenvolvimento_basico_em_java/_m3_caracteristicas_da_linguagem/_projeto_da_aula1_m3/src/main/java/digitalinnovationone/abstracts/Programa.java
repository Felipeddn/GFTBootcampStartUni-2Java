package digitalinnovationone.abstracts;

public class Programa 
{
    public static void main(String[] args)
    {

        // a linha abaixo prova que a forma geométrica não pode ser instanciada, porque ela é 
        // abstract
        // final FormaGeometrica formaGeometrica = new FormaGeometrica();

        final FormaGeometrica quadrado = new Quadrado("quadrado", 10.0);

        System.out.println(quadrado + "\n\n" );

        System.out.println(quadrado.desenha(12, 34));
        System.out.println(quadrado.nome());
        System.out.println(quadrado.area());
    }
}