{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import Data.Monoid (mappend)
import Data.Monoid ((<>))
import Hakyll

main :: IO ()
main =
  hakyll $ do
    match "images/*" $ do
      route idRoute
      compile copyFileCompiler

    match "css/*" $ do
      route idRoute
      compile compressCssCompiler

    -- match (fromList ["about.md", "contact.md"]) $ do
    match (fromList ["about.md"]) $ do
      route (setExtension "html")
      compile $ pandocCompiler
        >>= loadAndApplyTemplate "templates/default.html" defaultContext
        >>= relativizeUrls

    -- build up tags
    tags <- buildTags "posts/*" (fromCapture "tags/*.html")

    tagsRules tags $ \tag pattern -> do
        let title = "Posts tagged \"" ++ tag ++ "\""
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll pattern
            let ctx = constField "title" title
                      `mappend` listField "posts" postContext (return posts)
                      `mappend` defaultContext

            makeItem ""
                >>= loadAndApplyTemplate "templates/tag.html" ctx
                >>= loadAndApplyTemplate "templates/default.html" ctx
                >>= relativizeUrls

    -- creating the posts
    match "posts/*" $ do
      route (setExtension "html")
      compile $ pandocCompiler
        >>= loadAndApplyTemplate "templates/post.html" (postCtxWithTags tags)
        >>= saveSnapshot "content"
        >>= loadAndApplyTemplate "templates/default.html" (postCtxWithTags tags)
        >>= relativizeUrls


    create ["archive.html"] $ do
      route idRoute
      compile $ do
        posts <- recentFirst =<< loadAll "posts/*"
        let archiveContext =
              listField "posts" postContext (return posts) `mappend`
              constField "title" "Archives" `mappend`
              defaultContext

        makeItem ""
          >>= loadAndApplyTemplate "templates/archive.html" archiveContext
          >>= loadAndApplyTemplate "templates/default.html" archiveContext
          >>= relativizeUrls

    match "index.html" $ do
      route idRoute
      compile $ do
        posts <- fmap (take 3) . recentFirst =<< loadAll "posts/*"
        let indexContext =
              listField "posts" postContext (return posts) <>
              field "tags" (\_ -> renderTagList tags) <>
              defaultContext
              
        getResourceBody
          >>= applyAsTemplate indexContext
          >>= loadAndApplyTemplate "templates/default.html" indexContext
          >>= relativizeUrls

    match "templates/*" (compile templateCompiler)

    create ["atom.xml"] $ do
      route idRoute
      compile $ do
        posts <- fmap (take 10) . recentFirst
                   =<< loadAllSnapshots "posts/*" "content"
        renderAtom feedConfiguration feedContext posts

    create ["rss.xml"] $ do
      route idRoute
      compile $ do
        posts <- fmap (take 10) . recentFirst
                   =<< loadAllSnapshots "posts/*" "content"
        renderRss feedConfiguration feedContext posts


--------------------------------------------------------------------------

postContext :: Context String
postContext =
  dateField "date" "%B %e, %Y" `mappend`
  defaultContext

-- mapping the post Context with the generated tags
postCtxWithTags :: Tags -> Context String
postCtxWithTags tags = 
  tagsField "tags" tags `mappend`
  postContext

feedContext :: Context String
feedContext =
  postContext `mappend` bodyField "description"

feedConfiguration :: FeedConfiguration
feedConfiguration =
  FeedConfiguration
    { feedTitle = "Free thoughts on a leash"
    , feedDescription = "palutz's blog"
    , feedAuthorName = "palutz"
    , feedAuthorEmail = "stefano@pastesoft.com"
    , feedRoot = ""
    }
