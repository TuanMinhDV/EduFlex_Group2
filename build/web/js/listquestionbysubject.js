/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

(function ($){
    $.fn.zQuestionList = function(options){
        var defaults = {
            subjectId: '#subject_id',
            courses: '.course',
            chapters: '.chapter',
            questiontable: '#questiontable'
        };
        options = $.extend(defaults, options);
        
        var course = [];
        var chapter = [];
        
        var subjectId = $(options.subjectId);
        var courses = $(options.course);
        var chapters = $(options.chapters);
        var table = $(options.questiontable);
        
        init();
        function init(){
            getQuestionData();
            
        }
        
        //get question data
        function getQuestionData() {
                let dataSend = {
                    sid: subjectId,
                    course: course,
                    chapter: chapter
                };
                $.ajax({
                    async: false,
                    url: "/holalearn/questionbank",
                    type: 'post',
                    dataType: 'json',
                    data: dataSend,
                    success: function (data) {
                        questionData = data;
                        console.log(questionData);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(errorThrown);
                    }
                });
            }
        
    };
});




