local presence_status_ok, presence = pcall(require, "presence")
if not presence_status_ok then
	return
end

presence:setup({})
