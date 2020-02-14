import UIKit
/*:
 ## Funções tradicional com todos os componentes: nome, tipo de input, valor de retorno.
 */
func olaPessoa(pessoa: String) -> String{
    return "Olá, " + pessoa + "!"
}

print(olaPessoa(pessoa:"Fernando"))

/*:
 ## Função sem parâmetros
 */
func olaMundo() -> String {
    return "Olá mundo!"
}
print(olaMundo())

/*:
 ## Função com múltiplos parâmetros
 */
func olaDenovo(pessoa: String) -> String{
    return "Olá de novo, " + pessoa + "!"
}

func apresentacao(pessoa: String, jaApresentado: Bool = false) -> String{
    if (jaApresentado){
        return olaDenovo(pessoa: pessoa)
    }
    else{
        return olaPessoa(pessoa: pessoa)
    }
}

print(apresentacao(pessoa: "Fernando"))


/*:
 ## Função com múltiplos retornos
 
 ` Podemos também estabelecer múltiplos retornos para uma função  estabelecendo diferentes retornos, no exemplo abaixo, a função recebe um array e retorna o menor e o maior valor deste array.`

 */

func menorAndMaior (array: [Int]) -> (min: Int, max : Int ){
    var menorAtual = array[0];
    var maiorAtual = array[0];
    
    for value in array{
        if value < menorAtual{
            menorAtual = value
        } else
        if value>maiorAtual{
            maiorAtual = value
        }
    }
    return (menorAtual, maiorAtual)
}

var lista : [Int]
lista = [7,2,8,4,5,1]

print(menorAndMaior(array: lista))




