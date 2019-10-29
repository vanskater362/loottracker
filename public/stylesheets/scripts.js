function addmember() {
	var name = $("#name").val();
    var Class = $("#class").val();
    var rank = $("#rank").val();
	var date = $("#date").val();

	var params = {
		name: name,
        Class: Class,
        rank: rank,
        date: date
   };

	$.post("/addmember", params, function(result) {
		if (result && result.success) {
            console.log("member added.");
        } else {
            console.log("Error");
        }
    });
}