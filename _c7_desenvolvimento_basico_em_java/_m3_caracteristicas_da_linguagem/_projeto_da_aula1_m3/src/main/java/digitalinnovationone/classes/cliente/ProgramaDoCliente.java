package digitalinnovationone.classes.cliente;

public class ProgramaDoCliente 
{
    public static void main(String[] args)
    {
    final var cliente = new Cliente(18);

    // esses métodos são chamados publicos.
    cliente.getIdade();

    cliente.getPeso();

    // Já o método relátorio é protected.
    // System.out.println(cliente.relatorio());
    }
}

// Esse programa do cliente está em um pacote que contém uma classe herdeira do pacote pessoa e ela não consegue acessar o método relatorio.
// porque esse método é protected