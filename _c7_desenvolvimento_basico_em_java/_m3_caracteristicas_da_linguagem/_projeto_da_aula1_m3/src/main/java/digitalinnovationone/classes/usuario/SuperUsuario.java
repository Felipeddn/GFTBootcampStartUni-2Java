package digitalinnovationone.classes.usuario;

public class SuperUsuario {
    // Esses são os atributos da classe.
    private String login;
    private String senha;
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

    protected String getSenha() {
        return senha;
    }
}
