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
var btnAddPost = document.getElementById("btnAddPost");



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

btnAddPost.onclick = function() {
    modalAddPost.style.display = "block";
}
window.onclick = function(event) {
    if (event.target == modalFullName) {
        modalFullName.style.display = "none";
    }
    else if(event.target == modalChangePass){
        modalChangePass.style.display = "none";
    }
    else if(event.target == modalChangeEmail){
        modalChangeEmail.style.display = "none";
    }
    else if(event.target == modalChangeDOB){
        modalChangeDOB.style.display = "none";
    }
    else if(event.target == modalAddPost){
        modalAddPost.style.display = "none";
    }
    else if(event.target == modalDeletePost){
        modalDeletePost.style.display = "none";
    }
    else if(event.target == modalChangePostName){
        modalChangePostName.style.display = "none";
    }
    else if(event.target == modalChangeTinyDes){
        modalChangeTinyDes.style.display = "none";
    }
    else if(event.target == modalChangeFullDes){
        modalChangeFullDes.style.display = "none";
    }
    else if(event.target == modalChangeCategory){
        modalChangeCategory.style.display = "none";
    }
    else if(event.target == modalChangeImage){
        modalChangeImage.style.display = "none";
    }
}
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