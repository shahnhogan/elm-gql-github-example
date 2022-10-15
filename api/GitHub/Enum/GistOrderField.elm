module GitHub.Enum.GistOrderField exposing (GistOrderField(..), decoder, encode, list)

{-| 
@docs encode, decoder, list, GistOrderField
-}


import Json.Decode
import Json.Encode


type GistOrderField
    = CREATED_AT
    | UPDATED_AT
    | PUSHED_AT


list : List GistOrderField
list =
    [ CREATED_AT, UPDATED_AT, PUSHED_AT ]


decoder : Json.Decode.Decoder GistOrderField
decoder =
    Json.Decode.andThen
        (\andThenUnpack ->
            \string ->
                case string of
                    "CREATED_AT" ->
                        Json.Decode.succeed CREATED_AT

                    "UPDATED_AT" ->
                        Json.Decode.succeed UPDATED_AT

                    "PUSHED_AT" ->
                        Json.Decode.succeed PUSHED_AT

                    _ ->
                        Json.Decode.fail "Invalid type"
        )
        Json.Decode.string


encode : GistOrderField -> Json.Encode.Value
encode val =
    case val of
        CREATED_AT ->
            Json.Encode.string "CREATED_AT"

        UPDATED_AT ->
            Json.Encode.string "UPDATED_AT"

        PUSHED_AT ->
            Json.Encode.string "PUSHED_AT"

