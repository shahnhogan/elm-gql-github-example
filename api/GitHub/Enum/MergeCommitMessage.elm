module GitHub.Enum.MergeCommitMessage exposing (MergeCommitMessage(..), decoder, encode, list)

{-| 
@docs encode, decoder, list, MergeCommitMessage
-}


import Json.Decode
import Json.Encode


type MergeCommitMessage
    = PR_TITLE
    | PR_BODY
    | BLANK


list : List MergeCommitMessage
list =
    [ PR_TITLE, PR_BODY, BLANK ]


decoder : Json.Decode.Decoder MergeCommitMessage
decoder =
    Json.Decode.andThen
        (\andThenUnpack ->
            \string ->
                case string of
                    "PR_TITLE" ->
                        Json.Decode.succeed PR_TITLE

                    "PR_BODY" ->
                        Json.Decode.succeed PR_BODY

                    "BLANK" ->
                        Json.Decode.succeed BLANK

                    _ ->
                        Json.Decode.fail "Invalid type"
        )
        Json.Decode.string


encode : MergeCommitMessage -> Json.Encode.Value
encode val =
    case val of
        PR_TITLE ->
            Json.Encode.string "PR_TITLE"

        PR_BODY ->
            Json.Encode.string "PR_BODY"

        BLANK ->
            Json.Encode.string "BLANK"

