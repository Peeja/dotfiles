// Turn the user field into a text field, instead of a password field, so that
// LassPass can fill it in.
if (window.name == "main") {
  $("input[name='user']").get(0).type = "text";
}
