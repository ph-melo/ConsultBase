package controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class ListarArquivosCSV {
    public List<String> listarArquivosCSV(String diretorio) {
        List<String> arquivosCSV = new ArrayList<>();
        File pasta = new File(diretorio);

        if (pasta.exists() && pasta.isDirectory()) {
            File[] arquivos = pasta.listFiles((dir, name) -> name.toLowerCase().endsWith(".csv"));
            if (arquivos != null) {
                for (File arquivo : arquivos) {
                    arquivosCSV.add(arquivo.getName());
                }
            }
        }
        return arquivosCSV;
    }
}
