package DESAFIO_KOOP;

public class Desafio_1 {
    public static void main(String[] args) {
        Valores valores = new Valores();
        valores.numRemessas();
        valores.somaRemessas();

        for (int i = 0; i < valores.lista.size(); i++) {
            System.out.println("Remessa gerada: " + valores.contadorRemessas[i] + ", cujo valor é: R$ " + valores.lista.get(i));
        }

        System.out.println("\nSoma dos valores das remessas: R$" + valores.soma);
    }
}