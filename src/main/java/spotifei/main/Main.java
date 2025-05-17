/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package spotifei.main;



import spotifei.dao.Conexao;
import java.sql.Connection;

public class Main {
    public static void main(String[] args) {
        Connection conn = Conexao.conectar();
        if (conn != null) {
            System.out.println("✅ Conexão bem-sucedida com o Supabase!");
        } else {
            System.out.println("❌ Falha na conexão.");
        }
    }
}
