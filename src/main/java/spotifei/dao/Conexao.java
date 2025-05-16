/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package spotifei.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author Rafael
 */
    public class Conexao {
    private static final String URL = "jdbc:postgresql://aws-0-sa-east-1.pooler.supabase.com:5432/<NOME_DO_BANCO>";
    private static final String USUARIO = "postgres.nhhrcbdnhlhxqjnygohp";
    private static final String SENHA = "<SUA_SENHA_DO_SUPABASE>";

    public static Connection conectar() {
        try {
            return DriverManager.getConnection(URL, USUARIO, SENHA);
        } catch (SQLException e) {
            System.out.println("Erro de conexão: " + e.getMessage());
            return null;
        }
    }
}