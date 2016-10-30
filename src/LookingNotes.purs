module LookingNotes where

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Prelude (Unit, ($), bind, void, (>>=), (>>>))
import Thermite as T
import React (ReactElement, createFactory) as R
import React.DOM (text, h2, div) as R
import React.DOM.Props as RP
import ReactDOM as RDOM
import Data.Functor (map)
import DOM.HTML.Document (body)
import DOM.HTML.Window (document)
import DOM (DOM)
import DOM.HTML (window)
import Data.Nullable (toMaybe)
import DOM.HTML.Types (htmlElementToElement, htmlDocumentToNonElementParentNode)
import Data.Traversable (traverse)
import DOM.Node.NonElementParentNode (getElementById)
import DOM.Node.Types (ElementId(..))


foreign import data QUAGGA :: !
foreign import scannerOpen :: forall eff
                           .  String
                           -> Eff ( quagga :: QUAGGA
                                  , console :: CONSOLE
                                  | eff) Unit
foreign import scannerClose :: forall eff. Eff (quagga :: QUAGGA | eff) Unit

data Action
    = Scan

type Book =
    { title :: String
    , isbn  :: String
    }
type State =
    { bookList :: Array Book
    }

initialState :: State
initialState = {
    bookList: [
        {title: "Immorality", isbn: "..."},
        {title: "A Tale for the Time Being", isbn: "..."}
    ]
}

render :: forall a. T.Render State a Action
render dispatch _ state _ =
    [ R.div [ RP.className "mdl-grid" ] (map renderBook state.bookList) ]

renderBook :: Book -> R.ReactElement
renderBook book =
    R.div [ RP.className "mdl-cell mdl-cell--4-col mdl-cell--6-col-tablet\
                            \ mdl-cell--12-col-phone" ]
          [ R.div [ RP.className "mdl-card mdl-shadow--2dp" ]
                  [ R.div [ RP.className "mdl-card__title" ]
                          [ R.h2 [ RP.className "mdl-card__title-text" ]
                                 [ R.text book.title ]
                          ]
                  ]
          ]

-- TODO
performAction :: forall a b. T.PerformAction a State b Action
performAction Scan _ _ = void $ T.cotransform $ \state -> state

spec :: forall a b. T.Spec a State b Action
spec = T.simpleSpec performAction render

main :: forall t1. Eff ( console :: CONSOLE
                       , dom :: DOM
                       | t1
                       ) Unit
main = do
    let component = T.createClass spec initialState
    window
        >>= document
        >>= htmlDocumentToNonElementParentNode
        >>> getElementById (ElementId "content")
        >>= toMaybe
        >>> traverse (RDOM.render (R.createFactory component {}))
    log "Hello, world!"

