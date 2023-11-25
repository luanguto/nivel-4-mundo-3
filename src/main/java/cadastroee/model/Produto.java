package cadastroee.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Produto {
    private int idProduto;
    private String nome;
    private int quantidade;
    private float precoVenda;

    public int getId() {
        return idProduto;
    }

}
