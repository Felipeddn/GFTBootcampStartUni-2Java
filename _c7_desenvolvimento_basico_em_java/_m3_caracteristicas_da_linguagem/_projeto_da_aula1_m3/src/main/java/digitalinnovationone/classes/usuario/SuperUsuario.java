package digitalinnovationone.classes.usuario;

public class SuperUsuario {
    // Esses são os atributos da classe. 
    //Eles são privados e não podem ser acessados em outra classe.
    private String login;
    private String senha;

    // O modificador dessa linha de comando é default
    String nome;

    // Esse é o método construtor.
    public SuperUsuario(final String login, final String senha){
        this.login = login;
        this.senha = senha;
    }

    // Esses são os métodos da classe.
    public String getLogin() {
        return login;
    }

    // Ele é visível para todas as classes que estão dentro do pacote. Fora desse pacote não é vísível.
    protected String getSenha() {
        return senha;
    }
}
