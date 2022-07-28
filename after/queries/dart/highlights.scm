((selector(unconditional_assignable_selector(identifier)@function)).(selector(argument_part(arguments))))

(arguments (argument (identifier) @variable))
(initialized_identifier_list (initialized_identifier(identifier) @variable))
(named_argument (label)(identifier) @variable)

(unconditional_assignable_selector(identifier) @type(#match? @type "^[A-Z][a-z0-9_-]{3,19}$"))

(void_type) @voidType

(named_argument (label (identifier) @namedArgument))
