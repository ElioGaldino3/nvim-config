(identifier) @variable
((identifier) @function . (selector(argument_part)))

((selector(unconditional_assignable_selector(identifier)@function)).(selector(argument_part(arguments))))

(arguments (argument (identifier) @variable))
(initialized_identifier_list (initialized_identifier(identifier) @variable))
(named_argument (label)(identifier) @variable)

(void_type) @voidType

(named_argument (label (identifier) @namedArgument))

((identifier).(formal_parameter_list)) @function

((identifier) @type.builtin (#match? @type.builtin "^[A-Z][a-z0-9_-]+"))
