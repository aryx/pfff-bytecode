let build_stdlib lang root dst =

  | "clang" ->
      Uninclude_clang.uninclude ~verbose:!verbose root files dst


let main_action xs =


#if FEATURE_BYTECODE
    | "bytecode" -> 
      let graph_code_java =  None 
(*        Some (Graph_code_java.build ~verbose:!verbose ~only_defs:true 
                 root skip_list)
*)
      in
      Graph_code_bytecode.build ~verbose:!verbose ~graph_code_java root files,
      empty
#endif

    | "clang2" -> Graph_code_clang.build ~verbose:!verbose root files, empty
