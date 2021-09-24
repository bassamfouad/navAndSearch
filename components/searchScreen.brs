sub init()
    m.miniKeyBoard = m.top.findNode("miniKeyBoard")
    miniKeyBoardrect = m.miniKeyBoard.boundingRect()
    centery = (720 - miniKeyBoardrect.height) / 2
    m.miniKeyBoard.translation = [100, centery]
    m.top.observeField("hasFocus", "handleFocus")
    m.miniKeyBoard.observeField("text", "handleText")
    m.rowlist = m.top.findNode("simpleRowList")
end sub

sub handleFocus()
    if m.top.hasFocus
        m.miniKeyBoard.setFocus(true)
    end if
end sub

sub handleText()
    mainNode = CreateObject("rosGNode", "ContentNode")
    childNode = mainNode.createChild("ContentNode")
    for each item in m.top.getAll()
        if item.TITLE <> invalid and item.TITLE <> "" and item.HDPOSTERURL <> ""
            itemTitle = LCase(item.TITLE)
            searchOutput = LCase(m.miniKeyBoard.text)
            for i = 0 to Len(searchOutput) step 1
                if searchOutput.Split("")[i] <> invalid and itemTitle.Split("")[i] = searchOutput.Split("")[i]
                    searchNode = childNode.createChild("ContentNode")
                    searchNode.TITLE = item.TITLE
                    searchNode.HDPOSTERURL = item.HDPOSTERURL

                    print searchNode
                end if
            end for
        end if
    end for
    m.rowlist.content = mainNode
end sub

