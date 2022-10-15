module GitHub.Enum.ProjectCardArchivedState exposing (ProjectCardArchivedState(..), decoder, encode, list)

{-| 
@docs encode, decoder, list, ProjectCardArchivedState
-}


import Json.Decode
import Json.Encode


type ProjectCardArchivedState
    = ARCHIVED
    | NOT_ARCHIVED


list : List ProjectCardArchivedState
list =
    [ ARCHIVED, NOT_ARCHIVED ]


decoder : Json.Decode.Decoder ProjectCardArchivedState
decoder =
    Json.Decode.andThen
        (\andThenUnpack ->
            \string ->
                case string of
                    "ARCHIVED" ->
                        Json.Decode.succeed ARCHIVED

                    "NOT_ARCHIVED" ->
                        Json.Decode.succeed NOT_ARCHIVED

                    _ ->
                        Json.Decode.fail "Invalid type"
        )
        Json.Decode.string


encode : ProjectCardArchivedState -> Json.Encode.Value
encode val =
    case val of
        ARCHIVED ->
            Json.Encode.string "ARCHIVED"

        NOT_ARCHIVED ->
            Json.Encode.string "NOT_ARCHIVED"

