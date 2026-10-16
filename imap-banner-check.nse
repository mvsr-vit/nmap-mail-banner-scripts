description = [[
Retrieves and displays the banner from an IMAP server.
]]

author = "Siva Raghavan M V"
license = "Same as Nmap"
categories = {"discovery", "safe"}

local nmap = require "nmap"
local shortport = require "shortport"
local stdnse = require "stdnse"

portrule = shortport.port_or_service(143, "imap")

action = function(host, port)
    local output = {
        "IMAP Banner Retrieval Script",
        "Target Host: " .. host.ip,
        "Port: " .. port.number .. "/" .. port.protocol,
        "Service: " .. (port.service or "unknown")
    }

    local socket = nmap.new_socket()
    socket:set_timeout(5000)

    local status, err = socket:connect(host, port)
    if not status then
        table.insert(output, "Error: Connection failed: " .. tostring(err))
        return stdnse.format_output(true, output)
    end

    local ok, banner = socket:receive_lines(1)
    socket:close()

    if ok and banner then
        table.insert(output, "Banner: " .. banner:gsub("[\r\n]+$", ""))
    else
        table.insert(output, "Error: Unable to retrieve IMAP banner.")
    end

    return stdnse.format_output(true, output)
end