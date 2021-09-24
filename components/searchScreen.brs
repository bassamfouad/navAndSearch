sub init()
    m.miniKeyBoard = m.top.findNode("miniKeyBoard")
    miniKeyBoardrect = m.miniKeyBoard.boundingRect()
    centery = (720 - miniKeyBoardrect.height) / 2
    m.miniKeyBoard.translation = [100, centery]
    m.top.observeField("hasFocus", "handleFocus")
    m.miniKeyBoard.observeField("text", "handleText")
    m.searchResults = m.top.findNode("searchResults")
end sub

sub handleFocus()
    if m.top.hasFocus
        m.miniKeyBoard.setFocus(true)
    end if
end sub

sub handleText()
    m.searchResults.searchOutput = m.miniKeyBoard.text
end sub