function addmember() {
	var pName = $("#pName").val();
    var pClass = $("#pClass").val();
    var rank = $("#rank").val();
    var joinDate = $("#joinDate").val();
    
    console.log(pName + pClass + rank + joinDate);

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