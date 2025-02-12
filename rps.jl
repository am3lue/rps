using FIGlet

global ans = 1

function game()
    global ans
    println("Please enter your choice:")
    println("""
    1. Rock
    2. Paper
    3. Scissors
    """)

    choice = tryparse(Int, readline())  # Convert input to an integer safely

    if choice ∉ [1, 2, 3]
        println("\033[91mInvalid choice! Please enter 1, 2, or 3.\033[0m")
        return
    end

    # Cycle `ans` through 1, 2, 3 in a predictable manner
    ans = (ans % 3) + 1  

    # Determine winner
    if ans == choice
        println("\033[93mIt's a Draw!\033[0m")
    elseif (ans == 1 && choice == 2) || (ans == 2 && choice == 3) || (ans == 3 && choice == 1)
        println("\033[92mUser Won!\033[0m")
    else
        println("\033[91mI Won!\033[0m")
    end
end

# Game loop
    FIGlet.render("ROCK" ,"dancing Font")
    FIGlet.render("PAPER", "3d")
    FIGlet.render("SCISSORS", "ANSI Shadow")
    println("\033[94m","\t\t\t\t\t\t\t\t\t\tmade by blue","\033[0m")
while true
    game()
    println("\n\n\n")
end
