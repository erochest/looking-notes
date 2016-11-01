module LookingNotes.Components.Book where


import Prelude (Unit, pure)

import React.DOM as R
import React.DOM.Props as RP
import Thermite as T


type Book =
    { title :: String
    , isbn  :: String
    }


bookSpec :: forall eff props. T.Spec eff Book props Unit
bookSpec = T.simpleSpec T.defaultPerformAction render
  where
      render :: T.Render Book props Unit
      render dispatch _ book _ =
          [ R.div [ RP.className "mdl-cell mdl-cell--4-col\
                                \ mdl-cell--6-col-tablet\
                                \ mdl-cell--12-col-phone" ]
                  [ R.div [ RP.className "mdl-card mdl-shadow--2dp" ]
                          [ R.div [ RP.className "mdl-card__title" ]
                                  [ R.h2 [ RP.className "mdl-card__title-text" ]
                                          [ R.text book.title ]
                                  ]
                          ]
                  ]
          ]
