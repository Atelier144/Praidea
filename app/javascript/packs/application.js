// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import "bootstrap"
import "../src/application.scss"
import "@fortawesome/fontawesome-free/js/all"

$(document).ready(function () {
    $("#js-twitter-auto").click();

    $("header .user-image").click(function () {
        $("header .popup-menu").show();
    });

    $("header .popup-menu .close").click(function () {
        $("header .popup-menu").hide();
    });

    $("#js-top-background").children("h1").delay(1000).fadeIn(1000);
    $("#js-top-background").children("p").delay(2000).fadeIn(1000);

    $(".stamps-open").click(function () {
        $(this).hide();
        $(this).parent().parent().children(".praise-stamps").show();
    });

    $(".stamps-close").click(function () {
        $(this).parent().hide();
        $(this).parent().parent().children(".praises").children(".stamps-open").show();
    });

    $("#js-idea-form-image").on("change", function () {
        var file = $(this).prop("files")[0];
        if (!(file === undefined)) {
            var fileNameRegExp = /\.(jpg|jpeg|png|gif|JPG|JPEG|PNG|GIF)$/;
            if (!(file.type.match("image.*"))) {
                alert("画像ファイルをアップロードしてください");
                $(this).val(undefined);
            } else if (!(fileNameRegExp.test(file.name))) {
                alert("gif、png、jpgのいずれかの画像をアップロードしてください");
                $(this).val(undefined);
            } else if (file.size > 4194304) {
                alert("4MB以内の画像ファイルをアップロードしてください");
                $(this).val(undefined);
            }
        }
    });

    $("#js-profile-icon-form-image").on("change", function () {
        var file = $(this).prop("files")[0];
        if (!(file === undefined)) {
            var fileNameRegExp = /\.(jpg|jpeg|png|gif|JPG|JPEG|PNG|GIF)$/;
            if (!(file.type.match("image.*"))) {
                alert("画像ファイルをアップロードしてください");
                $(this).val(undefined);
                $("#js-profile-icon").attr("src", $("#js-profile-icon-current").attr("src"));
                $("#js-profile-icon-submit").prop("disabled", true);
            } else if (!(fileNameRegExp.test(file.name))) {
                alert("gif、png、jpgのいずれかの画像をアップロードしてください");
                $(this).val(undefined);
                $("#js-profile-icon").attr("src", $("#js-profile-icon-current").attr("src"));
                $("#js-profile-icon-submit").prop("disabled", true);
            } else if (file.size > 2097152) {
                alert("2MB以内の画像ファイルをアップロードしてください");
                $(this).val(undefined);
                $("#js-profile-icon").attr("src", $("#js-profile-icon-current").attr("src"));
                $("#js-profile-icon-submit").prop("disabled", true);
            } else {
                var reader = new FileReader();
                reader.onload = function () {
                    $("#js-profile-icon").attr("src", reader.result);
                }
                reader.readAsDataURL(file);
                $("#js-profile-icon-submit").prop("disabled", false);
            }
        } else {
            $("#js-profile-icon").attr("src", $("#js-profile-icon-current").attr("src"));
            $("#js-profile-icon-submit").prop("disabled", true);
        }
    });

    $("#js-settings-resign").click(function () {
        var flag = confirm("本当に退会しますか？");
        if (flag) {
            $("#js-settings-resign-accepted").click();
        }
    });

    $(".page-top").click(function () {
        $("html, body").animate({
            "scrollTop": 0
        }, "slow");
    });

    $(".flash").delay(2000).fadeOut();
});
