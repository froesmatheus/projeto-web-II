/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

/**
 *
 * @author mathe
 */
public class Noticia {
    private int id;
    private String titulo;
    private String resumo;
    
    public Noticia(String titulo, String conteudo) {
        this.titulo = titulo;
        this.resumo = conteudo;
    }

    public Noticia() {

    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @return the titulo
     */
    public String getTitulo() {
        return titulo;
    }

    /**
     * @param titulo the titulo to set
     */
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    /**
     * @return the resumo
     */
    public String getResumo() {
        return resumo;
    }

    /**
     * @param resumo the resumo to set
     */
    public void setResumo(String resumo) {
        this.resumo = resumo;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }   
}
