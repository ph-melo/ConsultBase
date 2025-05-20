package Model;

public class Solr {
	
	private String 	datasource;
	private String 	rowsfetched;
	private String 	documents;
	private String 	commited;
	private String 	mensagem;
	private String 	tempoexec;
	private String 	data;
	private String 	status;
	
	
	
	public String getRowsfetched() {
		return rowsfetched;
	}
	public void setRowsfetched(String rowsfetched) {
		this.rowsfetched = rowsfetched;
	}
	public String getTempoexec() {
		return tempoexec;
	}
	public void setTempoexec(String tempoexec) {
		this.tempoexec = tempoexec;
	}
	public String getDatasource() {
		return datasource;
	}
	public void setDatasource(String datasource) {
		this.datasource = datasource;
	}
	
	public String getDocuments() {
		return documents;
	}
	public void setDocuments(String documents) {
		this.documents = documents;
	}
	public String getCommited() {
		return commited;
	}
	public void setCommited(String commited) {
		this.commited = commited;
	}
	public String getMensagem() {
		return mensagem;
	}
	public void setMensagem(String mensagem) {
		this.mensagem = mensagem;
	}
	
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	

}
