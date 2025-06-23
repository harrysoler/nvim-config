return function(client, method, bufnr)
    if vim.fn.has 'nvim-0.11' == 1 then
        return client:supports_method(method, bufnr)
    else
        return client.supports_method(method, { bufnr = bufnr })
    end
end
