sub init()
    m.rowlist = m.top.findNode("simpleRowList")
    m.rowlist.content = CreateObject("roSGNode", "ContentNode")
    m.taskComponent = createObject("roSGNode", "TaskComponent")
    m.taskComponent.observeField("content", "setContent")
    m.taskComponent.contenturi = "https://reqres.in/api/users?page=2"
    m.taskComponent.control = "RUN"
    m.rowlist.observeField("rowItemFocused", "handleRowItemFocused")
end sub

sub setContent()
    m.rowlist.content = m.taskComponent.content
end sub