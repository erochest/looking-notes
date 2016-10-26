module LookingNotes where

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Prelude (Unit)

main :: forall t1. Eff (console :: CONSOLE | t1) Unit
main = log "Hello, world!"

