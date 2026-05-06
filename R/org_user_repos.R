#' @rdname org_details
#'
#' @param user Character. One or more GitHub usernames.
#' @param prefix Character. String to prepend to each user name.
#' @param suffix Character. String to append to each user name.
#'
#' @export
#'
org_user_repos = function(org, user, prefix = "", suffix = "") {
  arg_is_chr_scalar(org, prefix, suffix)
  arg_is_chr(user)

  paste0(org, "/", prefix, user, suffix)
}
