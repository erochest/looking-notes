module LookingNotes where

import Prelude (Unit, unit, bind, (>>=), (>>>), negate, const)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Thermite as T
import React (createFactory) as R
import ReactDOM as RDOM
import DOM.HTML.Window (document)
import DOM (DOM)
import DOM.HTML (window)
import Data.Nullable (toMaybe)
import DOM.HTML.Types (htmlDocumentToNonElementParentNode)
import Data.Traversable (traverse)
import DOM.Node.NonElementParentNode (getElementById)
import DOM.Node.Types (ElementId(..))
import Data.Lens (Lens', Prism', lens, prism)
import Data.List (fromFoldable)
import Data.Either (Either(Right))

import LookingNotes.Components.BookList (BookList, BookListAction(NoOp), bookListSpec)


type State =
    { bookList :: BookList
    }

_bookList :: Lens' State BookList
_bookList = lens _.bookList (_ { bookList = _ })

initialState :: State
initialState = {
    bookList: {
        books: fromFoldable [
            {title: "Immorality", isbn: "..."},
            {title: "A Tale for the Time Being", isbn: "..."}
        ]
    }
}

_Action :: Prism' Unit BookListAction
_Action = prism (const unit) (const (Right (NoOp (-1))))

spec :: forall a b. T.Spec a State b Unit
spec = T.focus _bookList _Action bookListSpec

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

