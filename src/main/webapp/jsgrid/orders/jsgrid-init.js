$(function() {

    $("#jsGrid").jsGrid({
        height: "100%",
        width: "100%",
        filtering: false,
        editing: true,
        inserting: true,
        sorting: true,
        paging: true,
        autoload: true,
        pageSize: 15,
        pageButtonCount: 10,
        deleteConfirm: "Do you really want to delete the item?",
        controller: db,
        fields: [
            { name: "User Id", type: "text", width: 150, editable: false},
            { name: "Product Id", type: "password", width: 50, editable: false },
            { name: "Product Name", type: "text", width: 200 },
            { name: "Count", type: "text", width: 200},
            { name: "Notes", type:"text", width:200},
            { name: "Address Id", type:"text", width:200, editable: false},
            { name: "Status", type:"text", width:200},
            { name: "Date", type:"text", width:200},
            { type: "control" }
        ]
    });


});