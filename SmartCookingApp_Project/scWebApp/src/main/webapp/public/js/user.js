$('.delete-post-btn').on('click',function(e)
{
    $('#deletePostID').val($(this).parent().attr('postID'));
    console.log($('#deletePostID').val());
    $('.delete-post-modal .p-post-name').html($(this).parent().attr('postName'));
    $('.delete-post-modal').css('display', 'block');
})
$(".edit-postname-btn").on('click',function(e){
    $('#editPostID').val($(this).parent().attr('postID'));
    $(".edit-postname-modal").css('display', 'block');
})
$(".edit-tinydes-btn").on('click',function(e){
    $('#editTinydesID').val($(this).parent().attr('postID'));
    $(".edit-tinydes-modal").css('display', 'block');
})
$(".edit-fulldes-btn").on('click',function(e){
    $('#editFullDesID').val($(this).parent().attr('postID'));
    $(".edit-fulldes-modal").css('display', 'block');
})
$(".edit-category-btn").on('click',function(e){
    $('#editCategoryID').val($(this).parent().attr('postID'));
    $(".edit-category-modal").css('display', 'block');
})
$(".edit-image-btn").on('click',function(e){
    $('#editImageID').val($(this).parent().attr('postID'));
    $(".edit-image-modal").css('display', 'block');
})