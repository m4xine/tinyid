# Tiny ID 

A secure URL-friendly string ID generator.

## Example

```hs
import qualified Data.ByteString.Char8 as BS8
import Data.TinyID (nextRandom)

main :: IO ()
main = BS8.putStrLn =<< nextRandom 24 -- "lCJ-8euG_0tpxpLAmyY4BP0K"
```

## License

Copyright (c) 2022 Maxine D.

Licensed under the MIT License. You can obtain a copy of the License at http://opensource.org/licenses/MIT.