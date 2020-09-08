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
