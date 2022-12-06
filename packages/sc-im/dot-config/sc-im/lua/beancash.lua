-- this script gets the current cash value from beancount using a script
-- thanks to: https://stackoverflow.com/a/9676174 for lua io.popen idea
--
local handle = io.popen("~/Dropbox/budget/cash.sh")
local result = handle:read("*a")
handle:close()

-- 2,15 = C15 in the sc-im file
sc.lsetnum(2, 15, result)

