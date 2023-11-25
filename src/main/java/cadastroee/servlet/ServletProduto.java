package cadastroee.servlet;


import cadastroee.dao.ProdutoDAO;
import cadastroee.model.Produto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet (name = "servletProduto" , value = "/ServletProduto")
public class ServletProduto extends HttpServlet {
    private static final long serialVersionUID = 1L ;
    private ProdutoDAO produtoDAO = new ProdutoDAO();
    private Produto produto = new Produto();
    public ServletProduto() {super(); }
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        String acao = request.getParameter("acao");
        if(acao != null && acao.equals("lista")) {
            lista(request, response);
        }

}
    protected void lista(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        List<Produto> produtos = produtoDAO.lista();
        PrintWriter w = response.getWriter();
        produtos.forEach( p -> w.println(p.getNome()));
    }
}
