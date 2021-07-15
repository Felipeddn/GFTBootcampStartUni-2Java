package digitalinnovationone.classes.usuario;

public class ProgramaDoSuperUsuario {

    public  static void main(String[] args){
        // the words under gray box is the arguments to constructor method.
        final var superUsuario = new SuperUsuario("root","1234");

        superUsuario.getLogin();

        superUsuario.getSenha();

        String root = superUsuario.nome;
    }
}
