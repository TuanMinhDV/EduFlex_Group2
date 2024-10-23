(function ($) {


    $.fn.Bloging = function (options) {


//      Cac gia tri mac dinh cua options
        var defaults = {
            content1: '#content1',
            content2: '#content2',
            content3: '#content3',
            content: '#content',
            sub_content: '#sub_content',
            sortSelect: '#sortSelect',
            searchKeyName: '.search_key_name'
        };
        options = $.extend(defaults, options);
        var keyName = "";
        var listBlog = [];
        var listBlogRelated = [];
        var listSlider1 = [];
        var listSlider2 = [];
        var listSlider3 = [];
        var currentSort = 'default';
        var sortSelect = $(options.sortSelect);
        var searchKeyName = $(options.searchKeyName);
        var content1 = $(options.content1);
        var content2 = $(options.content2);
        var content3 = $(options.content3);
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
            let sliderList1 = '';
            let sliderList2 = '';
            let sliderList3 = '';

            for (let i = 0; i < listSlider1.length; i++) {
                sliderList1 += '<div class="item" style="background-image: url(data:image/jpeg;base64,' + listSlider1[i].image + ');">' +
                        '<div class="item-desc">' +
                        '<h3 style="font-family: Roboto, sans-serif; font-size: 25px; color: white">' + listSlider1[i].title + '</h3>' +
                        '<a href="#" class="genric-btn link" style="font-family: Roboto, sans-serif; font-size: 15px; background-color: black; color: #FFF">View Detail</a>' +
                        '</div>' +
                        '</div>';
            }
            for (let i = 0; i < listSlider2.length; i++) {
                sliderList2 += '<div class="media post_item" id="sub_content">' +
                        '<div class="media post_item">' +
                        '<img src="data:image/jpeg;base64,' + listBlogRelated[i].image + '" alt="post" style="height: 50%; width: 15%">' +
                        '<div class="media-body">' +
                        '<a href="blogdetail?id=' + listBlogRelated[i].id + '">' +
                        '<h3 style="color: #2d2d2d;">' + listBlogRelated[i].title + '</h3>' +
                        '</a>' +
                        '<p>' + listBlogRelated[i].created_date + '</p>' +
                        '</div>' +
                        '</div>' +
                        '</div>';
            }

            for (let i = 0; i < listSlider3.length; i++) {
                sliderList3 +=
                        '<div class="properties__img overlay1">' +
                        '<a href="#"><img src="data:image/jpeg;base64,' + listSlider3[i].image + '" style="width: 100%" alt=""></a>' +
                        '</div>' +
                        '<div class="properties__caption">' +
                        '<p style="font-family: Roboto, sans-serif; font-size: 24px;">' + listSlider3[i].title + '</p>' +
                        '<h2 style="font-family: Roboto, sans-serif; font-size: 18px; color: #ff6600">Time Remaining</h2>' +
                        '<time class="countdown" date-time="2023-12-25 00:00:00" style="--accent: red"></time>' +
                        '&nbsp;&nbsp;' +
                        '<a href="#" class="border-btn border-btn2">Find out more</a>' +
                        '</div>';
            }

            content1.html(sliderList1);
            content2.html(sliderList2);
            content3.html(sliderList3);
            content.html(blogList);
            sub_content.html(blogListRelated);
            return;
        }

        function getData() {
            listBlog = [];
            listBlogRelated = [];
            listSlider1 = [];
            listSlider2 = [];
            listSlider3 = [];
            var data = {
                key: keyName
            };
            $.ajax({
                async: false,
                url: "/holalearn/sliderlist",
                type: "POST",
                dataType: "json",
                data: data,
                success: function (response) {
                    
                    listSlider1 = JSON.parse(response.list1);
                    listSlider2 = JSON.parse(response.list2);
                    listSlider3 = JSON.parse(response.list3);

                    
                    console.log(listSlider1);
                    console.log(listSlider2);
                    console.log(listSlider3);

                }
            });
        }

    };

})(jQuery);

$(document).ready(function (e) {
    var obj = {};
    $("#main").Bloging(obj);
});



