(function ($) {


    $.fn.Bloging = function (options) {


//      Cac gia tri mac dinh cua options
        var defaults = {
            content: '#content',
            sub_content: '#sub_content',
            sortSelect: '#sortSelect',
            searchKeyName: '.search_key_name'
        };
        options = $.extend(defaults, options);
        var keyName = "";
        var listBlog = [];
        var listBlogRelated = [];
        var currentSort = 'default';
        var sortSelect = $(options.sortSelect);
        var searchKeyName = $(options.searchKeyName);
        var content = $(options.content);
        var sub_content = $(options.sub_content);
        var ascending = true;
        var flag = currentSort;

        init();
        //Ham khoi dong
        function init() {
            //Lay tong so trang
            getData();
            loadData();
//            console.log(currentSort);
//            console.log(ascending);

            searchKeyName.on("input", function (e) {
                filterByKeyName(this);
                getData();
                loadData();
            });

            sortSelect.on("change", function (e) {
                currentSort = sortSelect.val();
                if (flag !== currentSort) {
                    flag = currentSort;
                    ascending = true;
                }
                console.log(currentSort);
                console.log(ascending);
                sortBlog();
//                console.log(listBlog);
                loadData();
            });

        }



        function sortBlog() {

            if (currentSort === 'default') {
                flag = currentSort;
                listBlog.sort(function (a, b) {
                    return a.id - b.id;
                });
            } else if (currentSort === 'date') {
                listBlog.sort(function (a, b) {
                    return ascending ? a.created_date.localeCompare(b.created_date) : b.created_date.localeCompare(a.created_date);
                });
            } else if (currentSort === 'author') {
                listBlog.sort(function (a, b) {
                    return ascending ? a.fullname.localeCompare(b.fullname) : b.fullname.localeCompare(a.fullname);
                });
            } else if (currentSort === 'title') {
                listBlog.sort(function (a, b) {
                    return ascending ? a.title.localeCompare(b.title) : b.title.localeCompare(a.title);
                });
            }

            // Đảo ngược trạng thái sắp xếp cho lần sau
            ascending = !ascending;
        }



        function filterByKeyName(param) {
            keyName = param.value;
        }

        function loadData() {
            let blogList = '';
            let blogListRelated = '';
            for (let i = 0; i < listBlog.length; i++) {
                blogList += '<article class="blog_item">' +
                        '<div class="blog_item_img">' +
                        '<img class="card-img rounded-0" src="data:image/jpeg;base64,' + listBlog[i].image + '" alt="">' +
                        '<a class="blog_item_date">' +
                        '<h3>' + listBlog[i].created_date + '</h3>' +
                        '</a>' +
                        '</div>' +
                        '<div class="blog_details">' +
                        '<a class="d-inline-block" href="blogedit?id=' + listBlog[i].id + '">' +
                        '<h2 class="blog-head" style="color: #2d2d2d;">' + listBlog[i].title + '</h2>' +
                        '</a>' +
                        '<p>' + listBlog[i].description + '</p>' +
                        '<ul class="blog-info-link">' +
                        '<li><a href="#"><i class="fa fa-user"></i></a>' + listBlog[i].fullname + '</li>' +
                        '<li><a href="#"><i class="fa "></i></a>' + listBlog[i].tag + '</li>' +
                        '<li><a href="#"><i class="fa "></i></a>' + listBlog[i].status + '</li>' +
                        '</ul>' +
                        '<div>&nbsp;</div>' +
                        '<a href="blogdelete?id=' + listBlog[i].id + '" class="genric-btn danger-border" onclick="fin()">Delete</a>' +
                        '</div>' +
                        '</article>';
            }
            
            content.html(blogList);
            
            return;
        }

        function getData() {
            listBlog = [];
            listBlogRelated = [];
            var data = {
                key: keyName
            };
            $.ajax({
                async: false,
                url: "/holalearn/blog_marketer",
                type: "POST",
                dataType: "json",
                data: data,
                success: function (response) {
                    listBlog = JSON.parse(response.list1);     
                    console.log(listBlog);
                }
            });
        }

    };

})(jQuery);

$(document).ready(function (e) {
    var obj = {};
    $("#main").Bloging(obj);
});



