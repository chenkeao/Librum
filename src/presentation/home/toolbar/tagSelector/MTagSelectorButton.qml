import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Librum.style
import Librum.icons


Item
{
    id: root
    signal tagSelected
    
    implicitWidth: 100
    implicitHeight: 36
    
    
    Pane
    {
        id: container
        anchors.fill: parent
        padding: 0
        background: Rectangle
        {
            color: Style.colorBackground
            border.width: 1
            border.color: Style.colorLightBorder
            radius: 5
        }
        
        
        RowLayout
        {
            anchors.centerIn: parent
            spacing: 4
            
            Image
            {
                id: tagIcon
                sourceSize.height: 18
                source: Icons.tag
                fillMode: Image.PreserveAspectFit
            }
            
            Label
            {
                id: tagLabel
                color: Style.colorBaseText
                text: "Tags"
                font.pointSize: 12
                font.family: Style.defaultFontFamily
                font.weight: Font.Bold
            }
        }
    }
    
    MouseArea
    {
        anchors.fill: parent
        
        onClicked: selectorPopup.open()
    }
    
    MTagSelectorPopup
    {
        id: selectorPopup
        y: root.height + 6
        closePolicy: Popup.CloseOnReleaseOutsideParent | Popup.CloseOnEscape
        
        onSelected:
        {
            close();
            root.tagSelected();
        }
    }
    
    
    function giveFocus()
    {
        root.forceActiveFocus();
    }
}
