package digitalinnovationone.classes.pessoa;

public class Pessoa {

    private Integer idade;
    private Float peso;

    public Pessoa() {}

    public Pessoa(final Integer idade)
    {
        this.idade = idade;
    }

    public Pessoa(final Integer idade, final Float peso)
    {
        this.idade = idade;
        this.peso = peso;
    }

    // cara esse git copilot é insano ele praticamente escreveu pra mim!!

    public Integer getIdade()
    {
        return this.idade;
    }

    public Float getPeso()
    {
        return peso;
    }

    // esse método será acessado pela classe ProgramaPessoaFisica.java porque está no mesmo pacote
    protected String relatorio ()
    {
        //foi resolvido um erro baseado nessa linha, então essa linha ficará diferente do visto no vídeo.
        return "Idade : " + idade + " e Peso: " + peso;
    }
}