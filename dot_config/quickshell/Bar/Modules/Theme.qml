pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    property bool full_ui: true
    property bool floating_feel: true

    property string wallpaper: "girl_lightish.png"

    property string bar_bg: "#282828"
    property string bar_fg: "#d3cec0"

    property string bar_widget_bg: "#383838"
    property string bar_widget_hovered_bg: "#484848"
    property string bar_widget_active_bg: "#b3aea0"

    property string bar_widget_widget_bg: "#484848"
    property string bar_widget_widget_hovered_bg: "#585858"

    property string color_urgent: "#e25d5b"

    property string font_family: "JetBrainsMono Nerd Font Propo"

    property font bar_font: ({
            family: root.font_family,
            pixelSize: 15,
            bold: true
        })

    property int bar_side_margin: 12 // Left/Right

    property int bar_height: 52

    property int bar_top_bottom_gap: 10
    property int bar_left_right_gap: 10

    property int bar_rounding: 10

    property int bar_widget_spacing: 10

    property int bar_widget_rounding: 20

    property int bar_widget_widget_rounding: 2

    property int systray_icon_size: 35

    property int systray_icon_margin: 10

    property alias dashboard_margin: root.bar_side_margin

    property int dashboard_toggle_width: 40
    property int dashboard_toggle_height: 40

    property int dashboard_toggle_rounding: root.slider_height / 2

    property int dashboard_toggle_spacing: 5

    property int slider_height: 30

    property int slider_prefix_width: 25

    property int notif_margin: 5

    property alias notif_gap: root.bar_top_bottom_gap

    property int notif_width: 280
    property int notif_height: 120

    property int notif_title_height: 24

    property int notif_head_font_size: 16

    property int notif_body_font_size: 12

    property int notif_txt_margin: 5

    property int media_player_height: 35

    property int media_player_padding: 7
    property int media_player_text_padding: 12

    property int media_player_title_font_size: 18

    property int media_player_max_title_width: 250

    property int media_player_duration_width: 150
}
