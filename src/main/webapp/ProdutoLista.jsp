<%@ page import="java.util.List" %>
<%@ page import="cadastroee.model.Produto" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista de Produtos</title>
</head>
<body>

<h1>Lista de Produtos</h1>

<a href="ServletProdutoFC?acao=formIncluir">Incluir Novo Produto</a>

<%
    List<Produto> produtos = (List<Produto>) request.getAttribute("produtos");

    if (produtos != null && !produtos.isEmpty()) {
%>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Nome</th>
        <th>Quantidade</th>
        <th>Preço</th>
        <th>Ações</th>
    </tr>
    <% for (Produto produto : produtos) { %>
    <tr>
        <td><%= produto.getId() %></td>
        <td><%= produto.getNome() %></td>
        <td><%= produto.getQuantidade() %></td>
        <td><%= new DecimalFormat("#.##").format(produto.getPrecoVenda()) %></td>
        <td>
            <a href="ServletProdutoFC?acao=formAlterar&id=<%= produto.getId() %>">Alterar</a>
            |
            <a href="ServletProdutoFC?acao=excluir&id=<%= produto.getId() %>">Excluir</a>
        </td>
    </tr>
    <% } %>
</table>
<%
} else {
%>
<p>Nenhum produto encontrado.</p>
<%
    }
%>

</body>
</html>
