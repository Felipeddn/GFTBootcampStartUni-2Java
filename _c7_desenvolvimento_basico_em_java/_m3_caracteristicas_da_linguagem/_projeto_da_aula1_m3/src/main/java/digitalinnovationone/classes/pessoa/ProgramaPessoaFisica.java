package digitalinnovationone.classes.pessoa;

public class ProgramaPessoaFisica 
{
    public static void main(String[] args)
    {
    final PessoaFisica pessoaFisica = new PessoaFisica(33, 100.5f);

    // relatório pode ser acessado porque Pessoa.java está no mesmo pacote e ela tem o modificador de acesso
        // protected
    System.out.println(pessoaFisica.relatorio());
    }
}