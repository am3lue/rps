using Gtk

# Initialize global variable for AI choice cycling
global ans = 1

# Create main window
win = GtkWindow("Rock Paper Scissors", 400, 300)
set_gtk_property!(win, :border_width, 10)

# Create a vertical box layout
vbox = GtkBox(:v)
push!(win, vbox)

# Title label
title_label = GtkLabel("")
set_gtk_property!(title_label, :use_markup, true)
set_gtk_property!(title_label, :label, """<span foreground="blue" font="16">Choose Rock, Paper, or Scissors</span> """)
push!(vbox, title_label)

# Buttons for user choices
btn_rock = GtkButton("Rock")
btn_paper = GtkButton("Paper")
btn_scissors = GtkButton("Scissors")

set_gtk_property!(btn_rock, :margin_top, 10)
set_gtk_property!(btn_rock, :margin_bottom, 10)
set_gtk_property!(btn_rock, :width_request, 100)
set_gtk_property!(btn_rock, :height_request, 40)


set_gtk_property!(btn_paper, :margin_top, 10)
set_gtk_property!(btn_paper, :margin_bottom, 10)
set_gtk_property!(btn_paper, :width_request, 100)
set_gtk_property!(btn_paper, :height_request, 40)


set_gtk_property!(btn_scissors, :margin_top, 10)
set_gtk_property!(btn_scissors, :margin_bottom, 10)
set_gtk_property!(btn_scissors, :width_request, 100)
set_gtk_property!(btn_scissors, :height_request, 40)

hbox_buttons = GtkBox(:h)  # Horizontal layout for buttons
push!(hbox_buttons, btn_rock, btn_paper, btn_scissors)
push!(vbox, hbox_buttons)

# Label to display results
result_label = GtkLabel("")
push!(vbox, result_label)

# Function to handle game logic
function play_game(user_choice::Int)
    global ans

    # Cycle AI choice: 1 -> 2 -> 3 -> 1 ...
    ans = (ans % 3) + 1

    # Determine winner
    if ans == user_choice
        set_gtk_property!(result_label, :label, "It's a Draw! 🤝")
    elseif (ans == 1 && user_choice == 2) || (ans == 2 && user_choice == 3) || (ans == 3 && user_choice == 1)
        set_gtk_property!(result_label, :label, "You Won! 🎉")
    else
        set_gtk_property!(result_label, :label, "I Won! 😈")
    end
end

# Button click events
signal_connect(btn_rock, "clicked") do widget
    play_game(1)  # Rock = 1
end

signal_connect(btn_paper, "clicked") do widget
    play_game(2)  # Paper = 2
end

signal_connect(btn_scissors, "clicked") do widget
    play_game(3)  # Scissors = 3
end

showall(win)

