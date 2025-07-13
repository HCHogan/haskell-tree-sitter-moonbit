# tree-sitter-moonbit

**Note: The tree-sitter package on hackage is very old, using tree-sitter abi 11, you have to use the master branch of from https://github.com/tree-sitter/haskell-tree-sitter, which uses tree-sitter abi 14**

tree-sitter-moonbit for haskell

## examples
```haskell
{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import Data.ByteString (ByteString)
import Data.ByteString.Char8 qualified as BS
import Foreign.Storable (peek)

import TreeSitter.Moonbit (tree_sitter_moonbit)
import TreeSitter.Parser (withParseTree, withParser)
import TreeSitter.Tree (withRootNode)

source :: ByteString
source =
  BS.unlines
    [ "fn add(x : Int, y : Int) -> Int {"
    , "  x + y"
    , "}"
    , ""
    , "let z = add(1, 2)"
    ]

main :: IO ()
main = do
  withParser tree_sitter_moonbit $ \parser ->
    withParseTree parser source $ \tree ->
      withRootNode tree $ \rootPtr -> do
        root <- peek rootPtr
        print root

```
