-- script written by Shadowdara

-- run on execution
print("Custom Shell Terminal in Lua by Shadowdara\n")
while true do
    io.write("\n> ")
    com = io.read()
    com = string.gsub(com, "^%s*(.-)%s*$", "%1")

    if com == 'exit 0' then
        os.exit(0)

    else
        io.write(com .. ": Invalid command!")

    end
end
