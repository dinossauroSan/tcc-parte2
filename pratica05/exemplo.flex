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
data = (0[1-9]|[12][0-9]|3[01])[/](0[1-9]|1[0-2])[/]{numero}+
// Dia 01 até dia 31, mes 01 até 12, ano 0 até infinito
%%

/* Regras e Ações Associadas: seção de instruções para 
 * o analisador léxico. 
 */


{data} {System.out.println(" -> Encontrei uma data");}