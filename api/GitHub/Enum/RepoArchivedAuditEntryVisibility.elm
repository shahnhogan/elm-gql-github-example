module GitHub.Enum.RepoArchivedAuditEntryVisibility exposing (RepoArchivedAuditEntryVisibility(..), decoder, encode, list)

{-| 
@docs encode, decoder, list, RepoArchivedAuditEntryVisibility
-}


import Json.Decode
import Json.Encode


type RepoArchivedAuditEntryVisibility
    = INTERNAL
    | PRIVATE
    | PUBLIC


list : List RepoArchivedAuditEntryVisibility
list =
    [ INTERNAL, PRIVATE, PUBLIC ]


decoder : Json.Decode.Decoder RepoArchivedAuditEntryVisibility
decoder =
    Json.Decode.andThen
        (\andThenUnpack ->
            \string ->
                case string of
                    "INTERNAL" ->
                        Json.Decode.succeed INTERNAL

                    "PRIVATE" ->
                        Json.Decode.succeed PRIVATE

                    "PUBLIC" ->
                        Json.Decode.succeed PUBLIC

                    _ ->
                        Json.Decode.fail "Invalid type"
        )
        Json.Decode.string


encode : RepoArchivedAuditEntryVisibility -> Json.Encode.Value
encode val =
    case val of
        INTERNAL ->
            Json.Encode.string "INTERNAL"

        PRIVATE ->
            Json.Encode.string "PRIVATE"

        PUBLIC ->
            Json.Encode.string "PUBLIC"

