let build_stdlib lang root dst =

  | "clang" ->
      Uninclude_clang.uninclude ~verbose:!verbose root files dst


let main_action xs =

#if FEATURE_CMT
    | "cmt"  -> 
          let ml_files = Find_source.files_of_root ~lang:"ml" root in
          let cmt_files = files in
          Graph_code_cmt.build ~verbose:!verbose ~root ~cmt_files ~ml_files, 
          empty
#endif

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
