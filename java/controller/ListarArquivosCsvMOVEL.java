package controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ListarArquivosCsvMOVEL {
	
	public List<String> listarArquivosCSVMOVEL(String diretorio) {
        List<String> arquivosCSV = new ArrayList<>();
        File pasta = new File("/diretoria/arquivo/movel");
        File[] arquivos = pasta.listFiles();

        if (arquivos != null) {
            for (File arquivo1 : arquivos) {
                if (arquivo1.isFile() && arquivo1.getName().toLowerCase().endsWith(".csv")) {
                    arquivosCSV.add(arquivo1.getName());
                }
            }
        }

        Collections.sort(arquivosCSV, Collections.reverseOrder());
        
        return arquivosCSV;
    }

}
