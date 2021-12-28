$(document).ready(function () {

    $("#AllProductsDT").DataTable({
        "order": [[2, "asc"]],
        columnDefs: [
            { type: 'currency', targets: [3] }
        ],
        language: {
            url: '//cdn.datatables.net/plug-ins/1.10.25/i18n/Turkish.json'
        }
    });

    $("#AllCategoriesDT").DataTable({
        "order": [[0, "asc"]],
        language: {
            url: '//cdn.datatables.net/plug-ins/1.10.25/i18n/Turkish.json'
        }
    });
});
jQuery.extend(jQuery.fn.dataTableExt.oSort, {
    "currency-pre": function (a) {
        a = (a === "-") ? 0 : a.replace(/[^\d\-\.]/g, "");
        return parseFloat(a);
    },

    "currency-asc": function (a, b) {
        return a - b;
    },

    "currency-desc": function (a, b) {
        return b - a;
    }
});