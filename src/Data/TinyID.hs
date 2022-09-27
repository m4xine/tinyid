module Data.TinyID 
  ( urlSafeAlphabet
  , nextRandomFromAlphabet
  , nextRandom
  ) where

import            Data.ByteString       (ByteString)
import  qualified Data.ByteString as BS 
import            System.Entropy        (getEntropy)
import            Data.String           (fromString)

-- | A URL-friendly alphabet.
urlSafeAlphabet :: ByteString
urlSafeAlphabet = fromString $ ['a'..'z'] <> ['A'..'Z'] <> ['0'..'9'] <> "-_~"

-- | Generates a (cryptographically) secure ID with a specified 
-- alphabet at a given length from system entropy.
nextRandomFromAlphabet 
  :: ByteString         -- ^ Alphabet 
  -> Int                -- ^ Length of ID
  -> IO ByteString
nextRandomFromAlphabet alphabet n =
  BS.map (\x -> BS.index alphabet $ fromIntegral x `mod` BS.length alphabet) <$> getEntropy n

-- | Generates a (cryptographically) secure and URL-friendly ID from system entropy.
nextRandom 
  :: Int            -- ^ Length of ID 
  -> IO ByteString
nextRandom = nextRandomFromAlphabet urlSafeAlphabet
