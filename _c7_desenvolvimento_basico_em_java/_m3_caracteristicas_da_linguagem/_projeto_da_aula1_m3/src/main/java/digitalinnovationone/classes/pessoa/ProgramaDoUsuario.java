package digitalinnovationone.classes.pessoa;

import digitalinnovationone.classes.usuario.SuperUsuario;

public class ProgramaDoUsuario {
    public static void main(String[] args) {
        final var batman = new SuperUsuario("batman", "1234");

        // Esse getLogin() é acessível porque ele é publico então outro pacote consegue acessa-lo.
        batman.getLogin();

        // Esse getSenha() não é acessível porque ele é protected, ou seja outro pacote não acessa. Descomente o comando para observar o erro.
        // batman.getSenha();

        // esse também não é publico, ele é default, dessa forma retorna um erro.
        // String nomeDoCliente = batman.nome;
    }
}