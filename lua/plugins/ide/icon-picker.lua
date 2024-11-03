return {
    {
        "ziontee113/icon-picker.nvim",
        dependencies = {
            "stevearc/dressing.nvim",
        },
        config = {
            disable_legacy_commands = true,
        },
        cmd = {
            "IconPickerNormal",
            "IconPickerInsert",
            "IconPickerYank",
        },
    },
}
