module LookingNotes.Components.BookList where


import Prelude (Unit, unit, ($), (<<<), pure, void, bind, const)
import Data.Lens (Lens', Prism', lens, over, prism)
import Data.List (List(..))
import Data.Foldable (fold)
import Data.Tuple (Tuple(..), fst)
import Data.Either (Either(..))
import Control.Monad.Trans.Class (lift)

import React (ReactElement, Event, EventHandlerContext, handle) as R
import React.DOM (IsDynamic(..), mkDOM, text, span, i, button, div) as R
import React.DOM.Props as RP
import Thermite as T

import LookingNotes.Components.Book (Book, bookSpec)
import LookingNotes.Quagga (scannerOpen)


data BookListAction
    = Scan
    | AddBook String String
    | NoOp Int

type BookList =
    { books    :: List Book
    , scanning :: Boolean
    }

initialBookList :: BookList
initialBookList = { books: Nil, scanning: false }

_books :: Lens' BookList (List Book)
_books = lens _.books (_ { books = _ })

_BookAction :: Prism' BookListAction (Tuple Int Unit)
_BookAction = prism (NoOp <<< fst) \bla ->
              case bla of
                   NoOp n -> Right (Tuple n unit)
                   _      -> Left bla

grid :: forall eff state props action
     .  T.Spec eff state props action
     -> T.Spec eff state props action
grid = over T._render \render d p s c ->
    [ R.div [ RP.className "mdl-grid" ] (render d p s c) ]

bookListSpec :: forall eff props. T.Spec eff BookList props BookListAction
bookListSpec = grid $ fold [ T.withState \st ->
                                    T.focus _books _BookAction $
                                        T.foreach \_ -> bookSpec
                           , footer
                           ]
    where
        footer :: forall action. T.Spec eff BookList props BookListAction
        footer = T.simpleSpec performAction \d _ s _ ->
                 [ R.button [ RP.className "mdl-button mdl-js-button\
                                            \ mdl-button--fab\
                                            \ mdl-js-ripple-effect\
                                            \ mdl-button--colored\
                                            \ mdl-shadow--4dp\
                                            \ mdl-color--accent primary-fab"
                            , RP._id "scan"
                            , RP.onClick (const (d Scan))
                            ]
                            [ R.i    [ RP.className "material-icons"
                                     , RP.role "presentation"
                                     ]
                                     [ R.text "add" ]
                            , R.span [ RP.className "visuallyhidden" ]
                                     [ R.text "Add" ]
                            ]
                 , dialog [ RP.open s.scanning
                          -- , onCancel 
                          ]
                          [ dialogTitle [] [ R.text "ISBN" ]
                          , dialogContent [ RP._id "quagga_scanner" ] []
                          , dialogActions []
                                          [ R.button [ RP._type "button"
                                                     , RP.onClick \_ -> pure unit
                                                     ]
                                                     [ R.text "Cancel" ]
                                          ]
                          ]
                 ]
            where
                performAction :: T.PerformAction eff BookList props BookListAction
                performAction Scan p s = do
                    void $ T.modifyState (_ { scanning = true })
                    lift $ scannerOpen "quagga_scanner"
                performAction (AddBook t i) _ _ =
                    void $ T.modifyState \s ->
                        s { books = Cons { title: t, isbn: i } s.books }
                performAction (NoOp _) _ _ = pure unit

-- TODO: display camera & get ISBN
-- TODO: look up ISBN
-- TODO: confirm selection

dialog :: Array RP.Props -> Array R.ReactElement -> R.ReactElement
dialog = R.mkDOM (R.IsDynamic false) "Dialog"

dialogTitle :: Array RP.Props -> Array R.ReactElement -> R.ReactElement
dialogTitle = R.mkDOM (R.IsDynamic false) "DialogTitle"

dialogContent :: Array RP.Props -> Array R.ReactElement -> R.ReactElement
dialogContent = R.mkDOM (R.IsDynamic false) "DialogContent"

dialogActions :: Array RP.Props -> Array R.ReactElement -> R.ReactElement
dialogActions = R.mkDOM (R.IsDynamic false) "DialogActions"

onCancel :: forall eff props state result
         .  (R.Event -> R.EventHandlerContext eff props state result)
         -> RP.Props
onCancel f = RP.unsafeMkProps "onCancel" (R.handle f)
