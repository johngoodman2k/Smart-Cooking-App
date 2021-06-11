// Get the modal

var modalFullName = document.getElementById("modalFullName");
var modalChangePass = document.getElementById("modalChangePass");
var modalChangeEmail = document.getElementById("modalEmail");
var modalChangeDOB = document.getElementById("modalDOB");
var modalAddPost =document.getElementById("modalAddPost");
var modalDeletePost = document.getElementById("modalDeletePost");
var modalChangePostName = document.getElementById("modalChangePostName");
var modalChangeTinyDes = document.getElementById("modalChangeTinyDes");
var modalChangeFullDes = document.getElementById("modalChangeFullDes");
var modalChangeCategory = document.getElementById("modalChangeCategory");
var modalChangeImage = document.getElementById("modalChangeImage");


// Get the button that opens the modal
var btnChangeName = document.getElementById("btnChangeName");
var btnChangePass = document.getElementById("btnChangePass");
var btnChangeEmail = document.getElementById("btnChangeEmail");
var btnChangeDOB = document.getElementById("btnChangeDOB");

var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal
btnChangeName.onclick = function() {
    modalFullName.style.display = "block";
}
btnChangePass.onclick = function(){
    modalChangePass.style.display= "block"
}

btnChangeEmail.onclick = function() {
    modalChangeEmail.style.display = "block";
}

btnChangeDOB.onclick = function() {
    modalChangeDOB.style.display = "block";
}



$('.delete-cat').on('click', function () {
    $('.delete-cat-modal  #deleteCatID').val($(this).parent().attr('catID'));
    $('.delete-cat-modal .p-cat-name').html($(this).parent().attr('catName'));
    $('.delete-cat-modal').css('display', 'block');
})
$('.add-cat').on('click', function () {
    $('.edit-cat-modal .catOrParentID').val($(this).parent().attr('catID'));
    $('.edit-cat-modal .btn-update-cat').css('display', 'none');
    $('.edit-cat-modal .btn-add-cat').css('display', 'block');
    $('.edit-cat-modal').css('display', 'block');
})
$('.update-cat').on('click', function () {
    $('.edit-cat-modal .catOrParentID').val($(this).parent().attr('catID'));
    $('.edit-cat-modal .btn-update-cat').css('display', 'block');
    $('.edit-cat-modal .btn-add-cat').css('display', 'none');
    $('.edit-cat-modal').css('display', 'block');
})
$('.delete-post').on('click', function () {
    $('.delete-post-modal  #postDeleteID').val($(this).parent().attr('postID'));
    $('.delete-post-modal .p-cat-name').html($(this).parent().attr('postName'));
    $('.delete-post-modal').css('display', 'block');
})
$('.edit-post-disable').on('click',function() {
    $('#postDisableID').val($(this).parent().attr('postID'));
    $('.disable-post-modal').css('display', 'block');
})
$('.edit-post-enable').on('click',function() {
    $('#postEnableID').val($(this).parent().attr('postID'));
    $('.enable-post-modal').css('display', 'block');
})
$('.delete-user').on('click', function () {
    $('.delete-user-modal #userDeleteID').val($(this).parent().attr('userID'));
    console.log($('.delete-user-modal  #userDeleteID').val());
    $('.delete-user-modal .p-cat-name').html($(this).parent().attr('userName'));
    $('.delete-user-modal').css('display', 'block');
})
$('.edit-user-enable').on('click',function() {
    $('#userEnableID').val($(this).parent().attr('userID'));
    $('.enable-user-modal').css('display', 'block');
})
$('.edit-user-disable').on('click',function() {
    $('#userDisableID').val($(this).parent().attr('userID'));
    $('.disable-user-modal').css('display', 'block');
})
function checkFullName(element) {
    if ($(element).val() == 0) {
        alert("Full name is not empty");
        return false;
    }
    if (!/^[a-z0-9A-Z\s]{4,50}$/g.test($(element).val())) {
        alert("invalid Full Name");
        return false;
    }
    return true;
}

function checkEmail(element) {
    if ($(element).val() == 0) {
        alert("Email is not empty");
        return false;
    }

    // $.getJSON(contextPath+'/Account/IsExistEmail?email='+$(element).val(),function(data){
    //
    // });
    if (!/^[a-zA-Z0-9_\.]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$/g.test($(element).val())) {
        alert('invalid Email');
        return false;
    }
    return true;
}
function checkUsername(element) {
    if ($(element).val() == 0) {
        alert('Username is not empty');
        return false;
    }
    // $.getJSON(contextPath+'/Account/IsExistUsername?username='+$(element).val(),function(data){
    // });
    if (!/^[a-zA-Z0-9_]{4,50}$/g.test($(element).val())) {
        alert('invalid Username')
        return false;
    }
    return true;
}
function checkPassword(element,passwordSecurityPoint){
   if(passwordSecurityPoint<2){
       alert('password is not security');
       return false;
   }
   return true;
}