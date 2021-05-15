function passwordSecurityPoint(element)
{
    let password = $(element).val();
    let point = 0;
    const special = new RegExp("[~!@#$%^&*()\_+`=<>,\.:'{}()\"\-?\/]");
    if (special.test(password)&&/[^0-9]/g.test(password))
        point++;
    if(/[A-Z]/g.test(password))
        point++;
    if(/[0-9]/g.test(password))
        point++;
    if (password.length > 10)
        point++;
    if(password.length < 6)
        point = 0;
    return point;
}
