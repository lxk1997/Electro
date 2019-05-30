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
                    { name: "User Name", type: "text", width: 150 },
                    { name: "Password", type: "password", width: 50 },
                    { name: "Email", type: "text", width: 200 },
                    { name: "Phone", type: "text", width: 200},
                    { name: "First Name", type:"text", width:200},
                    { name: "Last Name", type:"text", width:200},
                    { name: "Address", type:"text", width:200},
                    { name: "City", type:"text", width:200},
                    { name: "Country", type:"text", width:200},
                    { name: "ZipCode", type:"text", width:200},
                    { type: "control" }
                ]
            });

            $("#user-editable").jsGrid({
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
                deleteConfirm: "Do you really want to delete the user?",
                controller: db,
                fields: [
                    { name: "User Name", type: "text", width: 150 },
                    { name: "Password", type: "password", width: 50 },
                    { name: "Email", type: "text", width: 200 },
                    { name: "Phone", type: "text", width: 200},
                    { name: "First Name", type:"text", width:200},
                    { name: "Last Name", type:"text", width:200},
                    { name: "Address", type:"text", width:200},
                    { name: "City", type:"text", width:200},
                    { name: "Country", type:"text", width:200},
                    { name: "ZipCode", type:"text", width:200},
                    { type: "control" }
                ]
            });

        });