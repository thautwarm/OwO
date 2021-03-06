{-# LANGUAGE CPP           #-}
{-# LANGUAGE DeriveGeneric #-}

module OwO.Syntax.Concret where

import           Data.Text

import           OwO.Syntax.Common
import           OwO.Syntax.Position

import           GHC.Generics        (Generic)

#include <impossible.h>

{-| A name is a non-empty list of alternating 'Id's and 'Hole's. A normal name
    is represented by a singleton list, and operators are represented by a list
    with 'Hole's where the arguments should go. For instance: @[Hole,Id "+",Hole]@
    is infix addition.

    Equality and ordering on @Name@s are defined to ignore interval so same names
    in different locations are equal.
-}
data Name
  = Name   Loc Text   -- ^ A identifier.
  | NoName Loc NameId -- ^ @_@.
  deriving (Eq, Generic, Ord, Show)
