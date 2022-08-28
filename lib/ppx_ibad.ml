open Ppxlib

let name = "ibad"

let expand ~loc ~path:_ (env : string) =
  [%expr Some ([%e Ast_builder.Default.estring ("xD " ^ env) ~loc])]

let ext =
  Extension.declare
    name
    Extension.Context.expression
    Ast_pattern.(single_expr_payload (estring __))
    expand

let () = Ppxlib.Driver.register_transformation name ~extensions:[ext]