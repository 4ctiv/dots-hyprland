#!/bin/bash

# Get the notification history from makoclt
#makoclt history | rofi -dmenu -p "Mako History:"

##################################################
# Define the format for each notification line.
# We use <span tags for styling in Rofi, and replace newlines with a separator.
# Rofi needs the -markup-rows flag to render the spans.
makoclt history | awk '
BEGIN {
    RS="\n\nid: "; # Record Separator: matches the empty line and "id: " before each notification
    ORS="\n";      # Output Record Separator: a single newline for Rofi
    print_flag=0;
}
# Skip the first "record" which is usually empty or just the first part of the first notification
NR == 1 { next; }

# For every other record (each is a notification)
{
    # Replace internal newlines with an escape sequence for Rofi display
    # (e.g., " | " or " - ")
    # Replace the first newline (from the RS) with a space
    gsub(/\n/, " | ");

    # Optional: Highlight the "app-name:" part
    # Use Pango markup: <b>bold</b>, <i>italic</i>, <span foreground="#color">color</span>

    # We will specifically look for the "app-name: " line and format it.

    # Print the formatted line for Rofi
    print "<span weight='bold'>" $0 "</span>"
}' | rofi -dmenu -i -p "Mako History:" -markup-rows
