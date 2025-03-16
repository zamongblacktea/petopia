/**
 * 
 */


	function find() {
		let search = $("#search").val();
		let search_text = $("#search_text").val().trim();
		let rsv_in = $("#rsv_in").val();
		let rsv_out = $("#rsv_out").val();
		let room_type = $("#room_type").val();

		let pet_type = $("#pet_type").val();

		let mem_idx = $("#mem_idx").val();

		location.href = "../rsv/list.do?search=" + search + "&search_text="
				+ encodeURIComponent(search_text, "utf-8") + "&rsv_in="
				+ rsv_in + "&rsv_out=" + rsv_out + "&mem_idx=" + mem_idx
				+ "&room_type=" + room_type + "&pet_type=" + pet_type;

	}


	$(document).ready(function() {
		if ("${ not empty param.search }" == "true") {

			$("#search").val("${ param.search}");

		}

		if ("${ param.search eq 'all'}" == "true") {

			$("#search_text").val("");

		}

		if ("${ not empty param.rsv_in }" == "true") {

			$("#rsv_in").val("${ param.rsv_in}");

		}

		if ("${ not empty param.rsv_out }" == "true") {

			$("#rsv_out").val("${ param.rsv_out}");

		}

		if ("${ not empty param.room_type }" == "true") {

			$("#room_type").val("${ param.room_type}");

		}
		if ("${ not empty param.pet_type }" == "true") {

			$("#pet_type").val("${ param.pet_type}");

		}
	});



