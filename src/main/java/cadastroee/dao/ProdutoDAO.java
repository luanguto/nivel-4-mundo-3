package cadastroee.dao;

import cadastroee.model.Produto;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class ProdutoDAO {
    private String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private String url = "jdbc:sqlserver://localhost:1433;database=Loja;user=Loja;password=Loja;encrypt=true;trustServerCertificate=true;loginTimeout=10;";

    private Connection conectar() {
        Connection con = null;
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url);
            return con;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public List<Produto> lista() {
        List<Produto> produtos = new ArrayList<>();
        String read = "select * from produtos";
        try {
            Connection con = conectar();
            PreparedStatement prepared = con.prepareStatement(read);
            ResultSet res = prepared.executeQuery();

            while (res.next()) {
                int idProduto = res.getInt("idProduto");
                String nome = res.getString("nome");
                int quantidade = res.getInt("quantidade");
                float precoVenda = res.getFloat("precoVenda");
                produtos.add(new Produto(idProduto, nome, quantidade, precoVenda));
            }

            con.close();
            return produtos;

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}