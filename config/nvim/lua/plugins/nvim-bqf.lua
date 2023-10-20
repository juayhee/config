return {
    'kevinhwang91/nvim-bqf',
    config = function() 
        require('bqf').setup({
            func_map = {
                prevfile = 'k',
                nextfile = 'j',
            }
        })
    end

}
