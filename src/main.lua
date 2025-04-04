-- script written by Shadowdara

-- script vars

-- for info command
infolist = {"info", "info_info"}
infos = {
    info = "info: Displays avalaible commads with a little description",
    info_info = "info *: Display external links for more information about this!"
}

-- script functions
function full_print_dictionary(dic, indexdic)
    for x = 1, #indexdic, 1 do
        print(dic[indexdic[x]])
    end
end

-- try calcumlater!
-- Hilfsfunktion, um zu überprüfen, ob der Eingabewert eine Zahl ist
function check_number(str)
    return tonumber(str) ~= nil
end

-- Funktion zur Extraktion einer Zahl von einer gegebenen Position
function extract_number(input, start_index)
    local nr_start = start_index
    local nr_end = start_index
    while nr_end <= #input and check_number(string.sub(input, nr_end, nr_end)) do
        nr_end = nr_end + 1
    end
    -- Sicherstellen, dass wir eine gültige Zahl extrahieren
    if tonumber(string.sub(input, nr_end - 1)) == false then
        nr_end = nr_end - 1
    end
    return tonumber(string.sub(input, nr_start, nr_end - 1)), nr_end
end

-- Die Hauptberechnungsfunktion
function str_calculate(input)
    -- Entferne alle Leerzeichen aus dem Eingabestring
    input = input:gsub(" ", "")

    local num1, num2, operator
    local operator_pos

    -- Suche nach dem Operator (+, -, *, /) und der Position der ersten Zahl
    for i = 1, #input do
        local char = string.sub(input, i, i)
        if char == "+" or char == "-" or char == "*" or char == "/" then
            operator = char
            operator_pos = i
            num1, _ = extract_number(input, 1)
            break
        end
    end

    -- Extrahiere die zweite Zahl nach dem Operator
    num2, _ = extract_number(input, operator_pos + 1)

    -- Berechnung je nach Operator
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
print("Custom Shell Terminal in Lua by Shadowdara\n")
while true do
    io.write("$ ")
    com = io.read()
    com = string.gsub(com, "^%s*(.-)%s*$", "%1")

    if com == "" then
        print("The Input was empty!")

    elseif string.sub(com, 1, 3) == 'cal' then
        if string.sub(com, 4, -1) == "" then
            print("info missing 12")
        else
            io.write(">result: ", str_calculate(string.sub(com, 5, -1)), "\n")
        end

    elseif string.sub(com, 1, 4) == 'echo' then
        print(string.sub(com, 6, -1))

    elseif string.sub(com, 1, 6) == 'exit 0' then
        os.exit(0)

    elseif string.sub(com, 1, 4) == 'info' then

        if string.sub(com, 6, -1) == "" then
            print("> Infomation about commands")
            print("> for more information about a particular commandtype info and than the command name!")
            print("> Type 'info *' to see all avalaible commands!")            

        elseif string.sub(com, 6) == '*' then
            full_print_dictionary(infos, infolist)
        end

    else
        io.write(com .. ": Invalid command!\n")
    end
end
