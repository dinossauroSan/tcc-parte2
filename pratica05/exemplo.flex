/* Alguns métodos e variáveis disponíveis:
 * int yyline: armazena o número da linha atual.
 * int yycolumn: armazena o número da coluna atual na linha atual.
 * String yytext(): método que retorna a sequência de caracteres que foi casada com a regra.
 * int yylength(): método que retorna o comprimento da sequência de caracteres que foi casada com a regra.
 */

/* Definição: seção para código do usuário. */


%%

/* Opções e Declarações: seção para diretivas e macros. */

// Diretivas:
%standalone    // Execução independente do analisador sintático.
%line          // Permite usar yyline.
%column        // Permite usar yycolumn.
%class AnalisadorLexico // Troca o nome da classe Yylex para AnalisadorLexico.

// Macros:
letra = [a-zA-Z]
numero = [0-9]
digito = {numero}+
identificador = {letra}({letra}|{numero})*

data = (0[1-9]|[12]{numero}|3[01])[/](0[1-9]|1[0-2])[/]{numero}+
// Dia 01 até dia 31, mes 01 até 12, ano 0 até infinito

hora = (0{numero}|1{numero}|2[0-3]):[0-5]{numero}

telefone = {numero}{2}\+[ ]\({numero}{3}\)[ ]{numero}[ ]{numero}{4}-{numero}{4}
// {numero}{2} = dois numeros

cpf = {numero}{3}\.{numero}{3}\.{numero}{3}-{numero}{2}

email = [a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+
// final com pelo menos 2 letras
// Formato: usuario@dominio.extensao

url = https?:\/\/(www\.)?[a-zA-Z0-9.-]+\.[a-zA-Z]+(\/[a-zA-Z0-9._~:/?#@!$&'()*+,;=%-]*)?
// Formato: https://www.exemplo.com   http://site.org   https://meusite.com.br/pagina
//? = opcional

%%

/* Regras e Ações Associadas: seção de instruções para 
 * o analisador léxico. 
 */


{data} {System.out.println(" -> Encontrei uma data");}
{hora} {System.out.println(" -> Encontrei uma hora");}
{telefone} {System.out.println(" -> Encontrei um telefone");}
{cpf} {System.out.println(" -> Encontrei um cpf");}
{email} {System.out.println(" -> Encontrei um email");}
{url} {System.out.println(" -> Encontrei uma url");}