var facebooker = {
  login: function(path, permissions) {
    var url = document.location.protocol +
      '//' + document.location.host + path;

    FB.login(function(response) {
      if (response.session) {
        window.location = url;
      }
    }, permissions || {});
    return false;
  },

  logout: function(path) {
  	path = path || '/logout';
    FB.logout(function(response) {
      if (response) document.location = path;
    });
  }
};
