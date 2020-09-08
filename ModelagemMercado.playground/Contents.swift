import UIKit

// Compara mes e dia de duas datas e retorna true se forem iguais
func isMesmoDiaMes(date1: Date, date2: Date) -> Bool{
    let dateFormat = DateFormatter()
    dateFormat.dateFormat = "dd-MM"
    
    if (dateFormat.string(from: date1) == dateFormat.string(from: date2))
    {
        return true
    }
    
    return false
}

// Define a classe de pessoas
class Pessoa{
    var nome: String
    var cpf: String
    var identidade: String
    var dataNascimento: Calendar
    var endereco: String
    var email: String
    
    init(nome: String, cpf: String, identidade: String, dataNascimento: Calendar, endereco: String, email: String) {
        self.nome = nome
        self.cpf = cpf
        self.identidade = identidade
        self.dataNascimento = dataNascimento
        self.endereco = endereco
        self.email = email
    }
    // Busca uma pessoa pelo cpf e retorna true caso a encontre
    func LocalizarPeloCPF(cpf: String)-> Bool{
        // Simula uma busca pelo CPF entre as pessoas
        let busca: Bool = Bool.random()
        return busca
    }
    
    // Cadastra uma nova pessoa
    func Cadastrar(cpf: String){
        if (LocalizarPeloCPF(cpf: cpf)){
            print("Pessoa já cadastrada")
            // Interrompe a execução da função
            return
        }
        // cadastra pessoa
        print("Pessoa cadastrada com sucesso")
    }
    
    // Veridica se a data atual é o aniversário da pessoa e dá os parabéns
    func DarParabensPeloAniversario(dataNascimento: Date)
    {
        let hoje: Date = Date()
        if (isMesmoDiaMes(date1: hoje, date2: dataNascimento))
        {
            print("Parabéns pelo seu aniversário")
        }
    }
    
    // Método vazio
    func Acordar()
    {
        print("Acordar")
    }
    
    // Método vazio
    func Andar()
    {
        print("Andando")
    }
} // fim classe pessoa

// Define a classe funcionario que herda de pessoa
class Funcionario: Pessoa{
    var salario: Float
    var cargo: String
    var dataAdmissao: Date
    var emAtividade: Bool
    
    init(pessoa: Pessoa, salario: Float, cargo: String, dataAdmissao: Date, emAtividade: Bool){
        self.salario = salario
        self.cargo = cargo
        self.dataAdmissao = dataAdmissao
        self.emAtividade = emAtividade
        super.init(nome: pessoa.nome, cpf: pessoa.cpf, identidade: pessoa.identidade, dataNascimento: pessoa.dataNascimento, endereco: pessoa.endereco, email: pessoa.email)
   }
    
    //Aumenta o salarario em x por cento
     func AumentaSalarioEmPercentual(percetualAumento: Float) {
         self.salario = self.salario + self.salario * (percetualAumento/100)
     }
    
    // Muda o cargo do funcionario
    func MudarCargoFuncionario(novoCargo: String){
        self.cargo = novoCargo
    }
        
   // Receber salario
    func ReceberSalario(){
        print("O valor de \(self.salario) foi depositado")
    }
    
    // Registra do ponto do funcionario
    func RegistrarPonto()  {
        print("Ponto registrado com sucesso")
    }
    
    //Goza ferias
    func GozarFerias() {
        print("Está em férias")
    }
    
    //Descanso semanal
    func Descansar() {
        print("Está de folga")
    }
}// fim da classe funcionario

// Define a classe produto
class Produto{
    var codigo: String
    var precoCompra: Float
    var precoVenda: Float
    var emLinha: Bool
    var emEstoque: Bool
    var quantidadeEmEstoque: Double
    
    init(codigo: String, precoCompra: Float, precoVenda: Float, emLinha: Bool, emEstoque: Bool, quantidadeEmEstoque: Double) {
        self.codigo = codigo
        self.precoCompra = precoCompra
        self.precoVenda = precoVenda
        self.emLinha = emLinha
        self.emEstoque = emEstoque
        self.quantidadeEmEstoque = quantidadeEmEstoque
    }
    
    //Atualiza o estoque dada uma venda
    func RegistrarVenda(quantidadeVendida: Double){
        if (self.quantidadeEmEstoque >= quantidadeVendida)
        {
            self.quantidadeEmEstoque = self.quantidadeEmEstoque - quantidadeVendida
            // caso a nova quantidade em estoque seja zero atualiza a propriedade emEstoque para false
            if (self.quantidadeEmEstoque == 0.00)
            {
                self.emEstoque = false
            }
        }
        else {
            print("Quantidade vendida imcompatível com o estoque registrado")
        }
    }
    
    //Atualiza o valor de compra
    func AtuallizarPrecoCompra(precoCompra: Float)
    {
        self.precoCompra = precoCompra
    }
    
    //Atualiza o estoque dada uma reposição
    func RegistraCompra(quantidadeComprada: Double, precoCompra: Float){
        self.quantidadeEmEstoque = self.quantidadeEmEstoque + quantidadeComprada
        // Caso o estoque do produto estivesse zerado, atualiza a propriedade em estoque para true
        if (!self.emEstoque && quantidadeComprada > 0){
            self.emEstoque = true
        }
        self.AtuallizarPrecoCompra(precoCompra: precoCompra)
    }
    
    // Atualiza o preco de venda do produto
    func AtualizarPrecoVenda(novoPreco: Float){
        self.precoVenda = novoPreco
    }
    
    //Retira o produto de linha
    func RetirarDeLinha(){
        self.emLinha = false
    }
    
}// fim da classe produto
