sub init()
    m.searchLabel = m.top.findNode("searchLabel")
    m.thumbnail = m.top.findNode("thumbnail")
    m.top.observeField("searchOutput", "handelSearchOutput")
    m.searchAvailableArray = []
end sub


sub handelSearchOutput()
    corX = m.thumbnail.LocalBoundingRect().x + m.thumbnail.LocalBoundingRect().width
    corY = m.thumbnail.LocalBoundingRect().y
    m.searchAvailableArray = []
    for each item in m.top.getAll()
        if item.TITLE <> invalid
            itemTitle = LCase(item.TITLE)
            searchOutput = LCase(m.top.searchOutput)
            for i = 0 to Len(searchOutput) step 1
                if searchOutput.Split("")[i] <> invalid and itemTitle.Split("")[i] = searchOutput.Split("")[i]
                    existingItem = CreateObject("rosGNode", "SearchResults")
                    existingItem.itemLabel = item.TITLE
                    existingItem.id = item.TITLE
                    existingItem.itemPoster = item.HDPOSTERURL
                    m.searchAvailableArray.Push(existingItem)
                end if
            end for
        end if
    end for
    handleScreenDisplay()
end sub


sub handleScreenDisplay()
    for each item in m.searchAvailableArray
        if item.itemPoster <> ""
            print item
        end if
    end for
end sub