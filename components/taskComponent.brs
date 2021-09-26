sub init()
    m.top.functionName = "getcontent"
end sub

sub getcontent()
    readInternet = createObject("roUrlTransfer")
    readInternet.SetCertificatesFile("common:/certs/ca-bundle.crt")
    readInternet.setUrl(m.top.contenturi)
    response = ParseJson(readInternet.GetToString())

    userContentNode = createObject("roSGNode", "ContentNode")
    rowList = userContentNode.createChild("ContentNode")
    for  each item in response.data
        childNode = rowList.createChild("ContentNode")
        childNode.addFields(item)
    end for
    m.top.content = userContentNode
end sub
