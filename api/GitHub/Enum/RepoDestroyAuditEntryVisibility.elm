module GitHub.Enum.RepoDestroyAuditEntryVisibility exposing (RepoDestroyAuditEntryVisibility(..), decoder, encode, list)

{-| 
@docs encode, decoder, list, RepoDestroyAuditEntryVisibility
-}


import Json.Decode
import Json.Encode


type RepoDestroyAuditEntryVisibility
    = INTERNAL
    | PRIVATE
    | PUBLIC


list : List RepoDestroyAuditEntryVisibility
list =
    [ INTERNAL, PRIVATE, PUBLIC ]


decoder : Json.Decode.Decoder RepoDestroyAuditEntryVisibility
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


encode : RepoDestroyAuditEntryVisibility -> Json.Encode.Value
encode val =
    case val of
        INTERNAL ->
            Json.Encode.string "INTERNAL"

        PRIVATE ->
            Json.Encode.string "PRIVATE"

        PUBLIC ->
            Json.Encode.string "PUBLIC"

