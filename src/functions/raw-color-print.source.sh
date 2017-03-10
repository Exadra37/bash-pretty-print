#!/bin/bash
# @package exadra37-bash/pretty-print
# @link    https://gitlab.com/u/exadra37-bash/pretty-print
# @since   2017/03/09
# @license GPL-3.0
# @author  Exadra37(Paulo Silva) <exadra37ingmailpointcom>
#
# Social Links:
# @link    Auhthor:  https://exadra37.com
# @link    Github:   https://gitlab.com/Exadra37
# @link    Github:   https://github.com/Exadra37
# @link    Linkedin: https://uk.linkedin.com/in/exadra37
# @link    Twitter:  https://twitter.com/Exadra37


########################################################################################################################
# Functions
########################################################################################################################

    function Print_Text_With_Label()
    {
        local _label_text="${1}"

        local _text="${2}"

        local _label_background_color="${3:-42}"

        local _text_background_color="${4:-229}"

        printf "\n\e[1;${_label_background_color}m ${_label_text}:\e[30;48;5;${_text_background_color}m ${_text} \e[0m \n"
    }

    function Print_Text()
    {
        local _text="${1}"

        local _text_color="${2:-44}"

        printf "\n\e[1;${_text_color}m ${_text} \e[0m \n"
    }
