package digitalinnovationone.abstracts;

// Uma classe abstrata é apenas a idéia de uma classe 
public abstract class FormaGeometrica 
{
    public abstract String nome();
    public abstract Double area();

    public String desenha(int x, int y)
    {
        // cara esse jeito de escrever deve ser algo que ficou depreciado no Java 11
        // return "Desenhando nas coordenadas X=$x Y:$y";
        return "Desenhando nas coordenadas X = " + x + " Y :" + y;
    }
}