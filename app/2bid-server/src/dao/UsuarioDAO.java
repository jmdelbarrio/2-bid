package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Usuario;
import model.Sistema;



import exceptions.EmailYaExiste;
import exceptions.NicknameYaExiste;;

public class UsuarioDAO {
	//static Logger logger = Logger.getLogger(ClienteDAO.class);

	
	public Usuario insert(Usuario usuario) throws SQLException, EmailYaExiste, NicknameYaExiste {
		Connection connection = null;
		Statement ps;		
		
		String insert= "INSERT INTO 2bid.usuario " +
		"(nombre," +
		"email," +
		"nick," +
		"password," +
		"tipo," +
		"numero_tarjeta," +
		"fecha_alta)" +
		"VALUES " +
		"('" + usuario.getNombre() + 
		"','" + usuario.getEmail() + 
		"','" + usuario.getNick() + 
		"','" + usuario.getPassword() + 
		"','" + usuario.getTipo() +
		"','" + usuario.getNro_tarjeta() + 
		"',now());";
		
		connection = Sistema.getConnection();
		connection.setAutoCommit(false);
		Sistema.logger.debug("insertando usuario:" + usuario.getNick());
		
		try {
			Statement s=connection.createStatement();
			Sistema.logger.debug("verificando si el email existe");
			String sql_validation="select * from 2bid.usuario" +
					" where email='" + usuario.getEmail() + "'";
			Sistema.logger.debug(sql_validation);
            ResultSet rs = s.executeQuery(sql_validation);
            if (rs.next()) {
            	Sistema.logger.debug("El email ya existe");
                EmailYaExiste e2=new EmailYaExiste("El email ya existe, no se puede insertar usuario");
                throw e2;
            }
   
			Statement s1=connection.createStatement();
			Sistema.logger.debug("verificando si el nick existe");
			String sql_validation1="select * from 2bid.usuario" +
					" where nick='" + usuario.getNick() + "'";
			Sistema.logger.debug(sql_validation1);
            ResultSet rs1 = s1.executeQuery(sql_validation1);
            if (rs1.next()) {
            	Sistema.logger.debug("El nick ya existe");
                NicknameYaExiste e2=new NicknameYaExiste("El nick ya existe, no se puede insertar usuario");
                throw e2;
            }
                
		 
		Sistema.logger.debug(insert);
		
			ps = connection.createStatement();
			ps.executeUpdate(insert);
			connection.commit();	
			Statement s11 = connection.createStatement();
			Sistema.logger.debug("insert�:" + insert);
			String sql="select last_insert_id() id_usuario from 2bid.usuario;";
            ResultSet rs11 = s11.executeQuery(sql);
            while (rs11.next()) {
                usuario.setId_usuario(rs11.getInt("id_usuario"));
            }
			return usuario;
		}
		catch (SQLException e) {
		try {
				Sistema.logger.error("Error trying to insert usuario to the database: " + e.getMessage() + 
				"insert: " + insert);					
				connection.rollback();				
			} catch (SQLException e1) {					
				Sistema.logger.error(e1.getMessage());
			}
			throw e;
							
		}
		finally {
		connection.close();
		}
		
	}
	
	
}
