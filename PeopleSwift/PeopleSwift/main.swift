import Foundation

var people: [String: [String]] = [:]

func displayMenu() {
    print("""
    ------------------------
    Menu Principal:
    1. Criar
    2. Alterar
    3. Apagar
    4. Buscar pelo nome
    5. Exibir todos
    6. Sair
    ------------------------
    """)
}

func getInput(prompt: String) -> String {
    print(prompt)
    guard let input = readLine(), !input.isEmpty else {
        print("Entrada inválida.")
        return getInput(prompt: prompt)
    }
    return input
}

func createPerson() {
    let name = getInput(prompt: "Digite o nome:")
    if people[name] != nil {
        print("O nome já existe no sistema.")
        return
    }

    let email = getInput(prompt: "Digite o email:")
    let phone = getInput(prompt: "Digite o telefone:")
    let age = getInput(prompt: "Digite a idade:")

    people[name] = [email, phone, age]
    print("Pessoa adicionada com sucesso!")
    print(people)
}

func editPerson() {
    let name = getInput(prompt: "Digite o nome da pessoa a ser alterada:")
    guard let _ = people[name] else {
        print( "Pessoa não encontrada.")
        return
    }

    let email = getInput(prompt: "Digite o novo email:")
    let phone = getInput(prompt: "Digite o novo telefone:")
    let age = getInput(prompt: "Digite a nova idade:")

    people[name] = [email, phone, age]
    print("Dados atualizados com sucesso!")
}

func deletePerson() {
    let name = getInput(prompt: "Digite o nome da pessoa a ser apagada:")
    if let _ = people.removeValue(forKey: name) {
        print("Pessoa apagada com sucesso!")
    } else {
        print("Pessoa não encontrada.")
    }
}

func searchPerson() {
    let name = getInput(prompt: "Digite o nome da pessoa:")
    if let data = people[name] {
        print("""
        Dados da pessoa:
        Nome: \(name)
        Email: \(data[0])
        Telefone: \(data[1])
        Idade: \(data[2])
        """)
    } else {
        print("Pessoa não encontrada.")
    }
}

func displayAll() {
    if people.isEmpty {
        print("Nenhuma pessoa cadastrada.")
    } else {
        print("Lista de todas as pessoas:")
        for (name, data) in people {
            print("""
            ------------------------
            Nome: \(name)
            Email: \(data[0])
            Telefone: \(data[1])
            Idade: \(data[2])
            """)
        }
    }
}

func main() {
    while true {
        displayMenu()
        let option = getInput(prompt: "Escolha uma opção:")
        if let choice = Int(option) {
            switch choice {
            case 1:
                createPerson()
            case 2:
                editPerson()
            case 3:
                deletePerson()
            case 4:
                searchPerson()
            case 5:
                displayAll()
            case 6:
                print("Saindo do programa. Até mais!")
                return
            default:
                print("Opção inválida. Tente novamente.")
            }
        } else {
            print("Entrada inválida. Por favor, digite um número.")
        }
    }
}

main()
