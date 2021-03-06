define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'area/index',
                    add_url: 'area/add',
                    edit_url: 'area/edit',
                    del_url: 'area/del',
                    multi_url: 'area/multi',
                    table: 'area',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'pid', title: __('Pid')},
                        {field: 'shortname', title: __('Shortname')},
                        {field: 'name', title: __('Name')},
                        {field: 'mergename', title: __('Mergename')},
                        {field: 'level', title: __('Level'), visible:false, searchList: {"4":__('Level 4')}},
                        {field: 'level_text', title: __('Level'), operate:false},
                        {field: 'pinyin', title: __('Pinyin')},
                        {field: 'code', title: __('Code')},
                        {field: 'zip', title: __('Zip')},
                        {field: 'first', title: __('First')},
                        {field: 'lng', title: __('Lng')},
                        {field: 'lat', title: __('Lat')},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});