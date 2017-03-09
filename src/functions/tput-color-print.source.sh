#!/bin/bash
# @author Exadra37(Paulo Silva) <exadra37ingmailpointcom>
# @since  2016/05/21
# @link   http://exadra37.com

set -e


#################################################################################################################################################################
# Functions
#################################################################################################################################################################

    function Print_Success
    {
        local success="SUCCESS: $1"
        local before_success="$2"
        local after_success="$3"

        local background_color="green"
        local text_color="white"

        Print_Line_Break
        Print_Text_Background_Colored "$success" "$background_color" "$text_color" "$before_success" "$after_success"
        Print_Line_Break
    }

    function Print_Error
    {
        local error="ERROR: $1"
        local before_error="$2"
        local after_error="$3"

        local background_color="red"
        local text_color="white"

        Print_Line_Break
        Print_Text_Background_Colored "$error" "$background_color" "$text_color" "$before_error" "$after_error"
        Print_Line_Break
    }

    function Print_Critical_Error
    {
        local error="ERROR: $1"
        local before_error="$2"
        local after_error="$3"

        local background_color="red"
        local text_color="white"

        Print_Line_Break
        Print_Text_Background_Colored "$error" "$background_color" "$text_color" "$before_error" "$after_error"
        Print_Line_Break
    }

    function Print_Fatal_Error
    {
        local fatal_error="FATAL ERROR: $1"
        local before_fatal_error="$2"
        local after_fatal_error="$3"

        local background_color="red"
        local text_color="white"

        Print_Line_Break
        Print_Text_Background_Colored "$fatal_error" "$background_color" "$text_color" "$before_fatal_error" "$after_fatal_error"
        Print_Line_Break

        exit 1
    }

    function Print_Warning
    {
        local warning="WARNING: $1"
        local before_warning="$2"
        local after_warning="$3"

        local background_color="yellow"
        local text_color="black"

        Print_Line_Break
        Print_Text_Background_Colored "$warning" "$background_color" "$text_color" "$before_warning" "$after_warning"
        Print_Line_Break
    }

    function Print_Alert
    {
        local alert="ALERT: $1"
        local before_alert="$2"
        local after_alert="$3"

        local background_color="magenta"
        local text_color="white"

        Print_Line_Break
        Print_Text_Background_Colored "$alert" "$background_color" "$text_color" "$before_alert" "$after_alert"
        Print_Line_Break
    }

    function Print_Notice
    {
        local notice="NOTICE: $1"
        local before_notice="$2"
        local after_notice="$3"

        local background_color="cyan"
        local text_color="white"

        Print_Line_Break
        Print_Text_Background_Colored "$notice" "$background_color" "$text_color" "$before_notice" "$after_notice"
        Print_Line_Break
    }

    function Print_Info
    {
        local info="INFO: $1"
        local before_info="$2"
        local after_info="$3"

        local background_color="blue"
        local text_color="white"

        Print_Line_Break
        Print_Text_Background_Colored "$info" "$background_color" "$text_color" "$before_info" "$after_info"
        Print_Line_Break
    }

    function Print_Bold_Label_With_Text
    {
        Set_Bold_Text
        Print_Label_With_Text "$@"
    }

    function Print_Label_With_Text
    {
        local label="$1"
        local text_to_print="$2"
        local label_color="${3:-red}"
        local text_color="$4"
        local before_label="$5"
        local after_text="$6"

        local before_text=""

        Print_Label "$label" "$label_color" "$before_label"
        Print_Text_Colored "$text_to_print" "$text_color" "$before_text" "$after_text"
        Print_Line_Break
     }


    function Print_Bold_Label
    {
        Set_Bold_Text
        Print_Label "$@"
    }

    function Print_Label
    {
        test -z "$2" && set -- "${@:1}" "red"
        Print_Text_Colored "$@"
    }

    function Print_Bold_Title
    {
        Set_Bold_Text
        Print_Title "$@"
    }

    function Print_Title
    {
        Set_Text_Color 'green'
        Print_Text_Line "$@"
    }

    function Print_Bold_Comment
    {
        Set_Bold_Text
        Print_Comment "$@"
    }

    function Print_Comment
    {
        Set_Text_Color 'yellow'
        Print_Text_Line "$@"
    }

    function Print_Bold_Line
    {
        Set_Bold_Text
        Print_Line "$@"
    }

    function Print_Line
    {
        Set_Text_Color "white"
        Print_Text_Line "$@"
    }

    function Print_Text_Line
    {
        Print_Line_Break
        Print_Text "$@"
        Print_Line_Break
    }

    function Print_Bold_Paragraph
    {
        Set_Bold_Text
        Print_Paragraph "$@"
    }

    function Print_Paragraph
    {
        Print_Line_Break
        Print_Text_Colored "$@"
        Print_Line_Break
    }

    function Print_Bold_Text_Colored
    {
        Set_Bold_Text
        Print_Text_Colored "$@"
    }

    function Print_Bold_Text_Background_Colored
    {
        Set_Bold_Text
        Print_Text_Background_Colored "$@"
    }

    function Print_Text_Background_Colored
    {
        local text_to_print=" $1 " # do not remove spaces
        local background_color="$2"
        local text_color="$3"
        local before_text="$4"
        local after_text="$5"

        Set_Background_Color "$background_color"

        Print_Text_Colored "$text_to_print" "$text_color" "$before_text" "$after_text"
    }

    function Print_Text_Colored
    {
        local text_to_print="$1"
        local text_color="$2"
        local before_text="$3"
        local after_text="$4"

        Set_Text_Color "$text_color"

        Print_Text "$before_text$text_to_print$after_text"
    }

    function Set_Background_Color
    {
        local color_for_background="$1"

        case "$color_for_background" in
            black)   tput setab 0;;
            red)     tput setab 1;;
            green)   tput setab 2;;
            yellow)  tput setab 3;;
            blue)    tput setab 4;;
            magenta) tput setab 5;;
            cyan)    tput setab 6;;
            white)   tput setab 7;;
        esac
    }

    function Set_Text_Color
    {
        local color_for_text="$1"

        case "$color_for_text" in
            black)   tput setaf 0;;
            red)     tput setaf 1;;
            green)   tput setaf 2;;
            yellow)  tput setaf 3;;
            blue)    tput setaf 4;;
            magenta) tput setaf 5;;
            cyan)    tput setaf 6;;
            white)   tput setaf 7;;
        esac
    }

    function Set_Bold_Text
    {
        tput bold
    }

    function Print_Line_Break
    {
        printf "\n"
    }

    function Print_Empty_Line
    {
        printf "\n\n"
    }

    function Print_Line_Tab
    {
        printf "\t"
    }

    function Print_Text
    {
        local text_to_print="$1"
        local before_text="$2"
        local after_text="$3"

        printf "${before_text}${text_to_print}${after_text}"

        Reset_Tput
    }

    function Reset_Tput
    {
        tput sgr0
    }
