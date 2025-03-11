
$(document).ready(function () {
    debugger
    GetProductList();
    $('#ddlIsActive').select2();
});

$(document).on('click', '#ProductItemSearch', function () {
    $("#ProductItemList").dataTable().fnDestroy();
    GetProductList();
});

function GetProductList() {
    debugger
    $('#ProductItemList').dataTable({
        "responsive": true,
        "bServerSide": true,
        "sAjaxSource":  '/Home/GetProductList',
        "fnServerParams": function (aoData, fnCallback) {
            aoData.push({ "name": "Name", "value": $("#txtName").val() });
        },
        "processing": true,
        "bLengthChange": true,
        "bInfo": true,
        "paging": true,
        "searching": false,
        "columnDefs": [],
        "order": [[0, "desc"]],
        "lengthMenu": [10, 25, 50, 75, 100],
        "aoColumns": [
            { "sName": "ProductID", "bSearchable": false, "bSortable": true,"width":"10%" },
            { "sName": "ProductName", "bSearchable": false, "bSortable": true, "width": "20%" },
            { "sName": "Price", "bSearchable": false, "bSortable": true, "width": "20%" },
            { "sName": "Qauntity", "bSearchable": false, "bSortable": true, "width": "20%" },
            {
                "sName": "Action",
                "bSearchable": false,
                "bSortable": false,
                "mRender": function (data, type, aoData) {
                    var href = "/product/add-edit-product" + "?ProductID=" + aoData[0];
                    return '<a href=\"' + href + '\"><i class="fas fa-edit" style="cursor:pointer;"></i></a> <i style="cursor:pointer;" onclick="javascript:ConfirmDeleteProductItem(' + aoData[0] + ')" class="fas fa-trash-alt"></i>';

                }
            }
        ],
        oLanguage: {
            sEmptyTable: "No Records Found."
        }
    });
}

function ConfirmDeleteProductItem(ProductID) {
    $(".modal-header #ProductID").val(ProductID);
    $("#confirmDeleteProductItemModal").modal('show');;
}

function DeleteProductItem() {
    debugger
    $("#confirmDeleteProductItemModal").modal('hide');
    var ProductID = $("#ProductID").val();
    $.ajax({
        url:  "/Home/DeleteProduct",
        type: 'POST',
        data: { "ProductID": ProductID },
        dataType: "json",
    }).done(function (data, textStatus, jqXHR) {
        debugger
        if (data.result.allowToDelete == true) {
           // showToastPortal('success', '', "delete sucessfully");
            $("#ProductItemList").dataTable().fnDestroy();
            GetProductList();
        }
    }).fail(function (jqXHR, textStatus, errorThrown) {
        debugger
        showToastPortal('danger', '', MessagePortal.ProductItemDeletedFailed);
    }).always(function (data, textStatus, errorThrown) {
        //write content here
    });
}