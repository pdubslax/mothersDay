
// Use Parse.Cloud.define to define as many cloud functions as you want.
// For example:
Parse.Cloud.define("hello", function(request, response) {
  response.success("Hello world!");
});




Parse.Cloud.job("pushUsers", function(request, status) {
  // Set up to modify user data
  var query = new Parse.Query(Parse.Installation);

	Parse.Push.send({
	  where: query, // Set our Installation query
	  data: {
	    alert: "Hello Mother! Thank you for everything you have done. Another note is ready for you now!"
	  }
	}, {
	  success: function() {
	    // Push was successful
	    status.success("push successful");
	  },
	  error: function(error) {
	    // Handle error
	    status.error("push failed");
	  }


	});
});
