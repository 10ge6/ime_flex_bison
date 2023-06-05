
%token NUMBER
%token ID
%token COLON, ASSIGN, SEMIC
%token INTEGER, BOOLEAN
%token FUNCTION

%%

program: declaration_list

simple_type
: BOOLEAN
| INTEGER
;

array_type
: ARRAY '[' NUMBER ']' simple_type
;

declaration
: var_declaration
| function_declaration
;

delaration_list
: declaration
| declaration declaration_list
;

literal_list
: literal
| literal COMMA literal_list
;

literal
: TRUE
| FALSE
| NUMBER
;

var_declaration
: ID COLON simple_type SEMIC
| ID COLON simple_type ASSIGN literal SEMIC
| ID COLON array_type SEMIC
| ID COLON array_type ASSIGN '{' literal_list '}' SEMIC
;

var_declaration_list
: var_declaration
| var_declaration var_declaration_list
;

params
: OPENP CLOSEP
| OPENP param_list CLOSEP
;

param_list
: param_declaration
| param_list COMMA param_declaration
;

param_declaration
: ID COLON simple_type
;

function_declaration
: ID COLON FUNCTION simple_type params ASSIGN block
;

statement_list
: /* */
| statement statement_list
;

block
: OPENBRACE var_declaration_list statement_list CLOSEBRACE
| OPENBRACE var_declaration_list CLOSEBRACE
| OPENBRACE statement_list CLOSEBRACE
| OPENBRACE CLOSEBRACE
;

statement
: IF OPENP expression CLOSEP statement_list SEMIC
| IF OPENP expression CLOSEP statement_list ELSE statement_list SEMIC
;

