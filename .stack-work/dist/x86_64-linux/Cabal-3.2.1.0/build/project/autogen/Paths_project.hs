{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_project (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/runner/Intro/.stack-work/install/x86_64-linux/ba2b6affc4da1a5242ae2160a3542b99e35144c7ea258cde95d80e4173bb768a/8.10.4/bin"
libdir     = "/home/runner/Intro/.stack-work/install/x86_64-linux/ba2b6affc4da1a5242ae2160a3542b99e35144c7ea258cde95d80e4173bb768a/8.10.4/lib/x86_64-linux-ghc-8.10.4/project-0.1.0.0-KC6zzFsEHleLK2NdNv5GMz-project"
dynlibdir  = "/home/runner/Intro/.stack-work/install/x86_64-linux/ba2b6affc4da1a5242ae2160a3542b99e35144c7ea258cde95d80e4173bb768a/8.10.4/lib/x86_64-linux-ghc-8.10.4"
datadir    = "/home/runner/Intro/.stack-work/install/x86_64-linux/ba2b6affc4da1a5242ae2160a3542b99e35144c7ea258cde95d80e4173bb768a/8.10.4/share/x86_64-linux-ghc-8.10.4/project-0.1.0.0"
libexecdir = "/home/runner/Intro/.stack-work/install/x86_64-linux/ba2b6affc4da1a5242ae2160a3542b99e35144c7ea258cde95d80e4173bb768a/8.10.4/libexec/x86_64-linux-ghc-8.10.4/project-0.1.0.0"
sysconfdir = "/home/runner/Intro/.stack-work/install/x86_64-linux/ba2b6affc4da1a5242ae2160a3542b99e35144c7ea258cde95d80e4173bb768a/8.10.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "project_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "project_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "project_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "project_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "project_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "project_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
