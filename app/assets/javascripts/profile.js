function deletePostConfirmation(post_id) {
    if (confirm("are you sure to delete this post ?")) {
        window.location.href = `/post/delete/${post_id}`;
    }
}