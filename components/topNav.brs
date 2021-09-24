sub init()
    initiateRecWrapper()
    m.homeScreen = m.top.findNode("homeScreen")
    m.searchScreen = m.top.findNode("searchScreen")
    m.navBar = m.top.FindNode("navBar")
    m.top.selectedNavItem = m.homeScreen
end sub

sub initiateRecWrapper()
    screenInfo = CreateObject("roDeviceInfo")
    navBarWrapper = m.top.findNode("navBarWrapper")
    screenWidth = screenInfo.GetDisplaySize().w
    navBarWrapper.width = screenWidth
    navBarWrapper.height = 90
end sub

sub indicateSelectedItem()
    currentFocus = m.top.findNode("currentFocus")
    boundingRect = m.top.selectedNavItem.sceneBoundingRect()
    currentFocus.width = boundingRect.width
    currentFocus.translation = [boundingRect.x, 100]
end sub

function onKeyEvent(key as string, press as boolean) as boolean
    handled = false
    if press then
        if m.navBar.hasFocus()
            if key = "right"
                m.top.selectedNavItem = m.searchScreen
            end if
            if key = "left"
                m.top.selectedNavItem = m.homeScreen
            end if
            if key = "down"
                m.top.navHasFocus = false
                m.navBar.setFocus(false)
            end if
            indicateSelectedItem()
        end if
    end if
    return handled
end function