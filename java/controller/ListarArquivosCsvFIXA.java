package controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ListarArquivosCsvFIXA {
	
	public List<String> listarArquivosCSVFIXA(String diretorio) {
        List<String> arquivosCSV = new ArrayList<>();
        File pasta = new File("/diretoria/arquivo/fixa");
        File[] arquivos = pasta.listFiles();

        if (arquivos != null) {
            for (File arquivo : arquivos) {
                if (arquivo.isFile() && arquivo.getName().toLowerCase().endsWith(".csv")) {
                    arquivosCSV.add(arquivo.getName());
                }
            }
        }

        Collections.sort(arquivosCSV, Collections.reverseOrder());
        
        return arquivosCSV;
    }

}
