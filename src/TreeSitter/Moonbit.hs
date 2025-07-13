module TreeSitter.Moonbit (
  tree_sitter_moonbit,
  getNodeTypesPath,
  getTestCorpusDir,
) where

import Foreign.Ptr
import TreeSitter.Language
import Paths_tree_sitter_moonbit (getDataFileName)

foreign import ccall unsafe "vendor/tree-sitter-moonbit/src/parser.c tree_sitter_moonbit" tree_sitter_moonbit :: Ptr Language

getNodeTypesPath :: IO FilePath
getNodeTypesPath = getDataFileName "vendor/tree-sitter-moonbit/src/node-types.json"

getTestCorpusDir :: IO FilePath
getTestCorpusDir = getDataFileName "vendor/tree-sitter-moonbit/test/corpus"
