package Model; 

public class Igfin {
	
	
	private int id;
	private String cidade;
	private String estado;
	private String instancia;
	private String contabranca;
	private String numerointerrupcao;
	private String dataabertura;
	private String datafechamento;
	private String tempointerrupcao;
	private String valorressarcimentofinal;
	private String creditointerrupcaoscm;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getCidade() {
		return cidade;
	}
	
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	 
	public String getEstado() {
		return estado;
	}
	
	public void setEstado(String estado) {
		this.estado = estado;
	}
	
	public String getInstancia() {
		return instancia;
	}
	
	public void setInstancia(String instancia) {
		this.instancia = instancia;
	}
	
	public String getContabranca() {
		return contabranca;
	}
	
	public void setContabranca(String contabranca) {
		this.contabranca = contabranca;
	}
	
	public String getNumerointerrupcao() {
		return numerointerrupcao;
	}
	
	public void setNumerointerrupcao(String numerointerrupcao) {
		this.numerointerrupcao = numerointerrupcao;
	}
	
	public String getDataabertura() {
		return dataabertura;
	}
	
	public void setDataabertura(String dataabertura) {
		this.dataabertura = dataabertura;
	}
	
	public String getDatafechamento() {
		return datafechamento;
	}
	
	public void setDatafechamento(String datafechamento) {
		this.datafechamento = datafechamento;
	}
	
	public String getTempointerrupcao(){
		return tempointerrupcao;
	}
	
	public void setTempointerrupcao(String tempointerrupcao) {
		this.tempointerrupcao = tempointerrupcao;
	}
	
	public String getValorressarcimentofinal() {
		return valorressarcimentofinal;
	}
	
	public void setValorressarcimentofinal(String valorressarcimentofinal) {
		this.valorressarcimentofinal = valorressarcimentofinal;
	}
	
	public String getCreditointerrupcaoscm() {
		return creditointerrupcaoscm;
	}
	
	public void setCreditointerrupcaoscm(String creditointerrupcaoscm) {
		this.creditointerrupcaoscm = creditointerrupcaoscm;
	}
}