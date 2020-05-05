
ifeq ($(FEATURE_BYTECODE), 1)
#still? ZIPCMA=external/ocamlzip/zip.cma
EXTLIBCMA=external/deps-extlib/extLib.cma
PTCMA=external/deps-ptrees/ptrees.cma
JAVALIBCMA=external/javalib/lib.cma

BYTECODEDIRS=lang_bytecode/parsing lang_bytecode/analyze
endif

ifeq ($(FEATURE_CMT), 1)
#bugfix: better to use external/compiler-libs otherwise
# the filter-out in Makefile.common will not skip this dir,
# which may lead to recompilation of .cmi in ocaml stdlib
#old: OCAMLCOMPILERDIR=$(shell ocamlc -where)/compiler-libs
OCAMLCOMPILERDIR=external/compiler-libs
OCAMLCOMPILERCMA=ocamlcommon.cma

CMTDIRS=lang_cmt/parsing lang_cmt/analyze
endif

    $(BYTECODEDIRS:%=%/lib.cma) \

  $(BYTECODEDIRS) \

PP=-pp "cpp $(CLANG_HACK) -DFEATURE_BYTECODE=$(FEATURE_BYTECODE) -DFEATURE_CMT=$(FEATURE_CMT)"

    $(CMTDIRS:%=%/lib.cma) \

  $(CMTDIRS) \

 lang_clang/parsing/lib.cma \

    lang_clang/parsing/lib.cma \
     lang_clang/analyze/lib.cma \

  lang_clang/parsing \
   lang_clang/analyze \

 $(OCAMLCOMPILERDIR)

