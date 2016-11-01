module LookingNotes.Quagga where

import Prelude (Unit)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)

foreign import data QUAGGA :: !
foreign import scannerOpen :: forall eff
                           .  String
                           -> Eff ( quagga  :: QUAGGA
                                  , console :: CONSOLE
                                  | eff) Unit
foreign import scannerClose :: forall eff. Eff (quagga :: QUAGGA | eff) Unit

