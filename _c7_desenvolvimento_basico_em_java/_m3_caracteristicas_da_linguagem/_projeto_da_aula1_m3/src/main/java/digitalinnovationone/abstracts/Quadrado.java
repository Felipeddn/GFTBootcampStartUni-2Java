package digitalinnovationone.abstracts;

public class Quadrado extends FormaGeometrica 
{
    private String nome;
    private Double area;

    public Quadrado(final String nome, final Double area)
    {
        this.nome = nome;
        this.area = area;
    }

    @Override
    public String nome()
    {
        return nome;
    }

    @Override
    public Double area()
    {
        return area;
    }

    @Override
    public String toString()
    {
        // aqui com certeza vai dar ruim, sabia está dando erro vou ter que mexer aqui
        // final StringBuilder builder = "Quadrado [" +  "nome =""  + nome + """ + ",area = " + area + "]";

        
        final StringBuilder builder = "Quadrado [" +  "nome ="  + nome + ",area = " + area + "]";

        // vou ter que pesquisar esse erro: cannot convert from String to StringBuilder.
        // parece que não pode ter variável em uma stringbuilder 
        //https://stackoverflow.com/questions/16155800/type-mismatch-cannot-convert-from-stringbuilder-to-string/42432431

        return builder.toString();
    }
}