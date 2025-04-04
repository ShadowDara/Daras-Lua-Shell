-- script written by Shadowdara

math.randomseed(os.time())

-- names for random generator
names = {
    -- boy names
    boys = {
        "Liam", "Noah", "Oliver", "Elijah", "James", "William", "Benjamin", "Lucas", "Henry", "Alexander", "Mason", "Michael", "Ethan", "Daniel", "Jacob", "Logan", "Jackson", "Levi", "Sebastian", "Mateo", "Jack", "Owen", "Theodore", "Aiden", "Samuel", "Joseph", "John", "David", "Wyatt", "Matthew", "Luke", "Asher", "Carter", "Julian", "Grayson", "Leo", "Jayden", "Gabriel", "Isaac", "Lincoln", "Anthony", "Hudson", "Dylan", "Ezra", "Thomas", "Charles", "Christopher", "Jaxon", "Maverick", "Josiah", "Isaiah", "Andrew", "Elias", "Joshua", "Nathan", "Caleb", "Ryan", "Adrian", "Miles", "Eli", "Nolan", "Christian", "Aaron", "Cameron", "Ezekiel", "Colton", "Luca", "Landon", "Hunter", "Jonathan", "Santiago", "Axel", "Easton", "Cooper", "Jeremiah", "Angel", "Roman", "Connor", "Jameson", "Robert", "Greyson", "Jordan", "Ian", "Carson", "Jaxson", "Leonardo", "Nicholas", "Dominic", "Austin", "Everett", "Brooks", "Xavier", "Kai", "Jose", "Parker", "Adam", "Jace", "Wesley", "Kayden", "Silas"
    },
    -- girl names
    girls = {
        "Olivia", "Emma", "Charlotte", "Amelia", "Sophia", "Isabella", "Ava", "Mia", "Evelyn", "Luna", "Harper", "Camila", "Gianna", "Abigail", "Ella", "Avery", "Scarlett", "Emily", "Aria", "Penelope", "Chloe", "Layla", "Mila", "Nora", "Hazel", "Madison", "Ellie", "Lily", "Nova", "Isla", "Grace", "Violet", "Aurora", "Riley", "Zoey", "Willow", "Emilia", "Stella", "Zoe", "Victoria", "Hannah", "Addison", "Leah", "Lucy", "Eliana", "Ivy", "Everly", "Lillian", "Paisley", "Elena", "Naomi", "Maya", "Natalie", "Kinsley", "Delilah", "Claire", "Audrey", "Aaliyah", "Ruby", "Brooklyn", "Alice", "Aubrey", "Autumn", "Leilani", "Savannah", "Valentina", "Kennedy", "Madeline", "Josephine", "Bella", "Skylar", "Genesis", "Sophie", "Hailey", "Sadie", "Natalia", "Quinn", "Caroline", "Allison", "Gabriella", "Anna", "Serenity", "Nevaeh", "Cora", "Ariana", "Emery", "Lydia", "Jade", "Sarah", "Eva", "Adeline", "Madelyn", "Piper", "Rylee", "Athena", "Peyton", "Everleigh", "Vivian", "Clara", "Raelynn"
    }
}

-- for the slang
gen_z_slangs = {
    "sus",
    "skibidi",
    "yapping",
    "cringe",
    "bro",
    "bruh",
    "rizz",
    "sigma"
}

-- for info command
infolist = {"info", "info_info", "info_cal", "info_slang", "info_random", "info_shortcuts"}
infos = {
    info = ">> info: Displays avalaible commads with a little description",
    info_info = ">> info *: Display external links for more information about this!",
    info_cal = ">> info cal: call is a little calculator which supports 2 numbers and +, -, * and /",
    info_slang = ">> info slang: a secret, try it out!",
    info_random = ">> info random: generates a random number between 1 and 100",
    info_name = ">> info name: generates a random name",
    info_shortcuts = ">> info shortcuts:\n'n' for name\n'r' for random\n'z' for slang"
}

-- script functions
function full_print_dictionary(dic, indexdic)
    for x = 1, #indexdic, 1 do
        print(dic[indexdic[x]])
    end
end

-- try calcumlater!
function check_number(str)
    return tonumber(str) ~= nil
end

function extract_number(input, start_index)
    local nr_start = start_index
    local nr_end = start_index
    while nr_end <= #input and check_number(string.sub(input, nr_end, nr_end)) do
        nr_end = nr_end + 1
    end
    if tonumber(string.sub(input, nr_end - 1)) == false then
        nr_end = nr_end - 1
    end
    return tonumber(string.sub(input, nr_start, nr_end - 1)), nr_end
end

function str_calculate(input)
    input = input:gsub(" ", "")

    local num1, num2, operator
    local operator_pos

    for i = 1, #input do
        local char = string.sub(input, i, i)
        if char == "+" or char == "-" or char == "*" or char == "/" then
            operator = char
            operator_pos = i
            num1, _ = extract_number(input, 1)
            break
        end
    end

    num2, _ = extract_number(input, operator_pos + 1)

    local result
    if operator == "+" then
        result = num1 + num2
    elseif operator == "-" then
        result = num1 - num2
    elseif operator == "*" then
        result = num1 * num2
    elseif operator == "/" then
        if num2 ~= 0 then
            result = num1 / num2
        else
            result = "Fehler: Division durch Null!"
        end
    end

    return result
end

-- run on execution

print("Custom Shell Terminal in Lua by Shadowdara\n\n>> type 'info' for more information!\n")

while true do
    io.write("$ ")
    com = io.read()
    com = string.gsub(com, "^%s*(.-)%s*$", "%1")

    if com == 'r' then
        com = 'random'

    elseif com == 'z' then
        com = 'slang'

    elseif com == 'n' then
        com = 'name'
    end

    if com == "" then

    elseif string.sub(com, 1, 3) == 'cal' then
        if string.sub(com, 4, -1) == "" then
            print("info missing 12")
        else
            io.write(">> result: ", str_calculate(string.sub(com, 5, -1)), "\n")
        end

    elseif string.sub(com, 1, 4) == 'echo' then
        print(string.sub(com, 6, -1))

    elseif string.sub(com, 1, 6) == 'exit 0' then
        os.exit(0)

    elseif string.sub(com, 1, 4) == 'info' then

        if string.sub(com, 6, -1) == "" then
            print(">> Infomation about commands")
            print(">> for more information about a particular commandtype info and than the command name!")
            print(">> Type 'info *' to see all avalaible commands!")

        elseif string.sub(com, 6) == '*' then
            full_print_dictionary(infos, infolist)
        
        elseif string.sub(com, 6, 8) == "cal" then
            print(infos["info_cal"])

        elseif string.sub(com, 6, 10) == "slang" then
            print(infos["info_slang"])

        elseif string.sub(com, 6, 12) == "random" then
            print(infos["info_random"])

        elseif string.sub(com, 6, 16) == "shortcuts" then
            print(infos["info_shortcuts"])

        end

    elseif string.sub(com, 1, 7) == 'random' then
        io.write(">> ", math.random(1, 100), "\n")

    elseif string.sub(com, 1, 5) == 'slang' then
        io.write(">> ", gen_z_slangs[math.random(1, 8)], "\n")

    elseif string.sub(com, 1, 4) == 'name' then
        category = math.random(2) == 1 and "boys" or "girls"
        randomIndex = math.random(#names[category])
        randomName = names[category][randomIndex]
        io.write(">> ", randomName, "\n")

    elseif string.sub(com, 1, 3) == 'tbh' then
        print(">> 'tbh' means to be hones!t")

    else
        io.write(com .. ": Invalid command!\n")
    end
end
