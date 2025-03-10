{-# LANGUAGE StrictData #-}
module Network.Tox.SaveData.Nodes
    ( Nodes (..)
    ) where

import           Data.Binary                   (Binary (..))
import           Network.Tox.NodeInfo.NodeInfo (NodeInfo)
import qualified Network.Tox.SaveData.Util     as Util
import           Test.QuickCheck.Arbitrary     (Arbitrary, arbitrary)

newtype Nodes = Nodes [NodeInfo]
    deriving (Eq, Show, Read)

instance Binary Nodes where
    get = Nodes <$> Util.getList
    put (Nodes xs) = mapM_ put xs

instance Arbitrary Nodes where
    arbitrary = Nodes <$> arbitrary
