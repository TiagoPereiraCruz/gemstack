#language: pt

Funcionalidade: Login
    Para que eu possa ter acesso a interface de administração de spots
    Sendo um usuário que possui um bom e-mail
    Quero poder iniciar uma nova sessão

    Cenário: Nova sessão
        Quando eu submeto a sessão com "tiago@acme.com"
        Então devo ver a área de administração de spots

    Esquema do Cenário: Tentativa
        Quando eu submeto a sessão com "<email>"
        Então devo ver a mensagem de alerta: "Oops. Informe um email válido!"

        Exemplos:
        |email          |
        |tiago&acme.com | 
        |               |