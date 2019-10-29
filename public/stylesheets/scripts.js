function addmember() {
	var pName = $("#pName").val();
    var pClass = $("#pClass").val();
    var rank = $("#rank").val();
    var joinDate = $("#joinDate").val();

	var params = {
		pName: pName,
        pClass: pClass,
        rank: rank,
        joinDate: joinDate
   };

	$.post("/addmember", params, function(result) {
		if (result && result.success) {
            console.log("member added.");
        } else {
            console.log("Error");
        }
    });
}

function addraid() {
	var rName = $("#rName").val();
    var rDate = $("#rDate").val();

	var params = {
		rName: rName,
        rDate: rDate
   };

	$.post("/addraid", params, function(result) {
		if (result && result.success) {
            console.log("raid added.");
        } else {
            console.log("Error");
        }
    });
}