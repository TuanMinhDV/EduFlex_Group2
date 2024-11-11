(function ($) {


    $.fn.zPagingSubject = function (options) {


//      Cac gia tri mac dinh cua options
        var defaults = {
            listSubject: "#list-subject",
            pages: "#pages",
            items: 9,
            currentPage: 1,
            totalPage: 0,
            btnPrevious: ".goPrevious",
            btnNext: ".goNext",
            txtCurrentPage: "#currentPage",
            filterSubject: ".filter_subject",
            searchKeyName: ".search_key_name",
            pageInfo: ".pageInfo"
        };
        options = $.extend(defaults, options);
        // set cac gia tri cho lan vao dau tien thi phai hien ra All
        var categories = [];
        var prices = [];
        var keyName = "";
        var listSub = ["Hello"];
        var listLS = ["Hello"];
        var list = $(options.listSubject);
        var pages = $(options.pages);
        var btnPrevious = $(options.btnPrevious);
        var btnNext = $(options.btnNext);
        var txtCurrentPage = $(options.txtCurrentPage);
        var filterSubject = $(options.filterSubject);
        var searchKeyName = $(options.searchKeyName);
        var lblPageInfo = $(options.pageInfo);
        var account_id_raw = $("#account_id").val();
        init();
        //Ham khoi dong
        function init() {

            //Lay tong so tcorang
            getSubjectData();
            loadSubjectData(options.currentPage);
            console.log(listSub);
            console.log(listLS);
            console.log(account_id_raw);
            pageInfo();
            setCurrentPage(options.currentPage);
            //Gan su kien cho btnPrevious - btnNext - txtCurrentPage - filterCheckbox
            filterSubject.on("click", function (e) {
                filterSub(this);
                getSubjectData();
                options.currentPage = 1;
                loadSubjectData(options.currentPage);
                setCurrentPage(options.currentPage);
                pageInfo();
            });
            searchKeyName.on("input", function (e) {
                filterByKeyName(this);
                getSubjectData();
                options.currentPage = 1;
                loadSubjectData(options.currentPage);
                setCurrentPage(options.currentPage);
                pageInfo();
            });
            btnPrevious.on("click", function (e) {
                goPrevious();
                $(window).scrollTop(500);
            });
            btnNext.on("click", function (e) {
                goNext();
                $(window).scrollTop(500);
            });
            $(".latest").on("click", function (e) {
                sortSubjectByDate();
                $(window).scrollTop(500);
            });
            $(".cheapest").on("click", function (e) {
                sortSubjectByPrice1();
                $(window).scrollTop(500);
            });
            $(".most_expensive").on("click", function (e) {
                sortSubjectByPrice2();
                $(window).scrollTop(500);
            });
            $(".discount").on("click", function (e) {
                sortSubjectByPrice3();
                $(window).scrollTop(500);
            });
        }


        function goPrevious() {
            if (options.currentPage !== 1) {
                var p = options.currentPage - 1;
                loadSubjectData(p);
                setCurrentPage(p);
                options.currentPage = p;
                pageInfo();
            }
        }

        function goNext() {
            if (options.currentPage !== options.total) {
                var p = options.currentPage + 1;
                loadSubjectData(p);
                setCurrentPage(p);
                options.currentPage = p;
                pageInfo();
            }
        }

        function setCurrentPage(value) {
            txtCurrentPage.val(value);
            txtCurrentPage.text(value);
        }

        function sortSubjectByDate() {
            listSub.sort(function (a, b) {
                return b.created_date.localeCompare(a.created_date);
            });
            options.currentPage = 1;
            loadSubjectData(options.currentPage);
            setCurrentPage(options.currentPage);
            pageInfo();
        }

        function sortSubjectByPrice1() {
            listSub.sort(function (a, b) {
                return a.price - b.price;
            });
            options.currentPage = 1;
            loadSubjectData(options.currentPage);
            setCurrentPage(options.currentPage);
            pageInfo();
        }


        function sortSubjectByPrice2() {
            listSub.sort(function (a, b) {
                return b.price - a.price;
            });
            options.currentPage = 1;
            loadSubjectData(options.currentPage);
            setCurrentPage(options.currentPage);
            pageInfo();
        }





        function pageInfo() {
            lblPageInfo.text("Page " + options.currentPage + " of " + options.totalPage);
        }


        function filterByKeyName(param) {
            keyName = param.value;
        }

        function loadSubjectData(currPage) {
            var subjectList = "";
            if (listSub.length !== 0) {
                if (currPage === options.totalPage) {
                    for (var i = (currPage - 1) * options.items; i < listSub.length; i++) {
                        var hasBought = false;
                        for (var j = 0; j < listLS.length; j++) {
                            console.log(listLS.length);
                            var s = listSub[i];
                            console.log("listSub[i]:");
                            console.log(s);
                            var discount = s.discount;
                            var price = s.price;
                            var account_id = parseInt(account_id_raw);
                            var ls = listLS[j];
                            console.log(ls);
                            if (account_id === ls.learner_id && s.subject_id === ls.subject_id && ls.active === 1) {
                                hasBought = true;

                            }
                        }
                        subjectList += `<div class="col-lg-4 mb-5">
                                        <div class="card border-0 bg-light shadow-sm pb-2">
                                        <img class="card-img-top mb-2" src="data:image/jpeg;base64,${s.image}" alt="">
                                        <div class="card-body text-center">
                                        <h4 class="card-title">${s.subject_name}</h4>
                                        </div>
                                        <div class="card-footer bg-transparent py-4 px-5">
                                        <div class="row border-bottom">
                                        <div class="col-6 py-1 text-right border-right"><strong>Lecturer 👩‍🏫</strong></div>
                                        <div class="col-6 py-1"> ${s.lecturer_name} / ${s.lecturer_id} </div>
                                        </div>
                                        <div class="row border-bottom">
                                        <div class="col-6 py-1 text-right border-right"><strong> Date</strong></div>
                                        <div class="col-6 py-1">${s.created_date}</div>
                                        </div>
                                        <div class="row border-bottom">
                                        <div class="col-6 py-1 text-right border-right"><strong>Discount</strong></div>
                                        <div class="col-6 py-1">${s.discount}%</div>
                                        </div>
                                        <div class="row border-bottom">
                                        <div class="col-6 py-1 text-right border-right"><strong> Fee 💵</strong></div>`;

                        if (discount > 0) {
                            subjectList += '  <div class="col-6 py-1">';
                            subjectList += '  <span>';
                            subjectList += '  <del style="font-size: 16px;">$' + price + '</del>';
                            subjectList += '  <span style="color: red; font-size: 10px; font-weight: bold; padding: 1px 2px; border: 1px solid red; border-radius: 3px;">' + discount + '%</span>';
                            subjectList += '  <span style="color: green; font-weight: bold; font-size: 18px;">$' + (price * (1 - discount / 100)) + '</span>';
                            subjectList += '  </span>';
                            subjectList += '  </div>';
                        } else {
                            subjectList += `<div style="color: green; font-weight: bold;font-size: 18px" class="col-6 py-1">$${s.price}</div>`;
                        }
                        subjectList += `</div>
                                        <div class="row border-bottom">
                                        <div class="col-6 py-1 text-right border-right"><strong>Sold</strong></div>
                                        <div class="col-6 py-1">${s.sold}</div>
                                        </div>
                                        <div class="row border-bottom">
                                        <div class="col-6 py-1 text-right border-right"><strong> Learners👨‍🎓</strong></div>
                                        <div class="col-6 py-1">${s.sold}</div>
                                        </div>
                                        <div class="row border-bottom">
                                        <div class="col-6 py-1 text-right border-right"><strong>Rate ⭐</strong></div>
                                        <div class="col-6 py-1">${s.rate_subject}</div>
                                        </div>
                                        </div>
                                        <a href="subjectdetail?category_id=${s.category_id}&subject_id=${s.subject_id}" class="btn btn-primary px-4 mx-auto mb-4">View</a>`;

                        if (hasBought) {
                            subjectList += `<a href="#" class="disabled btn btn-primary px-4 mx-auto mb-4 btn fa fa-shopping-bag">Bought Subject</a>
                                        </div>
                                        </div>`;
                        } else {
                            subjectList += `<a href="buysubject?category_id=${s.category_id}&subject_id=${s.subject_id}" class="btn btn-primary px-4 mx-auto mb-4 btn fa fa-shopping-bag">Add To Cart</a>
                                        </div>
                                        </div>`;
                        }
                        list.html(subjectList);
                        pages.show();
                        hasBought = false;
                    }
                } else {
                    for (var i = (currPage - 1) * options.items; i < (currPage - 1) * options.items + options.items ; i++) {
                        var hasBought = false;
                        for (var j = 0; j < listLS.length; j++) {
                            console.log(listLS.length);
                            var s = listSub[i];
                            console.log("listSub[i]:");
                            console.log(s);
                            var discount = s.discount;
                            var price = s.price;
                            var account_id = parseInt(account_id_raw);
                            var ls = listLS[j];
                            console.log(ls);
                            if (account_id === ls.learner_id && s.subject_id === ls.subject_id && ls.active === 1) {
                                hasBought = true;

                            }
                        }
                        subjectList += `<div class="col-lg-4 mb-5">
                                        <div class="card border-0 bg-light shadow-sm pb-2">
                                        <img class="card-img-top mb-2" src="data:image/jpeg;base64,${s.image}" alt="">
                                        <div class="card-body text-center">
                                        <h4 class="card-title">${s.subject_name}</h4>
                                        </div>
                                        <div class="card-footer bg-transparent py-4 px-5">
                                        <div class="row border-bottom">
                                        <div class="col-6 py-1 text-right border-right"><strong>Lecturer 👩‍🏫</strong></div>
                                        <div class="col-6 py-1"> ${s.lecturer_name} / ${s.lecturer_id} </div>
                                        </div>
                                        <div class="row border-bottom">
                                        <div class="col-6 py-1 text-right border-right"><strong> Date</strong></div>
                                        <div class="col-6 py-1">${s.created_date}</div>
                                        </div>
                                        <div class="row border-bottom">
                                        <div class="col-6 py-1 text-right border-right"><strong>Discount</strong></div>
                                        <div class="col-6 py-1">${s.discount}%</div>
                                        </div>
                                        <div class="row border-bottom">
                                        <div class="col-6 py-1 text-right border-right"><strong> Fee 💵</strong></div>`;

                        if (discount > 0) {
                            subjectList += '  <div class="col-6 py-1">';
                            subjectList += '  <span>';
                            subjectList += '  <del style="font-size: 16px;">$' + price + '</del>';
                            subjectList += '  <span style="color: red; font-size: 10px; font-weight: bold; padding: 1px 2px; border: 1px solid red; border-radius: 3px;">' + discount + '%</span>';
                            subjectList += '  <span style="color: green; font-weight: bold; font-size: 18px;">$' + (price * (1 - discount / 100)) + '</span>';
                            subjectList += '  </span>';
                            subjectList += '  </div>';
                        } else {
                            subjectList += `<div style="color: green; font-weight: bold;font-size: 18px" class="col-6 py-1">$${s.price}</div>`;
                        }
                        subjectList += `</div>
                                        <div class="row border-bottom">
                                        <div class="col-6 py-1 text-right border-right"><strong>Sold</strong></div>
                                        <div class="col-6 py-1">${s.sold}</div>
                                        </div>
                                        <div class="row border-bottom">
                                        <div class="col-6 py-1 text-right border-right"><strong> Learners👨‍🎓</strong></div>
                                        <div class="col-6 py-1">${s.sold}</div>
                                        </div>
                                        <div class="row border-bottom">
                                        <div class="col-6 py-1 text-right border-right"><strong>Rate ⭐</strong></div>
                                        <div class="col-6 py-1">${s.rate_subject}</div>
                                        </div>
                                        </div>
                                        <a href="subjectdetail?category_id=${s.category_id}&subject_id=${s.subject_id}" class="btn btn-primary px-4 mx-auto mb-4">View</a>`;

                        if (hasBought) {
                            subjectList += `<a href="#" class="disabled btn btn-primary px-4 mx-auto mb-4 btn fa fa-shopping-bag">Bought Subject</a>
                                        </div>
                                        </div>`;
                        } else {
                            subjectList += `<a href="buysubject?category_id=${s.category_id}&subject_id=${s.subject_id}" class="btn btn-primary px-4 mx-auto mb-4 btn fa fa-shopping-bag">Add To Cart</a>
                                        </div>
                                        </div>`;
                        }
                        list.html(subjectList);
                        pages.show();
                        hasBought = false;
                    }

                }
            } else {
                var notice = `<h1>No product available</h1>`;
                list.html(notice);
                pages.hide();
            }
        }


        function getSubjectData() {
            listSub = [];
            listLS = [];
            var account_id = parseInt(account_id_raw);
            var data = {
                string1: categories.toString(),
                string2: prices.toString(),
                key: keyName,
                accid: account_id
            };
            $.ajax({
                async: false,
                url: "/holalearn/filtersubject",
                type: "GET",
                dataType: "json",
                data: data,
                success: function (response) {
                    options.totalPage = response.numberOfPage;
                    listSub = JSON.parse(response.list);
                    listLS = JSON.parse(response.listLS);
                }
            });
        }


        function filterSub(obj) {
            var cate = document.getElementsByName('category');
            var pric = document.getElementsByName('price');
            categories.splice(0, categories.length);
            prices.splice(0, prices.length);
            if ((obj.id === 'category-all') && (cate[0].checked === true))
            {
                for (var i = 1; i < cate.length; i++) {
                    cate[i].checked = false;
                    categories.push(cate[i].value);
                }

            } else {
                for (var i = 1; i < cate.length; i++) {
                    if (cate[i].checked === true) {
                        cate[0].checked = false;
                        break;
                    }
                }
                if (cate[0].checked === true) {
                    for (var i = 1; i < cate.length; i++) {
                        categories.push(cate[i].value);
                    }
                }
                for (var i = 1; i < cate.length; i++) {
                    if (cate[i].checked === true) {
                        categories.push(cate[i].value);
                    }
                }

                if (categories.length === 0) {
                    cate[0].checked = true;
                    for (var i = 1; i < cate.length; i++) {
                        cate[i].checked = false;
                        categories.push(cate[i].value);
                    }
                }
            }



            if ((obj.id === 'price-all') && (pric[0].checked === true))
            {
                for (var i = 1; i < pric.length; i++) {
                    pric[i].checked = false;
                    prices.push(pric[i].value);
                }

            } else {

                for (var i = 1; i < pric.length; i++) {
                    if (pric[i].checked === true) {
                        pric[0].checked = false;
                        break;
                    }
                }

                if (pric[0].checked === true) {
                    for (var i = 1; i < pric.length; i++) {
                        prices.push(pric[i].value);
                    }
                }
                for (var i = 1; i < pric.length; i++) {
                    if (pric[i].checked === true) {
                        prices.push(pric[i].value);
                    }
                }
                if (prices.length === 0) {
                    pric[0].checked = true;
                    for (var i = 1; i < pric.length; i++) {
                        pric[i].checked = false;
                        prices.push(pric[i].value);
                    }

                }
            }


        }

    };
})(jQuery);
$(document).ready(function (e) {
    var obj = {};
    $("#subject").zPagingSubject(obj);
});
