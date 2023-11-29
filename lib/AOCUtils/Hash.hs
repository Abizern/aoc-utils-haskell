module AOCUtils.Hash where

import Crypto.Hash.MD5 (hash)
import Data.ByteString.Base16 (encode)
import Data.ByteString.Char8 (pack, unpack)

-- | Converts a String into a hex-string representation.
--
-- >>> md5Hash "abcdef609043"
-- "000001dbbfa3a5c83a2d506429c7b00e"
md5Hash :: String -> String
md5Hash = unpack . encode . hash . pack
