-- script written by Shadowdara

-- script vars

-- for info command
infolist = {"info", "info_info"}
infos = {
    info = "info: Displays avalaible commads with a little description",
    info_info = "info info: Display external links for more information about this!"
}

-- script functions
function full_print_dictionary(dic, indexdic)
    for x = 1, #indexdic, 1 do
        print(dic[indexdic[x]])
    end
end

-- run on execution
print("Custom Shell Terminal in Lua by Shadowdara\n")
while true do
    io.write("E: ")
    com = io.read()
    com = string.gsub(com, "^%s*(.-)%s*$", "%1")

    if com == "" then
        print("The Input was empty!")

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

    elseif string.sub(com, 1, 4) == 'echo' then
        print(string.sub(com, 6, -1))

    else
        io.write(com .. ": Invalid command!\n")
    end
end
