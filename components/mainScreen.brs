function init()
    m.top.setFocus(true)
    m.topNav = m.top.findNode("topNav")
    m.searchScreen = m.top.findNode("searchScreen")
    m.homeScreen = m.top.findNode("homeScreen")
    m.simpleRowlist = m.top.findNode("simpleRowlist")
    m.topNav.observeField("selectedNavItem", "selectedNavItemHandler")
    m.topNav.observeField("navHasFocus", "handleFocus")
end function

sub selectedNavItemHandler()
    if m.topNav.selectedNavItem.id = "homeScreen"
        m.simpleRowlist.visible = true
        m.searchScreen.visible = false
    else
        m.searchScreen.visible = true
        m.simpleRowlist.visible = false
    end if
end sub

sub handleFocus()
    navHasFocus = m.topNav.navHasFocus
    currentDisplay = m.topNav.selectedNavItem.id
    if navHasFocus = false
        if currentDisplay = "homeScreen"
            m.homeScreen.setFocus(true)
        end if
        if currentDisplay = "searchScreen"
            m.searchScreen.hasFocus = true
        end if
    end if
end sub

