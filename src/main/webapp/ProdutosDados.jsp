<%@ page import="cadastroee.model.Produto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cadastro de Produto</title>
</head>
<body>
<%
    Produto produto = (Produto) request.getAttribute("produto");
    String acao = (produto == null) ? "incluir" : "alterar";
%>
<h2><%= produto == null ? "Incluir Produto" : "Alterar Produto" %></h2>
<form action="ServletProdutoFC" method="post">
    <!-- Campo oculto para definir a ação a ser realizada -->
    <input type="hidden" name="acao" value="<%= acao %>">

    <!-- Campo oculto para enviar o ID do produto quando a ação for alterar -->
    <% if ("alterar".equals(acao)) { %>
    <input type="hidden" name="id" value="<%= produto.getId() %>">
    <% } %>

    <div>
        <label for="nome">Nome:</label>
        <input type="text" id="nome" name="nome" value="<%= produto != null ? produto.getNome() : "" %>" required>
    </div>

    <div>
        <label for="quantidade">Quantidade:</label>
        <input type="number" id="quantidade" name="quantidade" value="<%= produto != null ? produto.getQuantidade() : "" %>" required>
    </div>

    <div>
        <label for="precoVenda">Preço de Venda:</label>
        <input type="text" id="precoVenda" name="precoVenda" value="<%= produto != null ? produto.getPrecoVenda() : "" %>" required>
    </div>

    <div>
        <input type="submit" value="<%= produto == null ? "Incluir Produto" : "Salvar Alterações" %>">
    </div>
</form>
</body>
</html>
