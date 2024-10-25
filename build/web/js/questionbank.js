/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

(function ($) {
    $.fn.zPaging = function (options) {
        //=================================
        // Cac gia tri mac dinh cua option
        //=================================
        var defaults = {
            "rows": "#rows",
            "pages": "#pages",
            "items": 3,
            "height": 200,
            "currentPage": 1,
            "total": 0,
            "btnPrevious": ".goPrevious",
            "btnNext": ".goNext",
            "txtCurrentPage": "#currentPage",
            "pageInfo": ".pageInfo",
            "listProduct": "#list-product",
            "txtSearch": ".txtSearch"
        };
        options = $.extend(defaults, options);
        //=================================
        // Cac bien se su dung trong Plugin
        //=================================
        var rows = $(options.rows);
        var pages = $(options.pages);
        var btnPrevious = $(options.btnPrevious);
        var btnNext = $(options.btnNext);
        var txtCurrentPage = $(options.txtCurrentPage);
        var lblPageInfo = $(options.pageInfo);
        var listProd = [];
        var list = $(options.listProduct);
        var txtSearch = $(options.txtSearch);
        var name = "";
        //=================================
        // Khoi tao cac ham can thiet khi Plugin duoc su dung
        //=================================
        init();
        setRowsHeight();

        //=================================
        // Ham khoi dong
        //=================================
        function init() {
            getData();
            pageInfo();
            loadData(options.currentPage);
            setCurrentPage(options.currentPage);
            //Gan su kien vao cho btnPrevious - btnNext - txtCurrentPage
            setCurrentPage(options.currentPage);
            btnPrevious.on("click", function (e) {
                goPrevious();
            });
            btnNext.on("click", function (e) {
                goNext();
            });
            txtCurrentPage.on("keyup", function (e) {
                if (e.keyCode === 13) {
                    var currentPageValue = parseInt($(this).val());
                    if (isNaN(currentPageValue) || currentPageValue <= 0 || currentPageValue > options.total)
                        alert("Gia tri nhap vao khong phu hop");
                    else {
                        loadData(currentPageValue);
                        options.currentPage = currentPageValue;
                        pageInfo();

                    }
                }
            });
            txtSearch.on("input", function(e){
                searchByName(this);
                getData();
                options.currentPage = 1;
                loadData(options.currentPage);
                setCurrentPage(options.currentPage);
                pageInfo();
            });
        }
        //=================================
        // Ham xu ly btnPrevious
        //=================================
        function goPrevious() {
            if (options.currentPage !== 1) {
                var p = options.currentPage - 1;
                loadData(p);
                setCurrentPage(p);
                options.currentPage = p;
                pageInfo();
            }
        }
        //=================================
        // Ham xu ly btnNext
        //=================================
        function goNext() {
            if (options.currentPage !== options.total) {
                var p = options.currentPage + 1;
                loadData(p);
                setCurrentPage(p);
                options.currentPage = p;
                pageInfo();
            }
        }
        //=================================
        // Ham xu ly gia tri trong o txt box
        //=================================
        function setCurrentPage(value) {
            txtCurrentPage.val(value);
        }
        //=================================
        // Ham xu ly thong tin phan trang
        //=================================
        function pageInfo() {
            console.log(options.currentPage);
            lblPageInfo.text("Page " + options.currentPage + " of " + options.total);
        }
        //=================================
        // Ham load cac thong tin trong database va dua vao #row
        //=================================
        function loadData(curPage) {
            var html = "";
            if (listProd.length > 0) {
                if (curPage === options.total) {
                    for (var i = (curPage - 1) * options.items; i < listProd.length; i++) {
                        var prod = listProd[i];
                        html += '<div class="col-lg-4" listItem>'+
                        '<div class="properties properties2 mb-30">'+
                            '<div class="properties__card">' +
                                '<div class="properties__img overlay1">'+
                                    '<a href="#"><img src="data:image/jpeg;base64,'+prod.image+'" alt=""></a>'+
                                '</div>'+
                                '<div class="properties__caption">'+
                                    '<p>Subject Name</p>'+
                                    '<h3><a href="#">'+prod.subject_name+'</a></h3>'+
                                    '<a href="questionbank?sid='+prod.subject_id+'" class="border-btn border-btn2">Manage Questions</a>'+
                                '</div>'+
                            '</div>'+
                        '</div>'+
                    '</div>';
                    }
                    list.html(html);
                    list.show();
                    return;
                } else {
                    for (var i = (curPage - 1) * options.items; i < (curPage - 1) * options.items + options.items; i++) {
                        var prod = listProd[i];
                        html +='<div class="col-lg-4" listItem>'+
                        '<div class="properties properties2 mb-30">'+
                            '<div class="properties__card">' +
                                '<div class="properties__img overlay1">'+
                                    '<a href="#"><img src="data:image/jpeg;base64,'+prod.image+'" alt=""></a>'+
                                '</div>'+
                                '<div class="properties__caption">'+
                                    '<p>Subject Name</p>'+
                                    '<h3><a href="#">'+prod.subject_name+'</a></h3>'+
                                    '<a href="questionbank?sid='+prod.subject_id+'" class="border-btn border-btn2">Manage Questions</a>'+
                                '</div>'+
                            '</div>'+
                        '</div>'+
                    '</div>';
                    }
                    list.html(html);
                    pages.show();
                    return;
                }
            } else {

            }
        }
        function getData() {
            listProd = [];
            var data = {
              key: name
            };
            $.ajax({
                async: false,
                url: "/holalearn/lecturersubject",
                type: "post",
                dataType: 'json',
                data: data,
                success: function (data) {
                    listProd = JSON.parse(data.list);
                    console.log(listProd);
                    options.total = Math.ceil(listProd.length / options.items);
                    console.log(options);
                }
            });
        }
        //=================================
        // Ham xu ly xoa di 1 item
        //=================================
        function deleteItem(obj) {

        }
        //=================================
        // Ham thiet lap chieu cao 
        //=================================
        function setRowsHeight() {
            var ulHeight = (options.items * options.height) + "px";
            list.css("height", ulHeight);
        }
        
        function searchByName(param){
            name = param.value;
        }
    };
})(jQuery);
$(document).ready(function (e) {
    var obj = {};
    $("#paging").zPaging(obj);
});


