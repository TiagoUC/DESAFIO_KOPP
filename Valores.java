package DESAFIO_KOOP;

import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;
public class Valores {
    List<Double> lista = new ArrayList<>(Arrays.asList(88.00, 130.00, 54.90, 293.30, 44.80));
    int[] contadorRemessas = new int[lista.size()];
    double soma = 0;

    void numRemessas() {
        int tamanhoLista = lista.size();

        if (tamanhoLista > 0) {
            contadorRemessas[0] = 1;  // O primeiro elemento recebe 1 por padrão
        }

        for (int i = 1; i < tamanhoLista; i++) {
            contadorRemessas[i] = contadorRemessas[i - 1] + 1;
        }
    }
    void somaRemessas() {
        for (int i = 0; i < lista.size(); i++) {
            soma += lista.get(i);
        }
    }
}
