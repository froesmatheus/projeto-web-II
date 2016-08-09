/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.daos;

import db.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Noticia;

/**
 *
 * @author mathe
 */
public class NoticiaDAO {
    private final Connection con;
    
    public NoticiaDAO() throws SQLException, ClassNotFoundException {
        con = ConnectionFactory.getConnection();
    }
    
    public boolean insert(Noticia noticia) {
        try {
            PreparedStatement smt = con.prepareStatement("insert into noticias(titulo, resumo) values (?, ?)");
            
            smt.setString(1, noticia.getTitulo());
            smt.setString(2, noticia.getResumo());
            
            int affectedRows = smt.executeUpdate();
               
            return affectedRows > 0;
        } catch (SQLException ex) {
            Logger.getLogger(NoticiaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return false;
    }
    
    public boolean update(Noticia noticia) {
        try {
            PreparedStatement smt = con.prepareStatement("update noticias set titulo=?, resumo=? where id=?");
            
            smt.setString(1, noticia.getTitulo());
            smt.setString(2, noticia.getResumo());
            smt.setInt(3, noticia.getId());
            
            int affectedRows = smt.executeUpdate();
               
            return affectedRows > 0;
        } catch (SQLException ex) {
            Logger.getLogger(NoticiaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return false;
    }
    
    
    public boolean delete(int id) {
        try {
            PreparedStatement smt = con.prepareStatement("delete from noticias where id=?");
            
            smt.setInt(1, id);
            
            int affectedRows = smt.executeUpdate();
               
            return affectedRows > 0;
        } catch (SQLException ex) {
            Logger.getLogger(NoticiaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return false;
    }
    
    public List<Noticia> select() {
        List<Noticia> lista = new ArrayList<>();
        
        try {
            PreparedStatement smt = con.prepareStatement("select * from noticias order by id desc");
            
            ResultSet rs = smt.executeQuery();
            
            while (rs.next()) {
                Noticia noticia = new Noticia();
                
                noticia.setId(rs.getInt("id"));
                noticia.setTitulo(rs.getString("titulo"));
                noticia.setResumo(rs.getString("resumo"));
                
                lista.add(noticia);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NoticiaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return lista;
    }
    
    public List<Noticia> where(String query) {
        List<Noticia> lista = new ArrayList<>();
        
        try {
            PreparedStatement smt = con.prepareStatement("select * from noticias where lower(titulo) like lower(?) or lower(resumo) like lower(? order by id desc)");
            
            smt.setString(1, "%" + query + "%");
            smt.setString(2, "%" + query + "%");
            
            ResultSet rs = smt.executeQuery();
            
            while (rs.next()) {
                Noticia noticia = new Noticia();
                
                noticia.setId(rs.getInt("id"));
                noticia.setTitulo(rs.getString("titulo"));
                noticia.setResumo(rs.getString("resumo"));
                
                lista.add(noticia);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NoticiaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return lista;
    }
    
    public Noticia select(int id) {
        Noticia noticia = null;
        
        try {
            PreparedStatement smt = con.prepareStatement("select * from noticias where id=? order by id desc");
            
            smt.setInt(1, id);
            
            ResultSet rs = smt.executeQuery();
            
            while (rs.next()) {
                noticia = new Noticia();
                
                noticia.setId(rs.getInt("id"));
                noticia.setTitulo(rs.getString("titulo"));
                noticia.setResumo(rs.getString("resumo"));                
            }
        } catch (SQLException ex) {
            Logger.getLogger(NoticiaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return noticia;
    }
}
