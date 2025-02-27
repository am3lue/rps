using Pkg

println("\n \n \n \n \n \n -----------------Initializing--------------------\n \n \n \n")
# Function to read and print file content
function read_and_print_file(filename::String)
    try
        # Open the file in read mode
        open(filename, "r") do file
            for line in eachline(file)
                # Read all content of the file

                # Print the content
                Pkg.add(line)
            end
        end
    catch e
        println("Error reading file: $e")
    end
end

# Specify the filename
filename = "req.txt"

# Call the function
read_and_print_file(filename)

include("rpsgui.jl")
