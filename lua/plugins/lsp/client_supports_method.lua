return function(client, method, bufnr)
    return client:supports_method(method, bufnr)
end
