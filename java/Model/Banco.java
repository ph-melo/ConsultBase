
package Model;


public class Banco {
  
    private int id;
    private String hostname;
    private int porta;
    private String servico;
    private String usuario;
    private String senha;
    private int enviasms;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHostname() {
        return hostname;
    }

    public void setHostname(String hostname) {
        this.hostname = hostname;
    }

    public int getPorta() {
        return porta;
    }

    public void setPorta(int porta) {
        this.porta = porta;
    }

    public String getServico() {
        return servico;
    }

    public void setServico(String servico) {
        this.servico = servico;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public int getEnviasms() {
        return enviasms;
    }

    public void setEnviasms(int enviasms) {
        this.enviasms = enviasms;
    }
    
    
}
