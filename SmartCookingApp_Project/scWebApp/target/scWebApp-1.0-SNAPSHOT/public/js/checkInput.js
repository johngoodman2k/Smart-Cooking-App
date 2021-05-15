function checkEmpty(element){
    const text = $(element).val();
    if(text.length == 0){
        alert('not empty');
        return false;
    }
    return true;
}
function checkUsername(contextPath){
    $.getJSON(contextPath+'/Account/IsExistUsername?username='+$('#username').val(),function(data){
        if(data == true)
        {
            alert('username already exists')
            return false;
        }
    });
        if(!/^[a-zA-Z0-9_]{4,50}$/g.test($('#username').val())){
            alert('cannot contain special characters and 4<length<50')
            return false;
        }
        return true;
}
function checkPassword(passwordSecurityPoint){
   if(passwordSecurityPoint<2){
       alert('password is not security');
       return false;
   }
   return true;
}
function checkConfirm(){
    if($('#confirm').val().length === 0) return;
    if ($('#confirm').val() !== $('#password').val()){
        alert('not equal password');
        return false;
    }
    return true;
}
function checkFullName()
{
    if(!/^[a-zA-Z\s]{4,50}$/g.test($('#name').val())){
        alert('invalid');
        return false;
    }
    return true;
}
function checkEmail(contextPath)
{
    $.getJSON(contextPath+'/Account/IsExistEmail?email='+$('#email').val(),function(data){
        if(data === true)
        {
            alert('email already exists');
            return false;
        }
    });
    if(!/^[a-zA-Z0-9_\.]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$/g.test($('#email').val())){
        alert('invalid Email');
        return false;
    }
    return true;
}

