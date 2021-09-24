sub init()
    m.rowlist = m.top.findNode("simpleRowList")
    m.rowlist.content = CreateObject("roSGNode", "RowListContent")
    m.rowlist.observeField("rowItemFocused", "handleRowItemFocused")
end sub
sub handleRowItemFocused()
    firstRow = m.rowlist.rowItemFocused [0]
    if firstRow = 0
    end if
end sub


function onKeyEvent(key as string, press as boolean) as boolean
    handled = false
    if press then
        print key
    end if
    return handled
end function